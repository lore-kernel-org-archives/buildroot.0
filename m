From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 20:06:14 +0200
Subject: [Buildroot] [git commit master] util-linux: needs RPC support in
	toolchain
Message-ID: <20091005180641.78F8877783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2bd02ce28c84d31431599bf5be09cb7225f67aff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/util-linux/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index a53ae81..5479361 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	libevent, libglib2, liblockfile, libmad, libupnp, libuuid, ltrace,
 	lua, mdadm, ncftp, ncurses, netkittelnet, openssl, python,
 	quagga, radvd, samba, shared-mime-info, speech-tools,
-	squashfs, syslinux, u-boot, valgrind, vsftpd, wipe,
+	squashfs, syslinux, u-boot, util-linux, valgrind, vsftpd, wipe,
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index f8af6bb..93a0522 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -2,9 +2,13 @@ config BR2_PACKAGE_UTIL-LINUX
 	bool "util-linux"
 	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
+	depends on BR2_INET_RPC
 	help
 	  Various useful/essential Linux utilities.
 
 	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
 
 	  http://www.kernel.org/pub/linux/utils/util-linux/
+
+comment "netkitbase requires a toolchain with RPC support"
+        depends on !BR2_INET_RPC
-- 
1.6.3.3
