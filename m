From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:30:49 +0100
Subject: [Buildroot] [PATCH] util-linux: add option for lsblk
Message-ID: <1456432249-27364-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds an option to the util-linux package that allows to
build the lsblk utility.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3f9a7db..d4f9a3d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -139,6 +139,11 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	help
 	  Set up and control loop devices
 
+config BR2_PACKAGE_UTIL_LINUX_LSBLK
+	bool "lsblk"
+	help
+	  List block devices.
+
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7342174..141dffd 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -85,6 +85,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
-- 
2.6.4
