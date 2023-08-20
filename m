Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CCFEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF0460BE9;
	Sun, 20 Aug 2023 21:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF0460BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBVHHQ76fRdO; Sun, 20 Aug 2023 21:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8FF60B3C;
	Sun, 20 Aug 2023 21:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8FF60B3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23CA81BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A0A40136
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A0A40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhJQPGnJEzy7 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:09:54 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9B2840273
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9B2840273
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id F32E2A00D5;
 Sun, 20 Aug 2023 23:09:52 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id D8619A00E2;
 Sun, 20 Aug 2023 23:09:52 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 9E744241249;
 Sun, 20 Aug 2023 23:09:52 +0200 (CEST)
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 20 Aug 2023 23:09:52 +0200
Message-ID: <3517885.iIbC2pHGDl@kilian-aisec>
In-Reply-To: <20230820192912.GR1778688@scaer>
References: <20230820190438.101920-1-kilian.zinnecker@mail.de>
 <20230820190438.101920-2-kilian.zinnecker@mail.de>
 <20230820192912.GR1778688@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 479
X-purgate-ID: 154282::1692565792-1BAF0668-B005B108/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692565792;
 bh=EBU+70XGVNmweRzrLRAgoExg0dtVTdUpsTBmx3e38Fw=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=V7DijyEJQQS8vK8WUK8j/Tc6ywdRnIorkYR67fjIPKGYN8PSrkWB1GoblXOC2HIpc
 u7aKEbVPcs/xwaDtsczmIZfX0mOpZ4LJIy54uLCljaZMsIVdLmp4CYSuMN03tgpABV
 im8ZaTjUA+KOzSyym1OeldvpjR9kDtDafYltEj6rET1569ML+Ik+K9jf/5JGsAwJNb
 9+Rjy1ZNqrsHcVnnH7yDcsLZ0APPBcddlVbm61766vANlLEyqpzbUWrzppCPGyD+zk
 6GsQIePNggb+9IxDSe5nPmvYwmUz54j+Jo6GRwKtAbjkEdXza7JQnRPkG1BJv/mGcx
 X7F9HtaaVdsYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=V7DijyEJ
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,
 
> Applied to master, thanks.

Ahh, I actually broke it - I am sorry! The current master now again does not 
build for the Rock 5B (for everything else it should still be fine). I guess 
the two backported patches from mainline linux should be put into a subfolder 
board/.../patches/linux and not into board/.../patches. I will test again and 
then send another patch to fix that then. I will take better care in the 
future.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
