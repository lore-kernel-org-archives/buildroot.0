From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Apr 2010 14:02:22 +0200
Subject: [Buildroot] [git commit master] mtd: host compilation needs
	host-zlib
Message-ID: <20100415120349.C15077FB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=237f5a8520e9ba65ff81eafe881d74388d4920ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 16ad4ac..2c69c16 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -10,7 +10,7 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
 
-HOST_MTD_DEPENDENCIES = host-lzo host-e2fsprogs
+HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
 	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-- 
1.6.3.3
