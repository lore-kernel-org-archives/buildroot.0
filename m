Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36658CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83A66F5B4;
	Sat, 30 May 2026 15:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX5zgYj6SUSS; Sat, 30 May 2026 15:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8754F6F5A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156153;
	bh=6WOJeG30JldqYTb3j/PDpZW1oVVJReyqvMXy9r1e340=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LHPRZS8hxA9EpyEKjrmyYuYMi/f6dGGIurM0XNI1GYH5Ktgjxsf9dttJxSkc2qnHg
	 muzc/XeYCni7prjHykcfoua1QWmkR5pmR3AeEgNmxDZhBItmO50M3caMETl8nhWa8E
	 iKv0vD6ZOing6pJ57IlCnJi+1CloHMaEAZOJ7aVZsuirUNdnhIbVWRWVO2wJcwEEFW
	 yGyuFNjKNJID31RiwP1vXMGRSSKx38lSoa1Lp/m/2LD9H/Hhq5ibkn92jZeQCfY6Xd
	 et4avma7Rob+7h/Tvl2QW+syp0yrTtc1pmVvqjL89SSNBHEc05mjNfmLTUSMpgQenB
	 8Wa3tBEs2lhfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8754F6F5A7;
	Sat, 30 May 2026 15:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C88C6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE5EE8539B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib2y-W6dmLgy for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C1088539A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1088539A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C1088539A
 for <buildroot@uclibc.org>; Sat, 30 May 2026 15:49:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTLvw-0009ky-8e
 for buildroot@uclibc.org; Sat, 30 May 2026 17:49:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 May 2026 17:48:12 +0200
Message-ID: <pan$b618d$adddeb8$af70f995$f87bc362@ID-313208.user.individual.net>
References: <20260409184048.3180731-1-bernd@kuhls.net>
 <c5507e2d-2514-401d-ae78-8f17351170c5__11684.012894851$1780146093$gmane$org@rnout.be>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi: fix wayland build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sat, 30 May 2026 12:53:55 +0200 schrieb Arnout Vandecappelle via
buildroot:

>   So this means we'll start getting autobuilder failures for kodi, nice
>   :-)

Hi Arnout,

don't worry: https://gitlab.com/bkuhls/buildroot/-/commit/
22a6f1cef106ff8641033c1ce54d4f3388f385f3

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
