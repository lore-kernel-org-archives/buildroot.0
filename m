From: Xiaobing Luo <luoxiaobing0926@gmail.com>
Date: Mon, 24 May 2021 14:37:15 +0000
Subject: [Buildroot] [PATCH 1/1] package/mtd: add BR2_PACKAGE_MTD_UBIHEALTHD
 option
Message-ID: <20210524143715.578572-1-luoxiaobing0926@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtd-utils-2.1.2 add ubihealthd daemon
package/mtd: add BR2_PACKAGE_MTD_UBIHEALTHD option

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
---
 package/mtd/Config.in | 4 ++++
 package/mtd/mtd.mk    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 590ca7f5ef..c7ad3b3cdc 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -137,6 +137,10 @@ config BR2_PACKAGE_MTD_UBIFORMAT
 	bool "ubiformat"
 	default y
 
+config BR2_PACKAGE_MTD_UBIHEALTHD
+	bool "ubihealthd"
+	default y
+
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index c4fa56d260..121dfa554b 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -96,6 +96,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIATTACH)	+= ubiattach
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBICRC32)		+= ubicrc32
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIDETACH)	+= ubidetach
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIFORMAT)	+= ubiformat
+MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIHEALTHD)	+= ubihealthd
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBIMKVOL)		+= ubimkvol
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINFO)		+= ubinfo
 MTD_TARGETS_$(BR2_PACKAGE_MTD_UBINIZE)		+= ubinize
-- 
2.25.1
