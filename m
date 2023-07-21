Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C79DC0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC198837B6;
	Fri, 21 Jul 2023 17:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC198837B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-hNRJ8Lx6R2; Fri, 21 Jul 2023 17:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0465B83777;
	Fri, 21 Jul 2023 17:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0465B83777
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3191BF982
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 17:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D0C83760
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 17:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D0C83760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qu3IzQZykCBZ for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 17:42:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C1B283709
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 17:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1B283709
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD5E8A4C024D;
 Fri, 21 Jul 2023 19:42:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59818)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMu9J-00083d-1M;
 Fri, 21 Jul 2023 19:42:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 19:42:41 +0200
Message-Id: <20230721174241.3931298-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689961361;
 bh=Y0DP9cpQrcfzJ1QyuXwj6q+e02Qe30wRDDi5KK8fGfY=;
 h=From:To:Cc:Subject:Date:From;
 b=EvFth4UDbMuG/dJHRaTGVI7Ws8H1S28nYyvcyQm6zbL8x7QKyrCYpUDMDaILuLCe0
 wOJD8goe12QdIiyOWmBpeiuUJf6O7dMnfLy3JvbeFCCzftPkoE7BEr/ft2XGFqzqkl
 KjWn7lHixvGtcYHqRX9xHDtWlzaWwciLdUOROQx6l6lQVNviUMiIBBDss77ZUUbUCl
 LlC/lP39TfUkpnWxa08IE62MesaZ2Ct1DopFF3TFp4wUCYg0Ux3Elu0LCF7U0jBI8b
 6V9LEIyLX6zXU3m/Al2dONYGLE5sQwD8XAiCnWUpA830zI3cmlJyXmtTLbDWVmM4y+
 3CyhGFA25i84Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=EvFth4UD
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-July/000724.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a89ab984a8..b101394869 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.3
+MESA3D_HEADERS_VERSION = 23.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 71583d5f67..60c3bd6d5d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html
-sha256  2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9  mesa-23.1.3.tar.xz
-sha512  44f0658138ef99dcede5e4c33d5733af836283f05b031b07f3f8b3bc03b301bc7ab9dc15248829cf3dfc423f2da8935b372b25df8b9ef15a511ba16ccd913959  mesa-23.1.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-July/000724.html
+sha256  7261a17fb94867e3dc5a90d8a1f100fa04b0cbbde51d25302c0872b5e9a10959  mesa-23.1.4.tar.xz
+sha512  4063c7848f507b5e25cfc862394268147254b90c9f3eb19035cce338b0a9cb611b7380c1c73f0e4feeddde68124225df7dee7b9db5f019603dfde2b88ff46a21  mesa-23.1.4.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 24a0ecfe1c..eae5c5c504 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.3
+MESA3D_VERSION = 23.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
