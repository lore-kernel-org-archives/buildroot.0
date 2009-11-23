From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:29:43 +0100
Subject: [Buildroot] [git commit master] torsmo: needs X11 support
Message-ID: <20091123143317.CE7067772B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a9f379abf0569bc99cd1ea12291bfd41521430b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    6 +++---
 package/torsmo/Config.in |    1 +
 package/torsmo/torsmo.mk |    2 ++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9ff8793..40ebf17 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,9 +30,9 @@
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
 	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
-	synergy, syslinux, target-binutils, tcpdump, u-boot, util-linux,
-	valgrind, vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard,
-	xstroke, zlib
+	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot,
+	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	xdata_xcursor-themes, xboard, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index 58b9feb..ec9cb22 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Torsmo is a system monitor that sits in the corner of your desktop.
 
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index f9aa71d..03477d1 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -12,5 +12,7 @@ TORSMO_INSTALL_TARGET = YES
 
 TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
 
+TORSMO_DEPENDENCIES = xserver_xorg-server
+
 $(eval $(call AUTOTARGETS,package,torsmo))
 
-- 
1.6.3.3
