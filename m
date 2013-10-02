From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:32:15 +0200
Subject: [Buildroot] [git commit] nfs-utils: needs mmu
Message-ID: <20131002074535.25D9C9B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bacb55a5d65b8fc36612c8fd40f6366e3e0e80b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error:

mountd-mountd.o: In function `main':
mountd.c:(.text+0x1264): undefined reference to `fork'
mountd.c:(.text+0x1320): undefined reference to `fork'
mountd-rmtab.o: In function `ha_callout':
rmtab.c:(.text+0xa8): undefined reference to `fork'
collect2: ld returned 1 exit status
make[3]: *** [mountd] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 8f61f2b..6ba2f70 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
