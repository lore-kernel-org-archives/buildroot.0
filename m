From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Fri, 25 Jul 2014 17:28:50 +0530
Subject: [Buildroot] [PATCH] x11vnc: needs MMU
Message-ID: <1406289530-2622-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/b9d/b9d27977a231d186fe5289232f5d3995ec756266//
Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 package/x11vnc/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 5693754..f27cc8a 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU #fork()
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
-- 
1.7.9.5
