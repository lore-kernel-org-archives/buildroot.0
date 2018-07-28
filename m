From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 22:12:11 +0200
Subject: [Buildroot] [git commit] package/freerdp: bump version to 2.0.0-rc2
Message-ID: <20180728200645.8EFD08A5A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a63aad66d3b129f91b42a4d2f35b94389bc8a88c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with upcoming ffmpeg version 4.0.2.

Removed 0001-Fix-gstreamer-1.0-detection.patch, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../freerdp/0001-Fix-gstreamer-1.0-detection.patch | 28 ----------------------
 package/freerdp/freerdp.hash                       |  2 +-
 package/freerdp/freerdp.mk                         |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch b/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch
deleted file mode 100644
index fadfe117a4..0000000000
--- a/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 368989526c32cdf9d680a397fede3cb773fa2609 Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Fri, 28 Jul 2017 16:31:41 -0400
-Subject: [PATCH 1/1] Fix gstreamer-1.0 detection
-
-[yann.morin.1998 at free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- cmake/FindGStreamer_1_0.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
-index 3aa8fc6dc..6fbc0ecc5 100644
---- a/cmake/FindGStreamer_1_0.cmake
-+++ b/cmake/FindGStreamer_1_0.cmake
-@@ -59,7 +59,7 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
- 
-     string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
-     if ("${CMAKE_MATCH_2}" STREQUAL "")
--        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
-+        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GSTREAMER_1_0_MINIMUM_VERSION}")
-     else ()
-         pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
-     endif ()
--- 
-2.11.0
-
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index f54a03e942..44b7b876a9 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 68e0e3db638a9cc00b978815d9eabedffc23f4410dcaa7a7548bb751766d5b3e  freerdp-2.0.0-rc0.tar.gz
+sha256 a09e338b996fada44bf1277f423240d0fa82289799e2e5dea9d9c63201554de1 freerdp-2.0.0-rc2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 0ceef576a8..48c407b6b5 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.0.0-rc0
+FREERDP_VERSION = 2.0.0-rc2
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
