From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:26:01 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: fix
 gstreamer-1.x detection
Message-ID: <20171113221623.315E8807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45f0c11aaab8eff3c8c041936b64931f66fc8a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport a patch from upstream.

Partially fixes:
    http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../freerdp/0001-Fix-gstreamer-1.0-detection.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch b/package/freerdp/0001-Fix-gstreamer-1.0-detection.patch
new file mode 100644
index 0000000..fadfe11
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
