From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:37:51 +0200
Subject: [Buildroot] [git commit] squashfs: add host zstd support
Message-ID: <20180425213802.E046588E17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4693b6a1e62ef98f45ad307b3a0a18587165073f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squashfs/squashfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index e656218f97..67025ac68a 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -46,7 +46,7 @@ else
 SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
 endif
 
-HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
+HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
 
 HOST_SQUASHFS_MAKE_ARGS = \
 	XATTR_SUPPORT=1 \
@@ -55,7 +55,7 @@ HOST_SQUASHFS_MAKE_ARGS = \
 	LZ4_SUPPORT=1 \
 	LZO_SUPPORT=1 \
 	LZMA_XZ_SUPPORT=1 \
-	ZSTD_SUPPORT=0
+	ZSTD_SUPPORT=1
 
 define SQUASHFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
