Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86833C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F04260ACC;
	Fri,  7 Jan 2022 18:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3W-HPgtufFL2; Fri,  7 Jan 2022 18:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723D760A88;
	Fri,  7 Jan 2022 18:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFD91BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 572F460A88
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEzAj_Jc8kdi for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D1F560A80
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9FB883465; Fri,  7 Jan 2022 18:02:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:08:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b07842e20d945649dec1815afffba253c7932211
X-Git-Newrev: f27270705762b1c0c142127fb8b6007102f9c331
X-Patchwork-Hint: ignore
Message-Id: <20220107180235.E9FB883465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-rgb-led-matrix: bump to
 version a56338db0f003d5236f2ce98c73a591d64a70852
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f27270705762b1c0c142127fb8b6007102f9c331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Rename-LDFLAGS-to-RGB_LDFLAGS.patch       | 46 --------------------
 .../0002-utils-text-scroller.cc-replace-uint.patch | 50 ----------------------
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.hash |  2 +-
 package/rpi-rgb-led-matrix/rpi-rgb-led-matrix.mk   |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
