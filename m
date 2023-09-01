Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B61CA0FE6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 06:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F64C41FBD;
	Fri,  1 Sep 2023 06:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F64C41FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rObE-YklDlaF; Fri,  1 Sep 2023 06:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4126241FBA;
	Fri,  1 Sep 2023 06:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4126241FBA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6CC1BF294
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 06:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28B1B4038B
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 06:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28B1B4038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FJwraRMROke for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 06:51:46 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DF4C4025D
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 06:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF4C4025D
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 5B1F0A2EAE;
 Fri,  1 Sep 2023 08:51:44 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 3F6D8A00E2;
 Fri,  1 Sep 2023 08:51:44 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id BF2F7240A2D;
 Fri,  1 Sep 2023 08:51:43 +0200 (CEST)
To: buildroot@buildroot.org, yann.morin.1998@free.fr, arnout@mind.be
Date: Fri, 01 Sep 2023 08:51:43 +0200
Message-ID: <5969347.lOV4Wx5bFT@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 346
X-purgate-ID: 154282::1693551104-847EF668-9C35751D/20/7513405667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1693551104;
 bh=D8UKZWzODwE54Wjos5kJ3x4cx1Bg3z5QHjJN41Fjr7Q=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=ljDIlG6GXEHyvr73ttC8oYX1vrlz7cedbJOraFwMpIb+qV6DLVqOXwSB2apNWLMED
 vMI01dOuu3VoQSHGWnfQxiWEny0dmZMXuQrq+wU1b7hqBvi4xN1w7NQyODu5xQDXe8
 dQVpQiTbN2mxVSOksNf9DFUmZYBYme1aXiUwzhHwvUCDoEE230bI+c0Hb2kQmoKiyx
 KEYmBIn+XiLDi75fqye/k3zxtv3KLWb0wuvnZfDILWbCx0RPS886u/IdjCR5+Ncwbb
 sKCG+2SaEi9sr/XjPoJ/Pittw+WVD2GsuFsBEL7EGfx9+b5k37p9AnkZEGRzckPxG9
 mBv8FEO/w1B+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=ljDIlG6G
Subject: [Buildroot] Buildroot docker image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, Arnout, all,

I am looking for a docker image for buildroot to setup a CI. (I am actually 
not very familiar with docker to this day.) I found one on dockerhub, which 
looks like it was created by you: https://hub.docker.com/r/buildroot/base Is 
this some kind of "official" buildroot docker image?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
