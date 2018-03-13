From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 10:04:34 +0200
Subject: [Buildroot] [PATCH] xfsprogs: bump to version 4.15.1
Message-ID: <08a4568f50410fe726ef02849b2d8bfd04679afd.1520928274.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes compatibility with glibc 2.27.

Fixes:
http://autobuild.buildroot.net/results/bd7/bd7e1af33e6e937c75b44c7c9ab991d2b10f2931/
http://autobuild.buildroot.net/results/58b/58b59b74f6a138b51206f24481f7268104f0a052/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch | 10 ++++++----
 package/xfsprogs/xfsprogs.hash                                 |  2 +-
 package/xfsprogs/xfsprogs.mk                                   |  2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 2bb0b7dbcd9c..4eb43480c0d5 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -11,23 +11,25 @@ ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
+[baruch: update for v4.15.1]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  mdrestore/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mdrestore/Makefile b/mdrestore/Makefile
-index 5171306..1b34a0e 100644
+index 136ae716d691..75ff1bad78e9 100644
 --- a/mdrestore/Makefile
 +++ b/mdrestore/Makefile
 @@ -10,7 +10,7 @@ CFILES = xfs_mdrestore.c
  
- LLDLIBS = $(LIBXFS) $(LIBRT) $(LIBPTHREAD) $(LIBUUID)
- LTDEPENDENCIES = $(LIBXFS)
+ LLDLIBS = $(LIBXFS) $(LIBFROG) $(LIBRT) $(LIBPTHREAD) $(LIBUUID)
+ LTDEPENDENCIES = $(LIBXFS) $(LIBFROG)
 -LLDFLAGS = -static
 +LLDFLAGS = -static-libtool-libs
  
  default: depend $(LTCOMMAND)
  
 -- 
-2.7.4
+2.16.1
 
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 886a8f10c54b..c58dbb07669d 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 b1b710b268bc95d6f45eca06e1262c29eb38865a19cd4404e48ba446e043b7ec  xfsprogs-4.14.0.tar.xz
+sha256 27c36de9346a274143ad06c65b2fdbafd2806f3f37fa2c1235a08ed920d2bf3c  xfsprogs-4.15.1.tar.xz
 sha256 ee304b1b1da08b261f1d1f31d229fc70d2d0c552c7429e9e84c0fac878d94209  doc/COPYING
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index e6e8493684f1..7f49e2312f97 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.14.0
+XFSPROGS_VERSION = 4.15.1
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-- 
2.16.1
