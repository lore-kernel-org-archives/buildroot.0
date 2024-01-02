Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA55C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37444400CB;
	Tue,  2 Jan 2024 21:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37444400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZ3_ZyDXw0rJ; Tue,  2 Jan 2024 21:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDD9F40467;
	Tue,  2 Jan 2024 21:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD9F40467
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8F51BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EC9400FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EC9400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHwF8xdpk3yQ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDF494019F
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF494019F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA37583D30; Tue,  2 Jan 2024 21:42:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:19:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c6ff16cf26acff45ac5a8bdedffe2df5696c416
X-Git-Newrev: d2e349301b79ad3a1840083714ee396f4302b68a
X-Patchwork-Hint: ignore
Message-Id: <20240102214253.AA37583D30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: bump to version 3.8.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2e349301b79ad3a1840083714ee396f4302b68a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Rasdaman driver has been removed with
  https://github.com/OSGeo/gdal/commit/2464c7699271a413832256a823cd9340a6010ddf
- This bump will fix the following build failure with libxml2 >= 2.12
  raised since commit d8ac52108c12f0fcc9641b63e7922009270f96c6 thanks to
  https://github.com/OSGeo/gdal/commit/cbed9fc91dffba30d0f9a6a06a412a04d9cd36fa:

/home/buildroot/autobuild/instance-3/output-1/build/gdal-3.6.2/port/cpl_xml_validate.cpp: In function 'void CPLLibXMLWarningErrorCallback(void*, const char*, ...)':
/home/buildroot/autobuild/instance-3/output-1/build/gdal-3.6.2/port/cpl_xml_validate.cpp:917:48: error: invalid conversion from 'const xmlError*' {aka 'const _xmlError*'} to 'xmlErrorPtr' {aka '_xmlError*'} [-fpermissive]
  917 |         xmlErrorPtr pErrorPtr = xmlGetLastError();
      |                                 ~~~~~~~~~~~~~~~^~
      |                                                |
      |                                                const xmlError* {aka const _xmlError*}

https://github.com/OSGeo/gdal/blob/v3.8.2/NEWS.md

Fixes:
 - http://autobuild.buildroot.org/results/e258305b42dcfdbefec656015929c384444f49b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 .../gdal/0001-fix-uclibc-build-without-NPTL.patch  | 102 ---------------------
 package/gdal/gdal.hash                             |   6 +-
 package/gdal/gdal.mk                               |   3 +-
 4 files changed, 4 insertions(+), 108 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8337c80c11..5ff39e6f37 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -455,7 +455,6 @@ package/gcc/arc-2020.09-release/0001-arc-Refurbish-adc-sbc-patterns.patch Upstre
 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob Upstream
 package/gcc/arc-2020.09-release/0100-uclibc-conf.patch Upstream
 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch Upstream
-package/gdal/0001-fix-uclibc-build-without-NPTL.patch Upstream
 package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
 package/gdb/12.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
 package/gdb/12.1/0003-use-asm-sgidefs.h.patch Upstream
