From: Daniel Mack <daniel@caiaq.de>
Date: Wed,  3 Jun 2009 13:39:05 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
Message-ID: <1244029145-11832-2-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update git version for mtd-utils.git.

In this new version, a new tool named 'ubiformat' exists which is
exported by this patch.

The tool ubimirror does not exist anymore, remove support for it.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/mtd/Config.in            |   10 +++++-----
 package/mtd/mtd-utils.git/mtd.mk |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 2dd41be..a21fc45 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -139,11 +139,6 @@ config BR2_PACKAGE_MTD_UBIDETACH
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
-config BR2_PACKAGE_MTD_UBIMIRROR
-	bool "ubimirror"
-	default y
-	depends on BR2_PACKAGE_MTD_UTILS_GIT
-
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
@@ -164,5 +159,10 @@ config BR2_PACKAGE_MTD_UBIUPDATEVOL
 	default y
 	depends on BR2_PACKAGE_MTD_UTILS_GIT
 
+config BR2_PACKAGE_MTD_UBIFORMAT
+	bool "ubiformat"
+	default y
+	depends on BR2_PACKAGE_MTD_UTILS_GIT
+
 endif
 
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index ca25ee5..ad3a537 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=e783e75e09b4a0a519665afd7bdeaf2985e7a09c
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
@@ -98,11 +98,11 @@ MTD_TARGETS_UBI_y :=
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIATTACH) += ubiattach
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBICRC32) += ubicrc32
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIDETACH) += ubidetach
-MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMIRROR) += ubimirror
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIMKVOL) += ubimkvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBINFO) += ubinfo
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL) += ubirmvol
 MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL) += ubiupdatevol
+MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIFORMAT) += ubiformat
 
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y)) $(addprefix $(MTD_DIR)/ubi-utils/, $(MTD_TARGETS_UBI_y))
 
-- 
1.6.3.1
