From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 00:14:40 +0200
Subject: [Buildroot] [git commit master 1/1] fs/squashfs: fix endianness
	typo for squashfs3
Message-ID: <20100828221609.F002B87345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=62b4c67b094131db9d1f715a5cef0fd042396338
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stanislav Bogatyrev <bogatyrev_stanislav@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 ++
 fs/squashfs/squashfs.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d244bc..86a2cc2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,8 @@
 	Toolchain: fixed gcc 4.2.x build after uClibc NPTL support got
 	added.
 
+	fs: old-style squashfs for big endian archs fixed.
+
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
 	luafilesystem, lzo, netcat, php, qt, sysvinit, util-linux
 
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index a904182..6117de6 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -10,7 +10,7 @@ else
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
 
 ifeq ($(BR2_ENDIAN),"BIG")
-ROOTFS_SQUASHF_ARGS=-be
+ROOTFS_SQUASHFS_ARGS=-be
 else
 ROOTFS_SQUASHFS_ARGS=-le
 endif
-- 
1.7.1
