From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] package/xstroke: needs X11 support
Message-ID: <20091123120645.EECB377782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5bb205b8e2d1638ea75002a187968ea4c263d19f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/xstroke/Config.in  |    1 +
 package/xstroke/xstroke.mk |    2 ++
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 26bf3fa..a6e10ef 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,7 +30,7 @@
 	rsync, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
 	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
 	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, zlib
+	xdata_xcursor-themes, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
 
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 96cf980..dc904cb 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_DOCKER
 	help
 	  Handwriting recognition for X
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index c484959..bfe66cc 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -11,5 +11,7 @@ XSTROKE_INSTALL_STAGING = NO
 XSTROKE_INSTALL_TARGET = YES
 XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
+XSTROKE_DEPENDENCIES = xserver_xorg-server
+
 $(eval $(call AUTOTARGETS,package,xstroke))
 
-- 
1.6.3.3
