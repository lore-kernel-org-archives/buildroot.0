Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E985FE92FDB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61D240792;
	Mon, 29 Dec 2025 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lGhqd-jbpZH; Mon, 29 Dec 2025 20:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8B6407AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767041275;
	bh=/UE5BDt1lRfM0MrvOV5P7+QI3CuHEVDYx6HN6TS2AcQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SAgS9iASCUb26AB6D9QkNNbHGVR3VMIlD8t6zcyz44TixJzEFcGEikiyBmDmXY5EA
	 KHIAlTPIDm0dDYN5YrnCadG7IQkmtwcLOGNot7BMjtAdKbg/FdIGcbjPOeH3e8CZz7
	 nqv3qAkNPqD3QQZbWEYNr14Wubde8osbcHYUm8jzjCSLai1N06nNxAwZYRNn2Anlji
	 YYbGqfm3PsuC9uMCuDMYKzuOoZ7OlIZDe4/eQt3nxLEvJVrLIE19VJw1ZfQgTToSmS
	 LAqBm9d6WQHCU5fwZ6U7uPnVvDxV66Wdo7BL055ZJzl94ulmYX59X7JxjMC10txuQk
	 tjiLbKeA6XhDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8B6407AD;
	Mon, 29 Dec 2025 20:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D93BD35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFC8C40070
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBNJbIfIdKJp for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 20:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7734B4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7734B4005B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7734B4005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 20:47:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7371119F5AF;
 Mon, 29 Dec 2025 21:47:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 21:47:48 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 21:47:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251229180212.3550356-1-bernd@kuhls.net>
References: <20251229180212.3550356-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <0336f94116f66e95e76d26407c3946a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767041270;
 bh=EVfXPqe2Gw02sgMwVYfoSt+yHi0R7oMoLFkw4cfJgQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xkj/PG+OFcN9ITwVOCCUZ9vYlyXg3iKiLOZ2pffz5Hq+uhIAV2k9LVWJ44RupP7bN
 chTemQXai16jFZu+L2LtutBvqm2MJmRN50sAsXPV4aAhleZA8jMJkWkR8oDsEcUVV9
 UguqbhK3YSHKkGaA5XxIlBYWrcB9nrHm8ihqqNbw9cQYkNnJHUl6+2n0crtYG04lBf
 PoEVgwH+dkitZYtA1Scs4wGUf+0AbwysELt2EeNm/rxYkfE3i6gsPh49p5tCxLVpZM
 blT527FUiE5U+wdF1JQU32FYDLVTG4XEbRc3vM+e1lq7QPVDJMkiwBpmprAFTzO0pk
 ck8lFPMKZd2Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xkj/PG+O
Subject: Re: [Buildroot] [PATCH v3 1/1] package/piglit: bump version
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

On 29/12/2025 19:02, Bernd Kuhls wrote:
> Disabled vulkan tests added by upstream commit:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
For info, I added back the commit log comments from the patch v2. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/10419e76c6b70d79884b9da6361bdd5281068120

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
