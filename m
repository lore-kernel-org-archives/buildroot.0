From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 23:39:59 +0100
Subject: [Buildroot] [git commit] package/libvncserver: fix pkg-config file
Message-ID: <20200302222810.300248F18B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bb5d1ceca64123b3b8473fcd375c759ccb735ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a build failure with vlc and without zlib

Fixes:
 - http://autobuild.buildroot.org/results/7d5f5980f1ba248a1d95b380d422eaeeaca265f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...vnc-client-server-.pc.cmakein-remove-zlib.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch b/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch
new file mode 100644
index 0000000000..7941a98882
--- /dev/null
+++ b/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch
@@ -0,0 +1,45 @@
+From 5abd95b65fe5ec24749164338a9718ecce19e240 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 28 Feb 2020 10:29:58 +0100
+Subject: [PATCH] libvnc{client,server}.pc.cmakein: remove zlib
+
+Remove zlib from Requires.private as libvnc can be built without zlib
+thanks to WITH_LIB, zlib will be added to Libs.private thanks to
+PRIVATE_LIBS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibVNC/libvncserver/pull/377]
+---
+ libvncclient.pc.cmakein | 2 +-
+ libvncserver.pc.cmakein | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libvncclient.pc.cmakein b/libvncclient.pc.cmakein
+index 336e73f..ceeda39 100644
+--- a/libvncclient.pc.cmakein
++++ b/libvncclient.pc.cmakein
+@@ -7,7 +7,7 @@ Name: LibVNCClient
+ Description: A library for easy implementation of a VNC client.
+ Version: @LibVNCServer_VERSION@
+ Requires:
+-Requires.private: zlib
++Requires.private:
+ Libs: -L${libdir} -lvncclient
+ Libs.private: @PRIVATE_LIBS@
+ Cflags: -I${includedir}
+diff --git a/libvncserver.pc.cmakein b/libvncserver.pc.cmakein
+index dfcec9d..33ec668 100644
+--- a/libvncserver.pc.cmakein
++++ b/libvncserver.pc.cmakein
+@@ -7,7 +7,7 @@ Name: LibVNCServer
+ Description: A library for easy implementation of a VNC server.
+ Version: @LibVNCServer_VERSION@
+ Requires:
+-Requires.private: zlib
++Requires.private:
+ Libs: -L${libdir} -lvncserver
+ Libs.private: @PRIVATE_LIBS@
+ Cflags: -I${includedir}
+-- 
+2.25.0
+
