From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Sep 2010 09:21:24 +0200
Subject: [Buildroot] [git commit master 1/1] zlib: Fix build
Message-ID: <20100920072226.EA7798293D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3df6b56f53a0dd92752a23e63a0ee5fcacc8ffd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using "make -j $(N)" with N > 1 sometimes breaks zlib build.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/zlib/zlib.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f8501b4..92d06be 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,7 +24,7 @@
 	pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
 	shared-mime-info, speex, sqlite, strace, taglib, tcpdump,
 	tiff, tn5250, udev, udpcast, usbmount, usbutils, which,
-	xlib_libX11
+	xlib_libX11, zlib
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index ad5eda7..751cfc1 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -42,11 +42,11 @@ define HOST_ZLIB_CONFIGURE_CMDS
 endef
 
 define ZLIB_BUILD_CMDS
-	$(MAKE) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D) all libz.a
 endef
 
 define HOST_ZLIB_BUILD_CMDS
-	$(MAKE) -C $(@D) all libz.a
+	$(MAKE1) -C $(@D) all libz.a
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
-- 
1.7.1
