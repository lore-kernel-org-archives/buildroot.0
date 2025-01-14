Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D041E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D8582194;
	Tue, 14 Jan 2025 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6x_sSD15jUx; Tue, 14 Jan 2025 20:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3E383B95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3E383B95;
	Tue, 14 Jan 2025 20:57:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C85C2B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A783A40102
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVna3DcD8keb for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5739400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5739400D1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5739400D1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 80291B00571;
 Tue, 14 Jan 2025 21:57:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52516])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:57:12 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:57:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113185257.3026604-1-james.hilliard1@gmail.com>
References: <20250113185257.3026604-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9af7b450a1ae51d4689839cfd6eba3c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888233;
 bh=Klaz0AvDKl7H1v/x8TgbniwdiLUlWWdv6S0w1e4FoYw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CEZTw4PchiTjGKFvvA6fV5FA6dG78dnn8X2GW655OeiER8AROwzObQrQfCcW3Ui5M
 eBd+9PlnzWSPJguWmrAYDiA3EAbt8e0cu1JBuuWai1+V1/s0kUabK70wwXXGebd2Mi
 8/jOAa0dnlDFjFVT1KYeAf2pVZAxhbN3UdjRpPZ4zty6tTAXIGr0zIbFE2cG1sHh61
 IPEAyDpNLdRCfpkeyQ9qYFxjdeSJRPEP0Ql7ILUNJ7ClFjaTrAtxMeHLd5VeQL7IEK
 K43ul4nZ028dRaevvKUoyaNCARCixlEKN1LkYKWLr318vw0ez5F8kcjK8MyEsFXeqC
 a2OfyL7kc5LKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CEZTw4Pc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump
 to version 1.69.0
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

On 13/01/2025 19:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
