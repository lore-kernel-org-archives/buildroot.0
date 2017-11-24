From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:37:18 +0100
Subject: [Buildroot] [git commit branch/next] mtd: be explicit about config
 options for the host
Message-ID: <20171124203245.3A38D81454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d2e7522ed18a1bd06aa9bd22c46e71d90bcf0bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of letting auto-detection do its job, be explicit about the
fact that we want the JFFS2 and UBIFS utilities when building the host
variant of mtd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a69ef40..7094aad 100644
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
