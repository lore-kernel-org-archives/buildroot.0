From: Martin Kepplinger <martink@posteo.de>
Date: Sun, 30 Apr 2017 10:35:32 +0200
Subject: [Buildroot] [PATCH] x11vnc: make x11vnc select libvncserver
Message-ID: <20170430083532.12941-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x11vnc needs libvncserver, so select it explicitely.

In case of missing libvncserver, we see build failures like this:

http://autobuild.buildroot.net/results/34f/34f8045e772b96293cc7d25bd61ac0aa5842824f/

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/x11vnc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 0909b9aec..4542c5080 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_X11VNC
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_LIBVNCSERVER
 	help
 	  VNC server for X11 display
 
-- 
2.11.0
