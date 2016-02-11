From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 11 Feb 2016 15:39:34 -0500
Subject: [Buildroot] [PATCH 2/2] util-linux: add findfs option
In-Reply-To: <1455223174-5204-1-git-send-email-james.knight@rockwellcollins.com>
References: <1455223174-5204-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <1455223174-5204-2-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the findfs utility option for util-linux package.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Cc: Zheng Yi <yzheng@techyauld.com>
---
 package/util-linux/Config.in     | 5 +++++
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index df89f99..bf6d5c0 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -96,6 +96,11 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 	help
 	  Check and repair a linux filesystem
 
+config BR2_PACKAGE_UTIL_LINUX_FINDFS
+	bool "findfs"
+	help
+	  Find a filesystem by label or UUID
+
 config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	bool "hwclock"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f6e5d62..a892b01 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -74,6 +74,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
-- 
2.6.4.windows.1
