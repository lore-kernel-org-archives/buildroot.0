From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Jul 2017 22:58:49 +0200
Subject: [Buildroot] [PATCH 3/3] mtd: be explicit about config options for
	the host
In-Reply-To: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170706205849.22298-3-thomas.petazzoni@free-electrons.com>
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
index 3bac2d5..807f559 100644
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
2.9.4
