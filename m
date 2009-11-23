From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:10:53 +0100
Subject: [Buildroot] [git commit master] ng-spice-rework: needs X11 / libXaw
	support
Message-ID: <20091123141346.5E7DE777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1dd9d9f34563d93868af7fffc02f22d6c65b83a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                    |   12 ++++++------
 package/ng-spice-rework/Config.in          |    2 ++
 package/ng-spice-rework/ng-spice-rework.mk |    4 ++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index fb869f4..43993a7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,12 +26,12 @@
 	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, leafpad,
 	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
 	libupnp, libuuid, libxml2, lighttpd, ltrace, lua, lzma, magiccube4d,
-	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g,
-	openntp, openssl, pcmanfm, php, python, quagga, radvd, rsync, rubix,
-	samba, sawman, sdl, shared-mime-info, spawn-fcgi, speech-tools, sqlite,
-	squashfs, synergy, syslinux, target-binutils, tcpdump, u-boot,
-	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, xboard, xstroke, zlib
+	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp,
+	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, python,
+	quagga, radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info,
+	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
+	target-binutils, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
+	wpa-supplicant, xdata_xcursor-themes, xboard, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/ng-spice-rework/Config.in b/package/ng-spice-rework/Config.in
index 5385042..a82f439 100644
--- a/package/ng-spice-rework/Config.in
+++ b/package/ng-spice-rework/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NG_SPICE_REWORK
 	bool "ng-spice-rework"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  Ngspice is a mixed-level/mixed-signal circuit simulator.
 
diff --git a/package/ng-spice-rework/ng-spice-rework.mk b/package/ng-spice-rework/ng-spice-rework.mk
index 4523647..5f9c5b8 100644
--- a/package/ng-spice-rework/ng-spice-rework.mk
+++ b/package/ng-spice-rework/ng-spice-rework.mk
@@ -12,6 +12,10 @@ NG_SPICE_REWORK_INSTALL_TARGET = YES
 NG_SPICE_REWORK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
+# the above doesn't work with shared config.cache
+NG_SPICE_REWORK_USE_CONFIG_CACHE = NO
+
+NG_SPICE_REWORK_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package,ng-spice-rework))
 
-- 
1.6.3.3
