From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 23 Dec 2014 11:44:10 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: Add an option to compile
	'nsenter' binary.
Message-ID: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nsenter is a tool to enter the namespace of another process.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5dfd050..2f23419 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -118,6 +118,11 @@ config BR2_PACKAGE_UTIL_LINUX_MESG
 	help
 	  Control write access to your terminal
 
+config BR2_PACKAGE_UTIL_LINUX_NSENTER
+	bool "nsenter"
+	help
+	  Enter the namespaces of another process.
+
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "mount/umount"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e06fa9a..a530596 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -74,6 +74,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
-- 
2.1.3
