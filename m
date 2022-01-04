Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4943CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EED26405B6;
	Tue,  4 Jan 2022 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGAxnFjUvrhg; Tue,  4 Jan 2022 20:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B15CD4063E;
	Tue,  4 Jan 2022 20:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E12AB1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD1F825C7
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KNwY0szwC9D for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:58:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C985282443
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:58:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso439368wmk.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZse5WGp2fECE2Vk1gy19cXLAFKT6brsYKMJYb5iXPc=;
 b=PKmm+hRfC3XbKgS4wQNR2u1iPwd9dlA3LNFd4efJvo+4iIFGFoFQddaVNOw6BH1unl
 ATnGIGQXnNw63mHwA62LfBrUA4ASsQTyNO2NWJIYwV7nMISV3UbFsSV0agCLkJm6Y/Na
 mUVOMbQDSBZ1d6UB5lpf82EDDk9RkSwpZgrXfEATMqluyBrcwB8u99edKL2z2vFdAdOL
 T25OVvNMAC49+rP0nbxxTTUG831FbZgwt2Sntx7Zd6FDAGjIS90S+ku/mpBQ+x3FqqYg
 9mg30e7yN/GoYjYrvS2nbRMY9NMbUSbeM5c/dfJNkUA/z3lB/JL/7hZ/W4iKLmdMcSSc
 Py6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZse5WGp2fECE2Vk1gy19cXLAFKT6brsYKMJYb5iXPc=;
 b=evNPE0G2gXxP4ZcUoeSRa+eJFir5298Ba29oRQw6GnfBftOsovxFV7F8pXhOcvxrDt
 /ySOyKnapp/4L4V6O1h59sj0fVfFBKTBpQXO+GAikMGovNkAe+4DlI+N215YToEjUqT1
 9QyrdvHygz2zTO8DHqlSX6sTP3CNv44Bv88Sgq4ei0D23zWBfv1Vb602w1jzoASly9KP
 N2HGdKtyayLo5eBpXKhWoyw93B14kpCdGuIXNHeHUH6a7+W/rx11coR6wanBmXR1OP5c
 JSVqXDKbGmZRZj9o8tJpkZQwsuRP6bsn0Wx9pbadHzrsLo6i64Jth7Vb1XK6kVeYBQ9J
 CXAw==
X-Gm-Message-State: AOAM533Emk4Y//rPFVDCtlYE/VBbgdIPcF/dLl+wDT07hw9LN3MJatMg
 xKZMST3yi06M2GZCu0RPNccuFCxbXWk=
X-Google-Smtp-Source: ABdhPJytGYZLJHgm30hjGv+OExgqSeuwKCaSxyCUZei6xGbylsLwcVDidLdqm6XWDI73IRhSF1vtFw==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr112974wmj.77.1641329922895;
 Tue, 04 Jan 2022 12:58:42 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id f6sm40486355wri.115.2022.01.04.12.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:58:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:57:46 +0100
Message-Id: <20220104205746.3633354-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/rpi-rgb-led-matrix: bump to version
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

Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop second patch now that it has been applied 

 .../0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch  | 46 -----------------
 ...-utils-text-scroller.cc-replace-uint.patch | 50 -------------------
 .../rpi-rgb-led-matrix.hash                   |  2 +-
 .../rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk  |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)
 delete mode 100644 package/rpi-rgb-led-matrix/0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch
 delete mode 100644 package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch

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
diff --git a/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch b/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
deleted file mode 100644
index 627415bac8..0000000000
--- a/package/rpi-rgb-led-matrix/0002-utils-text-scroller.cc-replace-uint.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a56338db0f003d5236f2ce98c73a591d64a70852 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 3 Jan 2022 22:57:11 +0100
-Subject: [PATCH] utils/text-scroller.cc: replace uint (#1383)
-
-Replace uint by uint64_t to avoid the following build failure on musl:
-
-text-scroller.cc: In function 'int main(int, char**)':
-text-scroller.cc:220:3: error: 'uint' was not declared in this scope; did you mean 'rint'?
-  220 |   uint frame_counter = 0;
-      |   ^~~~
-      |   rint
-
-Fixes:
- - http://autobuild.buildroot.org/results/1a230bd46eac35081bdb6fe9aaacbb7b62ea6b73
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/hzeller/rpi-rgb-led-matrix/commit/a56338db0f003d5236f2ce98c73a591d64a70852]
----
- utils/text-scroller.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/utils/text-scroller.cc b/utils/text-scroller.cc
-index a64ba0c89..28d4f7182 100644
---- a/utils/text-scroller.cc
-+++ b/utils/text-scroller.cc
-@@ -21,6 +21,7 @@
- #include <getopt.h>
- #include <math.h>
- #include <signal.h>
-+#include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -217,12 +218,12 @@ int main(int argc, char *argv[]) {
- 
-   struct timespec next_frame = {0, 0};
- 
--  uint frame_counter = 0;
-+  uint64_t frame_counter = 0;
-   while (!interrupt_received && loops != 0) {
-     ++frame_counter;
-     offscreen_canvas->Fill(bg_color.r, bg_color.g, bg_color.b);
-     const bool draw_on_frame = (blink_on <= 0)
--      || (frame_counter % (blink_on + blink_off) < (uint)blink_on);
-+      || (frame_counter % (blink_on + blink_off) < (uint64_t)blink_on);
- 
-     if (draw_on_frame) {
-       if (outline_font) {
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
