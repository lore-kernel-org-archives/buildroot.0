From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 00:14:25 +0200
Subject: [Buildroot] [git commit] util-linux: Add config switches for some
	more binaries
Message-ID: <20140419221827.9954E9C910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bbe82c4ff43880d78c58cad35f7f9b1beafd4e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     |   20 ++++++++++++++++++++
 package/util-linux/util-linux.mk |    6 +++++-
 2 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b1db99a..cef8009 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -56,6 +56,11 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 	help
 	  Print machine architecture
 
+config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
+	bool "chfn/chsh"
+	help
+	  Change login shell, real user name and information
+
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
@@ -98,6 +103,11 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 comment "login utilities needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_UTIL_LINUX_LOSETUP
+	bool "losetup"
+	help
+	  Set up and control loop devices
+
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
@@ -108,6 +118,11 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	help
 	  Mount/unmount filesystems
 
+config BR2_PACKAGE_UTIL_LINUX_NEWGRP
+	bool "newgrp"
+	help
+	  Log in to a new group
+
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
 	help
@@ -158,6 +173,11 @@ config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	help
 	  UUID generation daemon
 
+config BR2_PACKAGE_UTIL_LINUX_VIPW
+	bool "vipw"
+	help
+	  Edit the password, group, shadow-password or shadow-group file
+
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f0ae3ae..cc57088 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -54,6 +54,7 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_DDATE),--enable-ddate,--disable-ddate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
@@ -64,9 +65,11 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
@@ -76,6 +79,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
