Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289DC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 22:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9FCD413BA;
	Tue, 28 Jan 2025 22:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYWuU_nhEimN; Tue, 28 Jan 2025 22:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD06F413FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD06F413FB;
	Tue, 28 Jan 2025 22:36:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF8CC20
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC2841416
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li8m-ut86kj1 for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 22:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E42D0413B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42D0413B1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E42D0413B1
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 22:36:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A54F619F57B;
 Tue, 28 Jan 2025 23:36:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49528])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 23:36:43 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 23:36:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <921b79be640ca6b1613c403d65bc65e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738103807;
 bh=9oU+lnn4OcCHNWZuheiv5XBZcSXnybE7JkKska54NKE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PxuotvE4Hqutd86J23pS6OF1CNhTkrAQItZvHAGxa1wb7yqNW7p5o3BXTIxUozt9f
 ayEJ4FvKwJxn1YfV7DGfYp2mbLVwIbO+oTU2z9F7YP/GtQZ/FtqJz8XGxfOTNnGN+t
 n0gsw4NUg2pTyksWnHI1/ofKb12o7XRA8I/8s/kO9Oeim7FwqLVw8V/+qjA5YNc2KH
 xzewauahy/wsUrjV2hnfs8KG72xLlb2JBX+DwQ/bcWKx9xqIyT1oEmSE7drLbhHPeB
 uN/PR+HoIQxJ/vAHSCQGKNIdkUzJXf1ue9jQaBHzsoe8J4eN4NW++QSlXTlG1Hvfla
 DZ40EehQPfG3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PxuotvE4
Subject: Re: [Buildroot] [PATCH v8 01/10] package/cpuinfo: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/01/2025 18:01, James Hilliard wrote:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package is required by tensorflow-lite.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
