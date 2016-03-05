From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:11:29 +0100
Subject: [Buildroot] [git commit] package: remove _gp issue workaround for
	Codesourcery nios2 toolchain
Message-ID: <20160305181216.F386A7FB22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f844ac4e67ef7fa87482064015c71030ab53c47a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _gp link issue has been fixed in CS nios2 2015.11.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in         | 3 ---
 package/crda/Config.in          | 3 ---
 package/cryptsetup/Config.in    | 3 ---
 package/dmraid/Config.in        | 4 ----
 package/janus-gateway/Config.in | 2 --
 package/libmicrohttpd/Config.in | 3 ---
 package/libssh2/Config.in       | 2 --
 package/libupnpp/Config.in      | 3 ---
 package/mesa3d/Config.in        | 3 ---
 package/mosquitto/Config.in     | 3 ---
 package/php-ssh2/Config.in      | 2 --
 package/upmpdcli/Config.in      | 3 ---
 12 files changed, 34 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 2bfd649..b346328 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
@@ -23,4 +21,3 @@ config BR2_PACKAGE_AICCU
 comment "aiccu needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/crda/Config.in b/package/crda/Config.in
index 4eb1643..2b9332f 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_CRDA
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
 	select BR2_PACKAGE_WIRELESS_REGDB
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  Central Regulatory Domain Agent.
 
@@ -20,4 +18,3 @@ config BR2_PACKAGE_CRDA
 
 comment "crda needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 321b97d..80671ee 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -9,8 +9,6 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # util-linux
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
@@ -20,4 +18,3 @@ config BR2_PACKAGE_CRYPTSETUP
 comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index d278a11..4a8cf61 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
-	# dmraid triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -15,6 +13,4 @@ config BR2_PACKAGE_DMRAID
 
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	# dmraid triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 1c00d32..035ee6c 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_JANUS_GATEWAY
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libmicrohttpd
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
@@ -21,4 +20,3 @@ config BR2_PACKAGE_JANUS_GATEWAY
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 68191ea..ec0b715 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
@@ -26,4 +24,3 @@ endif
 
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index ea4bb3b..017fd40 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 17a3391..2d99586 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_LIBUPNPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
 	  upplay.
@@ -15,5 +13,4 @@ config BR2_PACKAGE_LIBUPNPP
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.6"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8c72a3d..9057746 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -3,8 +3,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	# Triggers the _gp link issue in nios2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
@@ -169,6 +167,5 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index ab598d0..50937d0 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # builds .so
-	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  Mosquitto is an open source message broker that implements
 	  the MQ Telemetry Transport protocol versions 3.1 and
@@ -18,4 +16,3 @@ config BR2_PACKAGE_MOSQUITTO
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
index 9b8a3f8..b457900 100644
--- a/package/php-ssh2/Config.in
+++ b/package/php-ssh2/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PHP_SSH2
 	bool "php-ssh2"
 	depends on BR2_PACKAGE_PHP
 	select BR2_PACKAGE_LIBSSH2
-	# Triggers the _gp link issue (libssh2)
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  PHP bindings for the libssh2 library.
 
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 1502095..3218205 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	# libupnpp triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
@@ -15,5 +13,4 @@ config BR2_PACKAGE_UPMPDCLI
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
