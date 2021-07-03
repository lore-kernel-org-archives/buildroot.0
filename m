Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AB1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80168610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80168610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A924608AB;
	Wed,  4 Aug 2021 00:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iMJ8vQV3YTZ; Wed,  4 Aug 2021 00:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23778608B0;
	Wed,  4 Aug 2021 00:05:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73B6F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85EEF40E67
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hgWS2g2Jq5T for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD9D94064D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B1AF8827E; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:59:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 534f4d6c68d80ca53bb8d19216fae2d1ecb1b2ec
X-Git-Newrev: 42a58a9bcb0789d52742f36e15f773514fa6b40c
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.0B1AF8827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-mediadriver:
 bump version to 21.2.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=42a58a9bcb0789d52742f36e15f773514fa6b40c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rebased patch 0001 and removed another hardening flag.
Removed patch 0002 which was backported from upstream commit.
Renumbered and rebased patch 0003.
Reformatted hashes.

Reworked X11 support as it is an optional dependency:
https://github.com/intel/media-driver/pull/494

Release notes:
https://github.com/intel/media-driver/releases/tag/intel-media-21.2.3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Drop-hardening-related-flags.patch        |  38 +++--
 ...d-fix-Werror=format-overflow-under-gcc-10.patch | 162 ---------------------
 ...x-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch} |  32 ++--
 package/intel-mediadriver/Config.in                |   6 -
 package/intel-mediadriver/intel-mediadriver.hash   |   4 +-
 package/intel-mediadriver/intel-mediadriver.mk     |   9 +-
 6 files changed, 47 insertions(+), 204 deletions(-)

diff --git a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
index bc29203317..376308ea42 100644
--- a/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-mediadriver/0001-Drop-hardening-related-flags.patch
@@ -17,27 +17,27 @@ diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
 index 44ce4f08..b462fbea 100644
 --- a/cmrtlib/linux/CMakeLists.txt
 +++ b/cmrtlib/linux/CMakeLists.txt
-@@ -26,11 +26,11 @@ set(LIBRARY_OUTPUT_PATH    ${MDF_OPTION__OUTPUT_DIR})
+@@ -32,11 +32,11 @@
+ endif()
  
  # Set up compile options that will be used for the Linux build
- if(CMAKE_COMPILER_IS_GNUCC)
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
--    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
-     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -fstack-protector-all -Werror")
--    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
-     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
+-set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
++set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -fstack-protector-all -Werror")
+-set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing -D_FORTIFY_SOURCE=2")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
  
-     set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+ set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
 diff --git a/media_driver/cmake/linux/media_compile_flags_linux.cmake b/media_driver/cmake/linux/media_compile_flags_linux.cmake
 index 9e85fdb2..c45ce11b 100755
 --- a/media_driver/cmake/linux/media_compile_flags_linux.cmake
 +++ b/media_driver/cmake/linux/media_compile_flags_linux.cmake
