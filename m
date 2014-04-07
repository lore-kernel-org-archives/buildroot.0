From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 21:38:28 +0200
Subject: [Buildroot] [git commit] Don't build host-xz needlessly
Message-ID: <20140407194135.9A1D79C64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f46f81de1315e6807a5309c0183d8bf336d14000
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit d1f325f554cab (xzcat: treat as host prerequisite and build if
needed) host-xz is always built when the host does not have xz installed.
Removed all other host-xz dependencies.

[Peter: don't drop for host-squashfs, as that needs libxz development files]
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d95c26b..080b8c6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -59,7 +59,6 @@ ROOTFS_$(2)_COMPRESS_EXT = .lzo
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
-ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
 endif
