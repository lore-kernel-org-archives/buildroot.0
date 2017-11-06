From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  6 Nov 2017 22:14:14 +0100
Subject: [Buildroot] [PATCH 3/4 v2] package/freerdp: fix gstreamer-1.x
 detection
In-Reply-To: <cover.1510002833.git.yann.morin.1998@free.fr>
References: <cover.1510002833.git.yann.morin.1998@free.fr>
Message-ID: <b457dba2fde16d5a7dd4d4fc42acb04fbd5d7b79.1510002833.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch from upstream.

Partially fixes:
    http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../freerdp/0001-Fix-gstreamer-1.0-detection.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/freerdp/0001-Fix-gstreamer-1.0-detection.patch

diff --git a/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch b/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch
new file mode 100644
index 0000000000..fadfe117a4
--- /dev/null
+++ b/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch
@@ -0,0 +1,28 @@
+From 368989526c32cdf9d680a397fede3cb773fa2609 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Fri, 28 Jul 2017 16:31:41 -0400
+Subject: [PATCH 1/1] Fix gstreamer-1.0 detection
+
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+ cmake/FindGStreamer_1_0.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
+index 3aa8fc6dc..6fbc0ecc5 100644
+--- a/cmake/FindGStreamer_1_0.cmake
++++ b/cmake/FindGStreamer_1_0.cmake
+@@ -59,7 +59,7 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
+ 
+     string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
+     if ("${CMAKE_MATCH_2}" STREQUAL "")
+-        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
++        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GSTREAMER_1_0_MINIMUM_VERSION}")
+     else ()
+         pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
+     endif ()
+-- 
+2.11.0
+
-- 
2.11.0
