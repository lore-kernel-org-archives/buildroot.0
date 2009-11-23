From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] pcmanfm: needs X11 support
Message-ID: <20091123120649.8B94E77782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b06f14e4f79fd3ece4c087ea10e940544cc9b804
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |   11 ++++++-----
 package/pcmanfm/Config.in  |    1 +
 package/pcmanfm/pcmanfm.mk |    2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6404f37..203124d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,11 +26,12 @@
 	ipkg, iptables, iw, kernel-headers, kismet, libelf, libevent, libglib2,
 	libidn, liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd,
 	ltrace, lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
-	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python, quagga,
-	radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
-	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
-	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, xboard, xstroke, zlib
+	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, pcmanfm, php,
+	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
+	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
+	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
+	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard, xstroke,
+	zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index c7ad887..9a00bc0 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_LIBGTK2
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 217893b..3a300ca 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -12,7 +12,7 @@ PCMANFM_INSTALL_TARGET = YES
 
 PCMANFM_CONF_OPT = --disable-hal
 
-PCMANFM_DEPENDENCIES = host-pkgconfig libgtk2 gamin startup-notification
+PCMANFM_DEPENDENCIES = host-pkgconfig libgtk2 gamin startup-notification xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,pcmanfm))
 
-- 
1.6.3.3
