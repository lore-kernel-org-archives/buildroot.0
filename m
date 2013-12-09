From: Shawn Landden <shawn@churchofgit.com>
Date: Sun,  8 Dec 2013 16:07:41 -0800
Subject: [Buildroot] [PATCH 2/4] util-linux: nsenter
In-Reply-To: <1386547663-2678-1-git-send-email-shawn@churchofgit.com>
References: <1386547663-2678-1-git-send-email-shawn@churchofgit.com>
Message-ID: <1386547663-2678-2-git-send-email-shawn@churchofgit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shawn Landden <shawn@churchofgit.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8c8fd7a..c8d31ac 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -106,6 +106,11 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	help
 	  Mount/unmount filesystems
 
+config BR2_PACKAGE_UTIL_LINUX_NSENTER
+        bool "nsenter"
+        help
+          Enter namespaces (setns(2) frontend)
+
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20b3d35..af9d7c8 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -62,6 +62,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
+        $(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
-- 
1.8.5.1
