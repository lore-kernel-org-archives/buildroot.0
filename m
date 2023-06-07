Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E579C7EE25
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290CF820F2;
	Wed,  7 Jun 2023 20:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 290CF820F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCFEUDBih3W8; Wed,  7 Jun 2023 20:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD89820D5;
	Wed,  7 Jun 2023 20:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD89820D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 994071BF3D0
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7335440C10
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7335440C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYf4DGmq-vGP for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 20:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D71040558
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D71040558
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:24:53 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.165.27])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6B91B19F732;
 Wed,  7 Jun 2023 22:24:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Jun 2023 22:24:38 +0200
Message-Id: <20230607202439.188050-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686169490;
 bh=h7D+hfh0oaMBV8Y/PibR4WUIP14aNtxRwcmcsdo+rEk=;
 h=From:To:Cc:Subject:Date:From;
 b=mO0gkQ3VwRzdPJHkz2c/J2ZnIKsOJkcCbncLADTaoohMas4azVlFhcIzPTrOjmZnb
 Bb/2+t5glggPXrpppCbqyBSZ5i4gxg27dY2PMTvzgu4YKJwYZkF/rsvl8VMsHZ1TGQ
 Pb9P7NSVeFK4XFX49wy1LF4R/TD6oGsQScswaFEV10FsnvIRv9J/GcKPWAFypXhaQx
 GLgP3EzKxJwF+RxHekXgcid/RFKpppq3yYH5CjlL5Iq+kZOacq0Sf9Wfuqw7hzn0h5
 yA/KW8UocWvjizfDgVFvYr2vjQUJS0b+I+XS2OqVLkGNcMU2ntPOe1Otuf+z3tRwCN
 6MQ0F0I05n9Nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mO0gkQ3V
Subject: [Buildroot] [PATCH 1/2] package/glslsandbox-player: bump to version
 v2023.04.05
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to copyright year update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/glslsandbox-player.hash | 4 ++--
 package/glslsandbox-player/glslsandbox-player.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/glslsandbox-player.hash b/package/glslsandbox-player/glslsandbox-player.hash
index bc8946c62b..91af3c9c75 100644
--- a/package/glslsandbox-player/glslsandbox-player.hash
+++ b/package/glslsandbox-player/glslsandbox-player.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4af34889faa6d3a904e980f23aeb720dfb614d50aa01b9b1874fc2ae77dbcf4  glslsandbox-player-2021.08.24.tar.gz
-sha256  970d45d8a3dfd042d303008294f49db8c0c464f7687aa6e28a01b0926e74df85  LICENSE
+sha256  8adf89f65a060958e6ba2aa52a28f3189fde23b5478958ad4b8b6a7e82007587  glslsandbox-player-2023.04.05.tar.gz
+sha256  cda47d436d3aeb02d595ddd316d841494926d286327383b5d63734115204a8b2  LICENSE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 241f3475d2..0066f43567 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLSLSANDBOX_PLAYER_VERSION = 2021.08.24
+GLSLSANDBOX_PLAYER_VERSION = 2023.04.05
 GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,v$(GLSLSANDBOX_PLAYER_VERSION))
 GLSLSANDBOX_PLAYER_AUTORECONF = YES
 GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
