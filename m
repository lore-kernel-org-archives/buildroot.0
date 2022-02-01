Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E07AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E3A8404BB;
	Tue,  1 Feb 2022 23:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqjxSlR3erSe; Tue,  1 Feb 2022 23:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7CD40137;
	Tue,  1 Feb 2022 23:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA851BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22D7783252
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZnyy0nZ1dhW for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:22:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92EB7825DC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:22:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2TLn1CyRroAhF2TMnar7u; Wed, 02 Feb 2022 00:22:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643757724; bh=n5UfDo0CZd9auHgPdIm61zJgYzrndVAOc8mSQjQcE3U=;
 h=From:To:Subject:Date:MIME-Version;
 b=f21Jvzz+Uom722Kj8sWDILrxD4xYVSSDaECLgQq6dMl2oxt1W1eVheJcd3Y4ge5g0
 bipqIZbBKtLaUElIiwL9TBdymUUUE7aYLQIl3XiQvhglMDAS+v8wteb5wYAi2/u8sW
 RF2BlPed19h0DX0Zo0VzNSJR5VEYZrXZwvdSty/jcgMeXmtO+pGYMNdhm1AfxjMEpa
 zPyOw60X2Nb2FabiOIWaIc0CuPOoxBmWJ5hWp0i0zy9ToUgVJhLpQFEAaamZs6ikvo
 X02EnDHfHSlcymeB0BeWi4HLP3XY1y6ZfHNz2x1BeSo4P6Ojf0mK2esScM/T9RlYCM
 FAgj0T8jzZtdg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:22:02 +0100
Message-Id: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHv96KLrMVHxFnGG6sqb6FlzK7Ounfmj7hMOynkNllcYr1sMOgzK20jA8wmkL5fHFvT/Y0dAatFFd4dSq1SOixWgcPV5UZZr42wHgvIeKP/+Y5+PlQll
 LwQMoewqkDLrCa28XalGzc3vgxWgfiLPunuiWY49hJmEuBA5UiHOeljxD52qifulJUoucbR0PukvlSUwYjK3iLgxzME3F7EKCrgOkxiTpAgwFM6BYWm5BTp9
 L/5fV9k+o6+9eC8ItoGEFKfYOIDcNWGAk0jC/CVuoMYycpfSoqSuCdXv3u6y4YjN4raMbdea0aIQOUCb6Tas7R0V0b58WRH7yUdADDkh3uRJO/Lkfxg98dWr
 uwWWAzygilfGeJWLo0RibyT0F+7sLu54IE/NYS8kJk2SJPbcEx5D4ovo3Wv0kl8r+XLyhTEV1VCn5CcOLA/p3H2klqe2nQ==
Subject: [Buildroot] [URGENT 0/1] This patch is needed for host-util-linux
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-util-linux is very used, so please apply this asap, otherwise a lot
of builds will fail.

Giulio Benetti (1):
  package/util-linux: fix host build failure

 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
