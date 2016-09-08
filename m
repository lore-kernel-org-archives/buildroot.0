From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:03:49 +0200
Subject: [Buildroot] [git commit] util-linux: bump version to 2.28.2
Message-ID: <20160908200354.ECCAB8213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=031659024b3cf27bb68dc58d07519b563ef472a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-findfs and --enable-lsblk configure options don't exist
anymore. Now, findfs and lsblk are always built by default unless you
pass --disable-all-programs to the configure script.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in       | 10 ----------
 package/util-linux/util-linux.hash |  2 +-
 package/util-linux/util-linux.mk   |  4 +---
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 657bcdd..b2307f4 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -93,11 +93,6 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	help
 	  Low-level format a floppy disk
 
-config BR2_PACKAGE_UTIL_LINUX_FINDFS
-	bool "findfs"
-	help
-	  Find a filesystem by label or UUID
-
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
 	help
@@ -142,11 +137,6 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	help
 	  Set up and control loop devices
 
-config BR2_PACKAGE_UTIL_LINUX_LSBLK
-	bool "lsblk"
-	help
-	  List block devices.
-
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 17094f4..340ee94 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.28/sha256sums.asc
-sha256	3ece4ea4a34ef786b68f5c415e848390424232abd1ee00f7ee5bddc30657b60f	util-linux-2.28.1.tar.xz
+sha256 b89d37146f20bede93a42c847bce881a17e6dbd8066ff2db2bee733fa409f0cd  util-linux-2.28.2.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3c8496a..aa6f994 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.28
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -71,7 +71,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
@@ -83,7 +82,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
