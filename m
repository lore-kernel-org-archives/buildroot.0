From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Thu, 15 Aug 2013 11:34:00 -0700
Subject: [Buildroot] [PATCH 1/1] util-linux: enable sfdisk in configs
Message-ID: <1376591640-3698-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e63814f..605e297 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -135,6 +135,11 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
+config BR2_PACKAGE_UTIL_LINUX_SFDISK
+	bool "sfdisk"
+	help
+	  Partition table manipulator for Linux
+
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c6c8467..64112ba 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -68,6 +68,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset,--disable-reset) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SFDISK),--enable-sfdisk,--disable-sfdisk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
-- 
1.8.3.4
