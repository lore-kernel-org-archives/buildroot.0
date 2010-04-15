From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 15 Apr 2010 14:02:22 +0200
Subject: [Buildroot] [git commit master] mtd: mkfs.jffs2 requires zlib to
	build
Message-ID: <20100415120349.77B927FB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d362cc504dd98c73962ec55d519a3cb1d30ef913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: lzo needed as well]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 5a449f2..16ad4ac 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,6 +6,9 @@
 MTD_VERSION:=1.3.1
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
+MTD_DEPENDENCIES = zlib lzo
+endif
 
 HOST_MTD_DEPENDENCIES = host-lzo host-e2fsprogs
 
-- 
1.6.3.3
