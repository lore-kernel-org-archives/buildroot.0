From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 09:14:48 +0200
Subject: [Buildroot] [git commit] squashfs: needs pthreads support in
	toolchain
Message-ID: <20120611071550.167B696ECF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6828e8e072c243ddc266a0946a4a8bc890fc0e1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/9afdb3f7141fa361ac2ff3fe24887b0c6eb9342d

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squashfs/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 7d0fc71..93d3594 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SQUASHFS_GZIP if !(BR2_PACKAGE_SQUASHFS_LZMA || BR2_PACKAGE_SQUASHFS_LZO)
 	help
 	  Tools to generate SquashFS filesystems.
@@ -36,5 +37,5 @@ config BR2_PACKAGE_SQUASHFS_XZ
 
 endif
 
-comment "squashfs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "squashfs requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
