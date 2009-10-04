From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Oct 2009 22:20:28 +0200
Subject: [Buildroot] [git commit master] libupnp: needs largefile support in
	toolchain
Message-ID: <20091004202132.8592977762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5791db7cd27da91a485b89673a87379a4a57470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    2 +-
 package/libupnp/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 60ee32f..a53ae81 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	festival, imagemagick, iptables, kernel-headers, kismet,
-	libevent, libglib2, liblockfile, libmad, libuuid, ltrace,
+	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
 	lua, mdadm, ncftp, ncurses, netkittelnet, openssl, python,
 	quagga, radvd, samba, shared-mime-info, speech-tools,
 	squashfs, syslinux, u-boot, valgrind, vsftpd, wipe,
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 6b1a6cf..2e6edcd 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
+	depends on BR2_LARGEFILE
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
 	  with an API and open source code for building control points,
@@ -7,3 +8,6 @@ config BR2_PACKAGE_LIBUPNP
 	  Universal Plug and Play Device Architecture Specification
 
 	  http://pupnp.sourceforge.net/
+
+comment "libupnp requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
