From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 19:49:36 +0100
Subject: [Buildroot] [git commit] util-linux: add option for lsblk
Message-ID: <20160302202758.8E4EC7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=025cb6ba54137fc792106ca05d97a544f1ab2b35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds an option to the util-linux package that allows to
build the lsblk utility.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index df89f99..ea23115 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -134,6 +134,11 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
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
index f6e5d62..cf9505c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -84,6 +84,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