-@@ -64,7 +64,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
+@@ -47,7 +47,6 @@ set(MEDIA_COMPILER_FLAGS_COMMON
      # Other common flags
      -fmessage-length=0
      -fvisibility=hidden
@@ -45,11 +45,19 @@ index 9e85fdb2..c45ce11b 100755
      -fdata-sections
      -ffunction-sections
      -Wl,--gc-sections
+@@ -119,7 +118,6 @@
+     set(MEDIA_COMPILER_FLAGS_RELEASE
+         ${MEDIA_COMPILER_FLAGS_RELEASE}
+         -O2
+-        -D_FORTIFY_SOURCE=2
+         -fno-omit-frame-pointer
+     )
+ endif()
 diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
 index 3491db1e..b30fa04a 100755
 --- a/media_driver/media_top_cmake.cmake
 +++ b/media_driver/media_top_cmake.cmake
-@@ -88,7 +88,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
+@@ -105,7 +105,7 @@ if(MEDIA_BUILD_FATAL_WARNINGS)
      set_target_properties(${LIB_NAME_OBJ} PROPERTIES COMPILE_FLAGS "-Werror")
  endif()
  
diff --git a/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch b/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch
deleted file mode 100644
index 46775e9347..0000000000
--- a/package/intel-mediadriver/0002-build-fix-Werror=format-overflow-under-gcc-10.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From da966a2ab1f5161cc0a21a4cd7e07edf732ebee9 Mon Sep 17 00:00:00 2001
-From: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-Date: Thu, 19 Mar 2020 20:59:12 -0700
-Subject: [PATCH] build: fix Werror=format-overflow under gcc-10
-
-Fixes: #870
-
-With upcoming gcc-10 we start to see Werror=format-overflow reporting
-that we attempt to printf %s null strings.
-
-Change-Id: I7a62bc98bf7dd6bcd61d475d7650a06aa1a70932
-Signed-off-by: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
-[Retrieved from:
-https://github.com/intel/media-driver/commit/da966a2ab1f5161cc0a21a4cd7e07edf732ebee9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- media_driver/linux/common/os/i915/xf86drm.c   | 57 ++++++++++---------
- .../linux/ult/libdrm_mock/xf86drm_mock.c      | 57 ++++++++++---------
- 2 files changed, 58 insertions(+), 56 deletions(-)
-
-diff --git a/media_driver/linux/common/os/i915/xf86drm.c b/media_driver/linux/common/os/i915/xf86drm.c
-index 7594bde99..d0fc1b7ac 100644
---- a/media_driver/linux/common/os/i915/xf86drm.c
-+++ b/media_driver/linux/common/os/i915/xf86drm.c
-@@ -581,37 +581,38 @@ static int drmOpenByBusid(const char *busid, int type)
- 
-     drmMsg("drmOpenByBusid: Searching for BusID %s\n", busid);
-     for (i = base; i < base + DRM_MAX_MINOR; i++) {
--    fd = drmOpenMinor(i, 1, type);
--    drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
--    if (fd >= 0) {
--        /* We need to try for 1.4 first for proper PCI domain support
--         * and if that fails, we know the kernel is busted
--         */
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 4;
--        sv.drm_dd_major = -1;    /* Don't care */
--        sv.drm_dd_minor = -1;    /* Don't care */
--        if (drmSetInterfaceVersion(fd, &sv)) {
-+        fd = drmOpenMinor(i, 1, type);
-+        drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
-+        if (fd >= 0) {
-+            /* We need to try for 1.4 first for proper PCI domain support
-+             * and if that fails, we know the kernel is busted
-+             */
-+            sv.drm_di_major = 1;
-+            sv.drm_di_minor = 4;
-+            sv.drm_dd_major = -1;    /* Don't care */
-+            sv.drm_dd_minor = -1;    /* Don't care */
-+            if (drmSetInterfaceVersion(fd, &sv)) {
- #ifndef __alpha__
--        pci_domain_ok = 0;
-+                pci_domain_ok = 0;
- #endif
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 1;
--        sv.drm_dd_major = -1;       /* Don't care */
--        sv.drm_dd_minor = -1;       /* Don't care */
--        drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
--        drmSetInterfaceVersion(fd, &sv);
--        }
--        buf = drmGetBusid(fd);
--        drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
--        if (buf && drmMatchBusID(buf, busid, pci_domain_ok)) {
--        drmFreeBusid(buf);
--        return fd;
-+                sv.drm_di_major = 1;
-+                sv.drm_di_minor = 1;
-+                sv.drm_dd_major = -1;       /* Don't care */
-+                sv.drm_dd_minor = -1;       /* Don't care */
-+                drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
-+                drmSetInterfaceVersion(fd, &sv);
-+            }
-+            buf = drmGetBusid(fd);
-+            if (buf) {
-+                drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
-+                if (drmMatchBusID(buf, busid, pci_domain_ok)) {
-+                    drmFreeBusid(buf);
-+                    return fd;
-+                }
-+                drmFreeBusid(buf);
-+            }
-+            close(fd);
-         }
--        if (buf)
--        drmFreeBusid(buf);
--        close(fd);
--    }
-     }
-     return -1;
- }
-diff --git a/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c b/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-index 7e5246295..2e5863798 100644
---- a/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-+++ b/media_driver/linux/ult/libdrm_mock/xf86drm_mock.c
-@@ -790,37 +790,38 @@ static int drmOpenByBusid(const char *busid, int type)
- 
-     drmMsg("drmOpenByBusid: Searching for BusID %s\n", busid);
-     for (i = base; i < base + DRM_MAX_MINOR; i++) {
--    fd = drmOpenMinor(i, 1, type);
--    drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
--    if (fd >= 0) {
--        /* We need to try for 1.4 first for proper PCI domain support
--         * and if that fails, we know the kernel is busted
--         */
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 4;
--        sv.drm_dd_major = -1;    /* Don't care */
--        sv.drm_dd_minor = -1;    /* Don't care */
--        if (drmSetInterfaceVersion(fd, &sv)) {
-+        fd = drmOpenMinor(i, 1, type);
-+        drmMsg("drmOpenByBusid: drmOpenMinor returns %d\n", fd);
-+        if (fd >= 0) {
-+            /* We need to try for 1.4 first for proper PCI domain support
-+             * and if that fails, we know the kernel is busted
-+             */
-+            sv.drm_di_major = 1;
-+            sv.drm_di_minor = 4;
-+            sv.drm_dd_major = -1;    /* Don't care */
-+            sv.drm_dd_minor = -1;    /* Don't care */
-+            if (drmSetInterfaceVersion(fd, &sv)) {
- #ifndef __alpha__
--        pci_domain_ok = 0;
-+                pci_domain_ok = 0;
- #endif
--        sv.drm_di_major = 1;
--        sv.drm_di_minor = 1;
--        sv.drm_dd_major = -1;       /* Don't care */
--        sv.drm_dd_minor = -1;       /* Don't care */
--        drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
--        drmSetInterfaceVersion(fd, &sv);
--        }
--        buf = drmGetBusid(fd);
--        drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
--        if (buf && drmMatchBusID(buf, busid, pci_domain_ok)) {
--        drmFreeBusid(buf);
--        return fd;
-+                sv.drm_di_major = 1;
-+                sv.drm_di_minor = 1;
-+                sv.drm_dd_major = -1;       /* Don't care */
-+                sv.drm_dd_minor = -1;       /* Don't care */
-+                drmMsg("drmOpenByBusid: Interface 1.4 failed, trying 1.1\n");
-+                drmSetInterfaceVersion(fd, &sv);
-+            }
-+            buf = drmGetBusid(fd);
-+            if (buf) {
-+                drmMsg("drmOpenByBusid: drmGetBusid reports %s\n", buf);
-+                if (drmMatchBusID(buf, busid, pci_domain_ok)) {
-+                    drmFreeBusid(buf);
-+                    return fd;
-+                }
-+                drmFreeBusid(buf);
-+            }
-+            close(fd);
-         }
--        if (buf)
--        drmFreeBusid(buf);
--        close(fd);
--    }
-     }
-     return -1;
- }
diff --git a/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch b/package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
similarity index 63%
rename from package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
rename to package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
index bc7a27f4d0..df8d39f777 100644
--- a/package/intel-mediadriver/0003-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
+++ b/package/intel-mediadriver/0002-cmrtlib-linux-CMakelists.txt-respect-MEDIA_BUILD_FAT.patch
@@ -27,25 +27,25 @@ diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
 index 7a0193a8..65f71cee 100644
 --- a/cmrtlib/linux/CMakeLists.txt
 +++ b/cmrtlib/linux/CMakeLists.txt
-@@ -32,12 +32,16 @@ else()
+@@ -32,12 +32,16 @@
+ endif()
  
  # Set up compile options that will be used for the Linux build
- if(CMAKE_COMPILER_IS_GNUCC)
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
-     set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing ")
-     set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive -Werror")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -msse4.1 -std=c++11 -fPIC -fpermissive")
-     set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
-     set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
-+    if(MEDIA_BUILD_FATAL_WARNINGS)
-+        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
-+        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
-+    endif()
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
+ set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive -Werror")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CPP_STANDARD_OPTION} -fPIC -fpermissive")
+ set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fno-strict-aliasing")
+ set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -D__DEBUG -O0")
++if(MEDIA_BUILD_FATAL_WARNINGS)
++   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS} -Werror")
++   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS} -Werror")
++endif()
  
