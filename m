From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:47:54 +0200
Subject: [Buildroot] [git commit branch/next] mtd: add mtdpart option
Message-ID: <20150828181047.5D0B381EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68847ad739e881e603e0473e34ed27ccade55ef9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As pointed by J??rg Krause one of the novelties of the 1.5.2 release is
the new mtdpart tool, so add an option for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/Config.in |    3 +++
 package/mtd/mtd.mk    |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

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
index 42a8c1d..0fb9fc2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -63,6 +63,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_FTL_FORMAT)	+= ftl_format
 MTD_TARGETS_$(BR2_PACKAGE_MTD_JFFS2DUMP)	+= jffs2dump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSJFFS2)	+= mkfs.jffs2
 MTD_TARGETS_$(BR2_PACKAGE_MTD_MTD_DEBUG)	+= mtd_debug
+MTD_TARGETS_$(BR2_PACKAGE_MTD_MTDPART)		+= mtdpart
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDDUMP)		+= nanddump
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDTEST)		+= nandtest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDWRITE)	+= nandwrite
