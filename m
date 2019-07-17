From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:45:11 +0200
Subject: [Buildroot] [git commit] fs/common.mk: do not store original names
 and timestamps when creating gzipped rootfs
Message-ID: <20190717064413.CD7C38155A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44d17dd128164cfe7870f5bef279e273ba59f83d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the GZIP environment variable to pass gzip options is
deprecated, and therefore we are going to remove the "GZIP = -n"
definition from the main Buildroot Makefile. In preparation for this,
we explicitly add the -n argument to the gzip call in fs/common.mk to
ensure reproducibility.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index fceb38c5b9..ca46a331d6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -115,7 +115,7 @@ ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES = $$(sort \
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
-ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c -n
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
 ROOTFS_$(2)_COMPRESS_EXT = .bz2
