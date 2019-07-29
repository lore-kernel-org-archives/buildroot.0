From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 29 Jul 2019 14:11:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/host-mtd: fixes build
Message-ID: <1564402300-3993-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Fixes following build error when Host doesn't have zstd devt files:
  configure: WARNING: cannot find ZSTD library required for mkfs program
  configure: mtd-utils can optionally be built without mkfs.ubifs
  configure: mtd-utils can optionally be built without ZSTD support
  configure: WARNING: cannot find headers for OpenSSL library
  configure: WARNING: disabling OpenSSL support
  configure: error: missing one or more dependencies
  package/pkg-generic.mk:228: recipe for target '/workspace/buildroot_git_devt/output/build/host-mtd-2.1.1/.stamp_configured' failed
  make: *** [/workspace/buildroot_git_devt/output/build/host-mtd-2.1.1/.stamp_configured] Error 1

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 0de14db..65e7622 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -46,7 +46,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
+HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
-- 
2.1.4
