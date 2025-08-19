Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A27CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 02:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D2C66077B;
	Tue, 19 Aug 2025 02:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4uy6CVEnmeZ; Tue, 19 Aug 2025 02:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6336076D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E6336076D;
	Tue, 19 Aug 2025 02:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB082E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCBB340830
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_ik3lVyjNcf for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 02:15:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB7F640816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7F640816
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB7F640816
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:15:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 140DF13F86A;
 Tue, 19 Aug 2025 04:15:11 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 04:15:11 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 04:15:11 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250818190822.11759-1-dario.binacchi@amarulasolutions.com>
References: <20250818190822.11759-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f91d8f607b0a360a1bfc5cbe189c1c32@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755569714;
 bh=hNeMN83DDs9TcXW46IHbqPcOfqHWZ3JgzA6pUsu/AGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LB+o4drzWIiaLFm/4S1Rpc7HaVulIFa0e8UgFESPATd4FxFPaoqVGGCX5Jqapjzst
 EeRQhyjECOAeIEEft09+EaPl70Nze6bNCqhz3ihSQ0gh9v/JpIoCY+chjabd6bYa4H
 cQDQofqmAXLPdjVXx2lNvKDqJBDyfE6SfbnJOdkcMAFmbOCseMV0nOi6jrME0k7KLG
 9orf8LMURMCMH3KVAPjMMA79RUMBCGfrY3VhN5jAv1okknWT/RW4+9kygzMXo9QUEg
 gPCUdrWxP2MaBMNccVn5fAT7WAgPOo63lhlV1UzNko0vXYyuA5VOxzzHSIH4qMEgxC
 B2yXSAdv5Q4zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LB+o4drz
Subject: Re: [Buildroot] [next] package/uuu: bump to version 1.5.222
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/08/2025 21:08, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.222
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
