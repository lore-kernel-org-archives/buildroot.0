Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3291C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E48813D5;
	Tue,  4 Jan 2022 18:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEOiVN2PVyDB; Tue,  4 Jan 2022 18:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8B58136B;
	Tue,  4 Jan 2022 18:19:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5EA1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE3A60B6A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uZ4nOmKhEbv for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:18:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5471460B38
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:18:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v6so16159932wra.8
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KluYhwpt7v+mFzynCAChh8MDAZdLI5VmUVFFvlZuRPo=;
 b=LPeQQZhjj2UUgLw3Qn/378wCoH5+LX5uihw402FXSWFbDxCX1cgDQUO6Z4iXQCc57W
 UNsBAQ739Qvu6SCvH57g8/0bjIhyZaqDKvmJ1aab6pLw3SqTn11wOK12/gDvUoPFkNZS
 zsg5oB8XQ+BAtfQxm7DT+O2vEuijZIX9b/tLevmvlZKbGeBMtoXrcMXTFbAGB66msFWm
 JiPadzklhI7NTKVpTh0vYtJjDcdKsBVQLkcm4I2oBPxpLasDp2BTp+nb5mluRSVXQUq2
 w0U050dFvpoRE9VkXOe9HOSJzWUI/cAUra5kya1FlA7F0+ImntKrC4fcZQHM1PwSq8Ch
 lIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KluYhwpt7v+mFzynCAChh8MDAZdLI5VmUVFFvlZuRPo=;
 b=EKn1Ij4qgbAyvk3H3wWoCAhooF6P2qAmkG1ufljcV/5vg4YJvpzveCVZd0fV5qPGiU
 0N+XX8stfy16/ol6XuDqBx7TiLH4+Nf8ftS1nJEMLqxhsmImzA9ZUfEl4M9j9C/L/mPj
 THn2k4lnWnfkoERpruFPPc/yrai/4UsPwxGLBRtaqMYNvC+T1p6eODCH/cVKTJxs/rzd
 wsfMThCwrfWqW6Srx9tlHt7sR1rQ1Hp/fI6CM1SCMapLpwueeSU2nr3V7Qehmxo95t0o
 0soGL5XzOXhSjbCitddM+iuG5yFWHKWjZk7zK00Xoy5OpG0K4t0s12jPN1+uJQv9oB1l
 1vvA==
X-Gm-Message-State: AOAM533nVSiColfw3yldm28wdye3VhyZ8S0K36ySceVkuOTBSTS4OJyr
 ish1BO29hg2D7ZJt2B3Qk2mbIkUTf4I=
X-Google-Smtp-Source: ABdhPJwwr3Anw92+Ep+JkWq9wfK0MQ63Wk9hq5dJ1fsKf4kVzhvYBsotEn10VqIOcjJg2+7HiX0rzw==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr43564850wrq.65.1641320333470; 
 Tue, 04 Jan 2022 10:18:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m17sm38200753wrz.91.2022.01.04.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:18:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:17:57 +0100
Message-Id: <20220104181757.3207568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-rgb-led-matrix: bump to version
 a56338db0f003d5236f2ce98c73a591d64a70852
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- This bump will also fix the following build failure on musl raised
  since the addition of the package in commit
  e821078031e14df69e5142f23e9cb7b5a1ea0e77:

text-scroller.cc: In function 'int main(int, char**)':
text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
  220 |   uint frame_counter = 0;
      |   ^~~~
      |   rint

Fixes:
 - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch  | 46 -------------------
 .../rpi-rgb-led-matrix.hash                   |  2 +-
 .../rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk  |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch

diff --git a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch b/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
deleted file mode 100644
index f7a92f5fb2..0000000000
--- a/package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 056a189836a82b832cd8e6f886cb2090344bfa08 Mon Sep 17 00:00:00 2001
-From: Grzegorz Blach <grzegorz@blach.pl>
-Date: Sat, 29 Aug 2020 20:48:57 +0200
-Subject: [PATCH] Rename LDFLAGS to RGB_LDFLAGS.
-
-This change allows additional flags to be added to the linker
-from the command line.
-
-Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
----
- utils/Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/utils/Makefile b/utils/Makefile
-index e751adc..e704442 100644
---- a/utils/Makefile
-+++ b/utils/Makefile
-@@ -12,7 +12,7 @@ RGB_INCDIR=$(RGB_LIB_DISTRIBUTION)/include
- RGB_LIBDIR=$(RGB_LIB_DISTRIBUTION)/lib
- RGB_LIBRARY_NAME=rgbmatrix
- RGB_LIBRARY=$(RGB_LIBDIR)/lib$(RGB_LIBRARY_NAME).a
--LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
-+RGB_LDFLAGS+=-L$(RGB_LIBDIR) -l$(RGB_LIBRARY_NAME) -lrt -lm -lpthread
- 
- # Imagemagic flags, only needed if actually compiled.
- MAGICK_CXXFLAGS?=$(shell GraphicsMagick++-config --cppflags --cxxflags)
-@@ -28,13 +28,13 @@ $(RGB_LIBRARY): FORCE
- 	$(MAKE) -C $(RGB_LIBDIR)
- 
- text-scroller: text-scroller.o $(RGB_LIBRARY)
--	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS)
-+	$(CXX) $(CXXFLAGS) text-scroller.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS)
- 
- led-image-viewer: led-image-viewer.o $(RGB_LIBRARY)
--	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(MAGICK_LDFLAGS)
-+	$(CXX) $(CXXFLAGS) led-image-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(MAGICK_LDFLAGS)
- 
- video-viewer: video-viewer.o $(RGB_LIBRARY)
--	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(AV_LDFLAGS)
-+	$(CXX) $(CXXFLAGS) video-viewer.o -o $@ $(LDFLAGS) $(RGB_LDFLAGS) $(AV_LDFLAGS)
- 
- %.o : %.cc
- 	$(CXX) -I$(RGB_INCDIR) $(CXXFLAGS) -c -o $@ $<
--- 
-2.24.3 (Apple Git-128)
-
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
index 3b1cb5fd76..265e4c4249 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5efc0293bb180b958079910e968721ff2dac291c435d065ecec9ceba8589567d  rpi-rgb-led-matrix-63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4.tar.gz
+sha256  490ca6fa0c81451f2472b4aa85796a876790f2e212bf0882e3bb7caf5c47e2c3  rpi-rgb-led-matrix-a56338db0f003d5236f2ce98c73a591d64a70852.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
index e436755121..499fb408c2 100644
--- a/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
+++ b/package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_RGB_LED_MATRIX_VERSION = 63e3e7ffdbe88223cc80e1faa508bc4f3cf2bea4
+RPI_RGB_LED_MATRIX_VERSION = a56338db0f003d5236f2ce98c73a591d64a70852
 RPI_RGB_LED_MATRIX_SITE = $(call github,hzeller,rpi-rgb-led-matrix,$(RPI_RGB_LED_MATRIX_VERSION))
 RPI_RGB_LED_MATRIX_LICENSE = GPL-2.0
 RPI_RGB_LED_MATRIX_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
