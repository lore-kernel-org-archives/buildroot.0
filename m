Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B47C61DB3
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1A181380;
	Fri,  6 Jan 2023 21:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1A181380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuQgMNNCgK4s; Fri,  6 Jan 2023 21:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7814B8138D;
	Fri,  6 Jan 2023 21:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7814B8138D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1070A1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEA8D403D8
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA8D403D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8dyD4BwYIMz for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A8E403C5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A8E403C5
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:08:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.160]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MmlTC-1oXRrm2rvK-00jrSc; Fri, 06 Jan 2023 22:08:28 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 22:08:26 +0100
Message-Id: <20230106210827.30007-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106210827.30007-1-ps.report@gmx.net>
References: <20230106210827.30007-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lO5V5N4fSgpLke7ILeDLrc3D2DZ45LNbypgBZT1HjYCOTM8/IFX
 b1foQKLl1UZEMGfZC8te/UdLLQwWA6+prQzFI3AAEsc4kl17wqZ0tjBaHjq41oY2x4O2U/r
 MbX8BJ4srnNhJBdVTtF5IujKJjTgMY0RnvH8WmcphLrt9MBor7ngk3BXjEdXiu/pEULdGCg
 +raeUK8aW4xWHzilc4i2A==
UI-OutboundReport: notjunk:1;M01:P0:DW9TxfmPJ3E=;jtH9XWjc/UUC5Ae5bTCIScBt6E3
 Zq8UF4ngk8uytLeUEy32comeJwNutpznGRIbJ5KZYyEf9z/AgCo3Li9JneqjdFxY0Zbk7CjV3
 suYMypsCp6pYg8VP98GG+3L2HivSxQConnLgw6VhdzioHPd1Ra8kEfa0v/31kAsxKWIzQY1ee
 zq/Z8wLHm+qugcdhj1Aict2uam+SL235IMobNPSl+uGOIJUv3sU/AmZEihz7WCvmS3O3APBkt
 5huV9czm6Z6pXCtBXQWIxwT3QWn+lImBVsrzb2pHY0r32CUR+dvFWJLDpxaANUFgezbPk9D3Y
 SEBS+oGI7Kue7Q2y0R60bbwfbR3ZEfOQghrpL/cfN4Wr+VenTpNgn5lw7n+j+/raxkJnH76qv
 V3pC5CMV3sQZlhSSzvK7RMmk6xvgaLI3Yn4f7GbikpDbgMCWVltNWO1MAGLu/YOWQ6ThPaWB1
 7vfkrjIi9e3cI1QrhjtRSrhpOXVPfOA1noJbTpa2URTJI/FavlH9o66JU5tcQfB80pcwJjdKP
 1cGHM9z5mfXHCHPP9f37MIM48lLVrFksGogHjIu7GUHB1NjDTjJC5648uEQCPQ+GX7Lti5tPj
 kIQT8VfeFZ/KJ9mpZc7OitAgQxRDNY+hcwWAgL406SvS+8zPmOKw/7mVs1Kwvq/+FBCP3rD7i
 OymPW7zo8hNQeLhh6/pjDSsv166AHgBSM77A4KqXKU8cwn5KqmbFZzy0qZ+lSDtWUOr6o2wtJ
 baIEoJQvOo/7eF10nSYDj4ETPfurAC1it5tCrvAdoZVR9XnsKJTOzsWOSKVW3pMs5IwkuZI2j
 IRXaARHujA78YLukSIw4XBYS1J9Rz4OqVwCP2Tyt1YMOPE6ovLym2GIXmaja5YtNFcf3lX8JL
 qGhw3LS1EP5Hwy6WZUfYzP58raQhlJtQJzL1/pQCf5xlN5h1T5s0NNx+8lWyjDkIh7JSTs/2E
 E6FeKSKZINV6cCg1h1QPW//aZE8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673039308; bh=Z8Xa18R8AQzxsOS6zFl6Pc/0DfNcqzNBDfExXHWh5Yc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XAXHSAvzYfBof87OdPpe+VXfpeHu+4P1IfJ3eoP8/UHoWyvj4B4clffrOpRQMCFyV
 cw12fSgZtySO9xAgGmISFueBkaAJCf3f5fm0Ga+GO2aoSb7yqvgf+AZOhkhIC8Ngmb
 tu2lKy464tubitip8at8BiLZiVm7aHXVJ1fo/0T2eqvKkakCaIgXT1ok9BgTc2J9SS
 Z5+KcSp1PsUjJZ3NxrFkC0hgBp99o9mrlbgkagbAg2R8Yqm1p9SbWNCx26s4m7jkRw
 SRRlBnKxij2z8GHSGAWwS/wYKyWcW8L/3V2V53YjvVySWoQCRkr0G1yjiF3XElApkO
 2kOTBON5APmhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=XAXHSAvz
Subject: [Buildroot] [PATCH v1] package/speechd: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes/Todo:
  - double check license description against
    https://github.com/brailcom/speechd#license
  - maybe add SYSV init script
---
 package/Config.in            |  1 +
 package/speechd/Config.in    | 20 ++++++++++++++++++++
 package/speechd/speechd.hash |  5 +++++
 package/speechd/speechd.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/speechd/Config.in
 create mode 100644 package/speechd/speechd.hash
 create mode 100644 package/speechd/speechd.mk

diff --git a/package/Config.in b/package/Config.in
index b9f04e9fd1..3c49edaefb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -51,6 +51,7 @@ menu "Audio and video applications"
 	source "package/pipewire-media-session/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
+	source "package/speechd/Config.in"
 	source "package/squeezelite/Config.in"
 	source "package/tinycompress/Config.in"
 	source "package/tovid/Config.in"
diff --git a/package/speechd/Config.in b/package/speechd/Config.in
new file mode 100644
index 0000000000..8fdc452d19
--- /dev/null
+++ b/package/speechd/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SPEECHD
+	bool "speechd"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_DOTCONF
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Speech Dispatcher project provides a high-level device
+	  independent layer for access to speech synthesis through
+	  a simple, stable and well documented interface.
+
+	  https://freebsoft.org/speechd
+
+comment "speechd needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
new file mode 100644
index 0000000000..4eb4cd09d2
--- /dev/null
+++ b/package/speechd/speechd.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  628d4446894b47f0df099123924c1070180b5b5b09c5b637ebe80d8578fba92f  speechd-0.11.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
new file mode 100644
index 0000000000..0d43e4b6fb
--- /dev/null
+++ b/package/speechd/speechd.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# speechd
+#
+################################################################################
+
+SPEECHD_VERSION = 0.11.4
+SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
+SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
+SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
+SPEECHD_INSTALL_STAGING = YES
+# speechd source code is released without configure script
+SPEECHD_AUTORECONF = YES
+SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+
+# fix missing config.rpath (needed for autoreconf) in the codebase
+define SPEECHD_TOUCH_CONFIG_RPATH
+	touch $(@D)/config.rpath
+endef
+SPEECHD_PRE_CONFIGURE_HOOKS += SPEECHD_TOUCH_CONFIG_RPATH
+
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+SPEECHD_DEPENDENCIES += libtool
+SPEECHD_CONF_OPTS += --with-libltdl
+else
+SPEECHD_CONF_OPTS += --without-libltdl
+endif
+
+define SPEECHD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/speech-dispatcherd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/speech-dispatcherd.service
+endef
+
+$(eval $(autotools-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
