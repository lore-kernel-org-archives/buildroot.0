From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:44:05 +0100
Subject: [Buildroot] [git commit] Revert "util-linux: add nsenter option"
Message-ID: <20140208214757.60B499C8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d293e64bfb75c4cbaab7e46472de674ee813d4aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9f91d79601da42516752318beecfd080dc05aac9.

Not all toolchains have setns(), and the configure script automatically
enables nsenter if it does, so get rid of the explicit option.

See http://lists.busybox.net/pipermail/buildroot/2014-February/088669.html
for details.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in     |    5 -----
 package/util-linux/util-linux.mk |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index ed19f39..8c8fd7a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -106,11 +106,6 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	help
 	  Mount/unmount filesystems
 
-config BR2_PACKAGE_UTIL_LINUX_NSENTER
-	bool "nsenter"
-	help
-	  Enter namespaces (setns(2) frontend)
-
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5e689f8..20b3d35 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -62,7 +62,6 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
