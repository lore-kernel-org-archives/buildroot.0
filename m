From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 10 Sep 2014 15:29:29 +0530
Subject: [Buildroot] [PATCH] xapp_xdpyinfo: depends on MMU
Message-ID: <1410343169-2722-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/2da/2dada0264409d8fa6befedbc02c0de77c605a5fa//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/x11r7/xapp_xdpyinfo/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index 6584ae1..8527903 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XDPYINFO
 	bool "xdpyinfo"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
-- 
1.7.9.5
