From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:35:40 +0200
Subject: [Buildroot] [git commit] squashfs: Add lz4 hc compression
Message-ID: <20151004163554.C539481D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07e37bcc42f5b91a94da04178b9bfc8372af634b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lz4 offers a high compression mode. A minimalistic file system shrinks by about 15%.

[Peter: Unconditionally use hc mode for lz4 instead of introducing another option]
Signed-off-by: Matthias Weisser <m.weisser.m@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/squashfs/squashfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 446906f..a71d9cc 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -7,7 +7,7 @@
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
-ROOTFS_SQUASHFS_ARGS += -comp lz4
+ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
 else
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
