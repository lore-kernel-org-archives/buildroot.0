Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA40C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57EF960F53;
	Sat,  9 Dec 2023 14:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57EF960F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esZY_HfgN_i0; Sat,  9 Dec 2023 14:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D44E60F4E;
	Sat,  9 Dec 2023 14:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D44E60F4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51F371BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B948415F0
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B948415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYMjlSMEKaGG for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:55:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1323C4056A
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1323C4056A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAFDF87533; Sat,  9 Dec 2023 14:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 15:54:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82c025309069ae3f87ef192df19ad67fc1a1271f
X-Git-Newrev: a32e41b09a7b6547a7df8499c47f6ab63798814b
X-Patchwork-Hint: ignore
Message-Id: <20231209145520.EAFDF87533@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: bump to version
 5.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a32e41b09a7b6547a7df8499c47f6ab63798814b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

This bump will fix the following build failure raised since bump of
leptonica to version 1.83.1 in commit
a4e713558dfd9a6fd6c0677b4b094adc216b720e thanks to
https://github.com/tesseract-ocr/tesseract/commit/27b1827ccde6014df1231e1cec6263ee108066e9:

src/textord/devanagari_processing.cpp: In member function 'bool tesseract::ShiroRekhaSplitter::Split(bool, tesseract::DebugPixa*)':
src/textord/devanagari_processing.cpp:130:19: error: invalid use of incomplete type 'struct Pixa'
  130 |     Box *box = ccs->boxa->box[i];
      |                   ^~
In file included from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/alltypes.h:52,
                 from /home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/allheaders.h:35,
                 from src/textord/devanagari_processing.h:16,
                 from src/textord/devanagari_processing.cpp:25:
/home/autobuild/autobuild/instance-5/output-1/host/bin/../s390x-buildroot-linux-gnu/sysroot/usr/include/leptonica/bmf.h:48:12: note: forward declaration of 'struct Pixa'
   48 |     struct Pixa  *pixa;        /*!< pixa of bitmaps for 93 characters        */
      |            ^~~~

https://github.com/tesseract-ocr/tesseract/blob/5.3.3/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/46d3ffc8885245ee9a56a528be055b0b27a18245

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 --
 ...Check-if-platform-supports-feenableexcept.patch | 42 ----------------------
 ...0002-configure.ac-fix-build-on-aarch64_be.patch | 32 -----------------
 package/tesseract-ocr/tesseract-ocr.hash           |  2 +-
 package/tesseract-ocr/tesseract-ocr.mk             |  4 +--
 5 files changed, 2 insertions(+), 80 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 68e428daf7..db7271b629 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1331,8 +1331,6 @@ package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
 package/tcf-agent/S55tcf-agent Shellcheck Variables
 package/tcl/0001-Disable-tcl-compatibility-layers.patch Upstream
-package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
-package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch Upstream
 package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch Upstream
 package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
 package/ti-gfx/0001-newclkapi.patch Upstream
diff --git a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch b/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
deleted file mode 100644
index 5280f01aba..0000000000
--- a/package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 52484af83a58664c3cc91b8af07aeeea271f67ef Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Sun, 9 Jan 2022 10:58:36 +0100
-Subject: [PATCH] Check if platform supports feenableexcept
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- configure.ac      | 4 ++++
- src/tesseract.cpp | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9177d64..80cd735 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,6 +188,10 @@ case "${host_cpu}" in
- 
- esac
-
-+# check whether feenableexcept is supported. some C libraries (e.g. uclibc) don't.
-+AC_CHECK_FUNC(feenableexcept, [feenableexcept=true], [feenableexcept=false])
-+AM_CONDITIONAL([HAVE_FEENABLEEXCEPT], $feenableexcept)
-+
- AX_CHECK_COMPILE_FLAG([-fopenmp-simd], [openmp_simd=true], [openmp_simd=false], [$WERROR])
- AM_CONDITIONAL([OPENMP_SIMD], $openmp_simd)
- 
-diff --git a/src/tesseract.cpp b/src/tesseract.cpp
-index 933116e..9154db8 100644
---- a/src/tesseract.cpp
-+++ b/src/tesseract.cpp
-@@ -629,7 +629,7 @@ static void PreloadRenderers(tesseract::TessBaseAPI &api,
-  **********************************************************************/
- 
- int main(int argc, char **argv) {
--#if defined(__USE_GNU)
-+#if defined(__USE_GNU) && defined(HAVE_FEENABLEEXCEPT)
-   // Raise SIGFPE.
- #  if defined(__clang__)
-   // clang creates code which causes some FP exceptions, so don't enable those.
--- 
-2.32.0
-
diff --git a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch b/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
deleted file mode 100644
index 20b8d5ce76..0000000000
--- a/package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cffb8a36a987cd0d013d73501dd20c553ff69c77 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Aug 2022 10:21:43 +0200
-Subject: [PATCH] configure.ac: fix build on aarch64_be
-
-Fix the following build failure on aarch64_be:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/10.3.1/../../../../aarch64_be-none-linux-gnu/bin/ld: ./.libs/libtesseract.so: undefined reference to `tesseract::IntSimdMatrix::intSimdMatrixNEON'
-
-Fixes:
- - http://autobuild.buildroot.org/results/b9246a37fcf6be4fabfc491daddadfb09e0a320a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/tesseract-ocr/tesseract/commit/cffb8a36a987cd0d013d73501dd20c553ff69c77]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 63579c954f..2b05052395 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -170,7 +170,7 @@ case "${host_cpu}" in
- 
-     ;;
- 
--  aarch64)
-+  aarch64*)
- 
-     # ARMv8 always has NEON and does not need special compiler flags.
-     AM_CONDITIONAL([HAVE_NEON], true)
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index 9e526423d3..45b9def27f 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  b5b0e561650ed67feb1e9de38d4746121d302ae4c876c95b99b8b6f9f89d5c58  tesseract-ocr-5.0.1.tar.gz
+sha256  dc4329f85f41191b2d813b71b528ba6047745813474e583ccce8795ff2ff5681  tesseract-ocr-5.3.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index abe3d39ab6..d65111d468 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.0.1
+TESSERACT_OCR_VERSION = 5.3.3
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
 TESSERACT_OCR_LICENSE_FILES = LICENSE
 
 # Source from github, no configure script provided
-# 0001-Check-if-platform-supports-feenableexcept.patch
-# 0002-configure.ac-fix-build-on-aarch64_be.patch
 TESSERACT_OCR_AUTORECONF = YES
 
 # cairo, pango and icu are optional dependencies, but only needed for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
