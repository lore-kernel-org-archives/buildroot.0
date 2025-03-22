Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA93C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 11:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81ACF60886;
	Sat, 22 Mar 2025 11:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1P8NiDjIJmS; Sat, 22 Mar 2025 11:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE31B61AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE31B61AF2;
	Sat, 22 Mar 2025 11:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2D7E2
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61AB84253F
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2rbykKn7ueJ for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 11:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9952D4252B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9952D4252B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9952D4252B
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:58:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E803B780316;
 Sat, 22 Mar 2025 12:58:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Mar 2025 12:58:49 +0100
MIME-Version: 1.0
Date: Sat, 22 Mar 2025 12:58:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250107093917.3217670-2-troglobit@gmail.com>
References: <20250107093917.3217670-1-troglobit@gmail.com>
 <20250107093917.3217670-2-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <46c37e0c83861598d030f6a85309fae3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742644731;
 bh=uEYA+dCmSkIuutuMAXRSPXtMLQaNCQj1a3MQca5QovA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L349Gvo97s/SATctWVNCaAMOqcaBnUxvEjDmYDEwjZbs2/PZDVWOVM7b/FLV4c6IN
 XxYyx2uL6UKR0t/F0BgZjajQdgrOcWetzYljnbsC/khvck4g3c0+0cl/EpDAkLpDKj
 FPO9nbWQnRcNkYwsI40/eD/YMoAmWDcP7Uu4BvZ4M+bn3Zu7A/45oHQj/xEznjqCmk
 QiRT3xQ6iN/xtaIkIAM+gUN5pA2H3zOY09KIWZM4c/GB9ZePDwqOYdD2pY//L1uxIf
 DUEPC74QCFMBYVvsIHqblPxokohcFjqfym1uya3Uvv6C4L+zdYPYFem6Q5A83iTcIm
 Q+KAOOX/7ay2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=L349Gvo9
Subject: Re: [Buildroot] [PATCH 1/1] package/lowdown: new package
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

On 07/01/2025 10:39, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
