From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Aug 2015 08:19:38 -0300
Subject: [Buildroot] [PATCH] mtd: add mtdpart option
Message-ID: <1438687178-26675-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by J?rg Krause one of the novelties of the 1.5.2 release is
the new mtdpart tool, so add an option for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtd/Config.in | 3 +++
 package/mtd/mtd.mk    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 6653464..6e4346f 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -71,6 +71,9 @@ config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
 	default y
 
+config BR2_PACKAGE_MTD_MTDPART
+	bool "mtdpart"
+
 config BR2_PACKAGE_MTD_NANDDUMP
 	bool "nanddump"
 	default y
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index edf6e08..fcd68ec 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -65,6 +65,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
 MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTDPART)		+= mtdpart
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
-- 
2.4.6
