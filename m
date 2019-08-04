From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:10:13 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] fs/common.mk: do not
 store original names and timestamps when creating gzipped rootfs
Message-ID: <20190804201436.2C2158CA74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=098cea58fc504a5f70d43c284e8baa2323eb98dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Using the GZIP environment variable to pass gzip options is
deprecated, and therefore we are going to remove the "GZIP = -n"
definition from the main Buildroot Makefile. In preparation for this,
we explicitly add the -n argument to the gzip call in fs/common.mk to
ensure reproducibility.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44d17dd128164cfe7870f5bef279e273ba59f83d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index b361ecce25..34849e698e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -82,7 +82,7 @@ ROOTFS_$(2)_DEPENDENCIES += rootfs-common
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c -n
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
