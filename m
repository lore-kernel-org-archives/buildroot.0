From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 22:45:31 +0100
Subject: [Buildroot] [git commit] util-linux: Add config switches for some
	more binaries
Message-ID: <20131220220716.1C9D59C13E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2746158497cdaf80a5b85584e3972857ac2e7e82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in     |   25 +++++++++++++++++++++++++
 package/util-linux/util-linux.mk |    5 +++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index ed19f39..ae9b669 100644
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
 config BR2_PACKAGE_UTIL_LINUX_NSENTER
 	bool "nsenter"
 	help
@@ -161,6 +181,11 @@ config BR2_PACKAGE_UTIL_LINUX_UUIDD
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
index 5e689f8..db1f4f5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -50,18 +50,22 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
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
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
@@ -73,6 +77,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
