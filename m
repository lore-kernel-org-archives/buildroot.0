From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 23:24:26 +0100
Subject: [Buildroot] [PATCH] mtd: mkfs.jffs2 requires zlib to build
Message-ID: <1271283866-21577-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/mtd/mtd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 5a449f2..3f6d894 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,6 +6,9 @@
 MTD_VERSION:=1.3.1
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
+MTD_DEPENDENCIES = zlib
+endif
 
 HOST_MTD_DEPENDENCIES = host-lzo host-e2fsprogs
 
-- 
1.7.0
