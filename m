From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Dec 2013 02:12:15 +0100
Subject: [Buildroot] [PATCH] util-linux: Add config switches for some more
	binaries
Message-ID: <1387242735-4670-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
---
 package/util-linux/Config.in     | 25 +++++++++++++++++++++++++
 package/util-linux/util-linux.mk |  7 ++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8c8fd7a..e972f35 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -54,6 +54,11 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
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
@@ -86,6 +91,11 @@ config BR2_PACKAGE_UTIL_LINUX_KILL
 	help
 	  Send a signal to a process
 
+config BR2_PACKAGE_UTIL_LINUX_LAST
+	bool "last"
+	help
+	  Show listing of last logged in users
+
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on BR2_ENABLE_LOCALE # linux-pam
@@ -96,6 +106,11 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
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
@@ -106,6 +121,11 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
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
@@ -156,6 +176,11 @@ config BR2_PACKAGE_UTIL_LINUX_UUIDD
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
index a694f3d..b05c85a 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -50,19 +50,23 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_DDATE),--enable-ddate,--disable-ddate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
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
@@ -72,6 +76,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
-- 
1.8.5.1
