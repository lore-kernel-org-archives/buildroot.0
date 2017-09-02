From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Sep 2017 15:19:05 +0200
Subject: [Buildroot] [PATCH] mtd: be explicit about config options for the
	host
Message-ID: <20170902131905.23134-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of letting auto-detection do its job, be explicit about the
fact that we want the JFFS2 and UBIFS utilities when building the host
variant of mtd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index e666bf077c..824003c691 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -45,7 +45,10 @@ MTD_CONF_OPTS += --without-xattr
 endif
 
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
-HOST_MTD_CONF_OPTS = --disable-tests
+HOST_MTD_CONF_OPTS = \
+	--with-jffs \
+	--with-ubifs \
+	--disable-tests
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/sbin/sumtool
-- 
2.13.5