diff --git a/package/gdal/0001-fix-uclibc-build-without-NPTL.patch b/package/gdal/0001-fix-uclibc-build-without-NPTL.patch
deleted file mode 100644
index 6ecbfc7f95..0000000000
--- a/package/gdal/0001-fix-uclibc-build-without-NPTL.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 0d3ee8a7661dcd85a9d7b636124af32de8d1b2f1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Feb 2023 11:31:23 +0100
-Subject: [PATCH] fix uclibc build without NPTL
-
-Check for pthread_spin_lock instead of pthread_spin_lock_t to avoid the
-following uclibc build failure:
-
-/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'CPLSpinLock* CPLCreateSpinLock()':
-/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2265:9: error: 'pthread_spin_init' was not declared in this scope; did you mean 'pthread_cond_init'?
- 2265 |         pthread_spin_init(&(psSpin->spin), PTHREAD_PROCESS_PRIVATE) == 0 )
-      |         ^~~~~~~~~~~~~~~~~
-      |         pthread_cond_init
-/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp: In function 'int CPLAcquireSpinLock(CPLSpinLock*)':
-/tmp/instance-7/output-1/build/gdal-3.5.2/port/cpl_multiproc.cpp:2283:12: error: 'pthread_spin_lock' was not declared in this scope; did you mean 'pthread_spinlock_t'?
- 2283 |     return pthread_spin_lock( &(psSpin->spin) ) == 0;
-      |            ^~~~~~~~~~~~~~~~~
-      |            pthread_spinlock_t
-
-Fixes:
- - http://autobuild.buildroot.org/results/aa2a88990a07e551c40efb0c2180768add600c4f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OSGeo/gdal/pull/7318]
----
- cmake/helpers/configure.cmake  | 4 ++--
- cmake/template/cpl_config.h.in | 4 ++--
- port/cpl_config.h.in           | 4 ++--
- port/cpl_multiproc.cpp         | 4 ++--
- 4 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/cmake/helpers/configure.cmake b/cmake/helpers/configure.cmake
-index 08549df434..62a4f636ba 100644
---- a/cmake/helpers/configure.cmake
-+++ b/cmake/helpers/configure.cmake
-@@ -110,9 +110,9 @@ else ()
-     "
-         #define _GNU_SOURCE
-         #include <pthread.h>
--        int main() { pthread_spinlock_t spin; return 1; }
-+        int main() { pthread_spinlock_t spin; return pthread_spin_lock(&spin); }
-         "
--    HAVE_PTHREAD_SPINLOCK)
-+    HAVE_PTHREAD_SPIN_LOCK)
- 
-   check_c_source_compiles(
-     "
-diff --git a/cmake/template/cpl_config.h.in b/cmake/template/cpl_config.h.in
-index cfa7da94aa..d1fd80bda9 100644
---- a/cmake/template/cpl_config.h.in
-+++ b/cmake/template/cpl_config.h.in
-@@ -61,8 +61,8 @@
- /* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
- #cmakedefine HAVE_PTHREAD_MUTEX_ADAPTIVE_NP 1
- 
--/* Define to 1 if you have the `pthread_spinlock_t' type. */
--#cmakedefine HAVE_PTHREAD_SPINLOCK 1
-+/* Define to 1 if you have the `pthread_spin_lock' function. */
-+#cmakedefine HAVE_PTHREAD_SPIN_LOCK 1
- 
- /* Define to 1 if you have the `pthread_atfork' function. */
- #cmakedefine HAVE_PTHREAD_ATFORK 1
-diff --git a/port/cpl_config.h.in b/port/cpl_config.h.in
-index ea28efb3f0..09a48f242d 100644
---- a/port/cpl_config.h.in
-+++ b/port/cpl_config.h.in
-@@ -51,8 +51,8 @@
- /* Define to 1 if you have the `PTHREAD_MUTEX_ADAPTIVE_NP' constant. */
- #undef HAVE_PTHREAD_MUTEX_ADAPTIVE_NP
- 
--/* Define to 1 if you have the `pthread_spinlock_t' type. */
--#undef HAVE_PTHREAD_SPINLOCK
-+/* Define to 1 if you have the `pthread_spin_lock' function. */
-+#undef HAVE_PTHREAD_SPIN_LOCK
- 
- /* Define to 1 if you have the 5 args `mremap' function. */
- #undef HAVE_5ARGS_MREMAP
-diff --git a/port/cpl_multiproc.cpp b/port/cpl_multiproc.cpp
-index 7f5bcd9127..474ff5bb29 100644
---- a/port/cpl_multiproc.cpp
-+++ b/port/cpl_multiproc.cpp
-@@ -2232,7 +2232,7 @@ void CPLCleanupTLS()
- /*                          CPLCreateSpinLock()                         */
- /************************************************************************/
- 
--#if defined(HAVE_PTHREAD_SPINLOCK)
-+#if defined(HAVE_PTHREAD_SPIN_LOCK)
- #define HAVE_SPINLOCK_IMPL
- 
- struct _CPLSpinLock
-@@ -2310,7 +2310,7 @@ void CPLDestroySpinLock(CPLSpinLock *psSpin)
-     pthread_spin_destroy(&(psSpin->spin));
-     free(psSpin);
- }
--#endif  // HAVE_PTHREAD_SPINLOCK
-+#endif  // HAVE_PTHREAD_SPIN_LOCK
- 
- #endif  // def CPL_MULTIPROC_PTHREAD
- 
--- 
-2.39.1
-
diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index d0b08b4535..baec7c910e 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
-md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
-sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.8.2/gdal-3.8.2.tar.gz.md5, sha256 locally computed:
+md5  178461c9c1cd4503e36559a1063bb752  gdal-3.8.2.tar.xz
+sha256  dc2921ee1cf7a5c0498e94d15fb9ab9c9689c296363a1d021fc3293dd242b4db  gdal-3.8.2.tar.xz
 
 # Hashes of license files:
 sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 7ab4f1a331..13f38173fa 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.6.2
+GDAL_VERSION = 3.8.2
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
@@ -87,7 +87,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_PDFIUM=OFF \
 	-DGDAL_USE_PODOFO=OFF \
 	-DGDAL_USE_POPPLER=OFF \
-	-DGDAL_USE_RASDAMAN=OFF \
 	-DGDAL_USE_RASTERLITE2=OFF \
 	-DGDAL_USE_RDB=OFF \
 	-DGDAL_USE_SFCGAL=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
