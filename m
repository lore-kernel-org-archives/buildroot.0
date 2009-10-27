From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 22:12:33 +0100
Subject: [Buildroot] [git commit master] synergy: needs C++ support
Message-ID: <20091027211438.BEC2B7773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fca4e38c80c2187cd492a9223851ba25b817814f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    6 +++---
 package/synergy/Config.in |    4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5d0214e..36a1372 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,9 +9,9 @@
 	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
 	libuuid, ltrace, lua, lzma, mdadm, ncftp, ncurses, netkittelnet,
 	netsnmp, ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba,
-	sawman, shared-mime-info, speech-tools, sqlite, squashfs, syslinux,
-	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, zlib
+	sawman, shared-mime-info, speech-tools, sqlite, squashfs, synergy,
+	syslinux, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
+	wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
 
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index fe6a634..a2766b1 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYNERGY
 	bool "synergy"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Synergy lets you easily share a single mouse and
 	  keyboard between multiple computers with different
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SYNERGY
 	  without special hardware.
 
 	  http://synergy2.sourceforge.net/
+
+comment "synergy requires a toolchain with C++ support enabled"
+	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
