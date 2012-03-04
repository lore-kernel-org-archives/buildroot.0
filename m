From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Mar 2012 11:00:39 +0100
Subject: [Buildroot] [git commit] mtd: build after busybox if enabled
Message-ID: <20120304100359.545CF90C29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77cb845b43f9013fa916d0c5fb08492c51dfe2c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox also provides flash applets nowadays, so ensure the mtd version
takes precedence if both are enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 42fa7aa..8ccd4dd 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+MTD_DEPENDENCIES += busybox
+endif
+
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