-    set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
-    set(CMAKE_SKIP_RPATH ON)
+ set(GCC_SECURE_LINK_FLAGS "-z relro -z now")
+ set(CMAKE_SKIP_RPATH ON)
 -- 
 2.30.2
 
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index 35117f7712..2d5adbcf59 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -6,12 +6,10 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_INTEL_GMMLIB
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  The Intel(R) Media Driver for VAAPI is a new VA-API (Video
 	  Acceleration API) user mode driver supporting hardware
@@ -20,10 +18,6 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 
 	  https://github.com/intel/media-driver
 
-comment "intel-mediadriver needs X.org"
-	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on !BR2_PACKAGE_XORG7
-
 comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 5d016695ae..74dc397041 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a03bd75eefe9cb0245e3aab2723b3fef555d9f180a180b2c29d7b12d483d9ec2  intel-media-19.4.0r.tar.gz
-sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
+sha256  7b190a980447284508969da38971cfdaaf6e69d840d49e81f5969e124bf17e16  intel-media-21.2.3.tar.gz
+sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 01423b9611..31087776e9 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 19.4.0r
+INTEL_MEDIADRIVER_VERSION = 21.2.3
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
@@ -16,8 +16,11 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 	intel-gmmlib \
 	libpciaccess \
 	libva \
-	mesa3d \
-	xlib_libX11
+	mesa3d
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
+endif
 
 INTEL_MEDIADRIVER_SUPPORTS_IN_SOURCE_BUILD = NO
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
