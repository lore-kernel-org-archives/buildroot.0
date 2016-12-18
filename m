From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:56:47 +0100
Subject: [Buildroot] [git commit] xfsprogs: bump to version 4.8.0
Message-ID: <20161218150017.F17B581772@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b36d50b997d0c93a1fcaeae8b121c79de91e6ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the new upstream site on kernel.org, and to a .tar.xz
tarball. The patches are simply refreshed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch | 2 +-
 .../0002-libxfs-do-not-try-to-run-the-crc32selftest.patch         | 6 +++---
 .../xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch   | 8 ++++----
 package/xfsprogs/xfsprogs.hash                                    | 4 ++--
 package/xfsprogs/xfsprogs.mk                                      | 5 +++--
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 7243654..4e4160f 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -1,4 +1,4 @@
-From 0031d25e858ef6336d6b14713edf1695d74cd97a Mon Sep 17 00:00:00 2001
+From 770902a0a29fb4ac62358f7eacb3a83d0d9af1c7 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
 Subject: [PATCH] mdrestore: do not do dynamic linking of libtool libraries
diff --git a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
index 3839713..372a530 100644
--- a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
+++ b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
@@ -1,4 +1,4 @@
-From e10089b31afab3ba86904e89c740cd7051dd5066 Mon Sep 17 00:00:00 2001
+From 3a77dfc54271059dcac305384bf6ace34fe1f3d3 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sun, 18 Dec 2016 15:37:27 +0100
 Subject: [PATCH] libxfs: do not try to run the crc32selftest
@@ -22,10 +22,10 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libxfs/Makefile b/libxfs/Makefile
-index 6499731..5a07723 100644
+index 62608bd..e021625 100644
 --- a/libxfs/Makefile
 +++ b/libxfs/Makefile
-@@ -118,9 +118,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
+@@ -112,9 +112,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
  # don't try linking xfs_repair with a debug libxfs.
  DEBUG = -DNDEBUG
  
diff --git a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
index 4f485a0..36896b5 100644
--- a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
+++ b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
@@ -1,4 +1,4 @@
-From 626f51bf3f12fe294f622900615c72e25ee144c6 Mon Sep 17 00:00:00 2001
+From b981adb6769f6b7d80f6c98627391398a007a25b Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 15 Dec 2015 20:51:35 -0300
 Subject: [PATCH] xfsprogs: don't use CFLAGS with BUILD_CC
@@ -12,10 +12,10 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libxfs/Makefile b/libxfs/Makefile
-index 5a07723..0c37d3e 100644
+index e021625..ad76a04 100644
 --- a/libxfs/Makefile
 +++ b/libxfs/Makefile
-@@ -124,7 +124,7 @@ default: ltdepend $(LTLIBRARY)
+@@ -118,7 +118,7 @@ default: ltdepend $(LTLIBRARY)
  
  crc32table.h: gen_crc32table.c
  	@echo "    [CC]     gen_crc32table"
@@ -24,7 +24,7 @@ index 5a07723..0c37d3e 100644
  	@echo "    [GENERATE] $@"
  	$(Q) ./gen_crc32table > crc32table.h
  
-@@ -135,7 +135,7 @@ crc32table.h: gen_crc32table.c
+@@ -129,7 +129,7 @@ crc32table.h: gen_crc32table.c
  # disk.
  crc32selftest: gen_crc32table.c crc32table.h crc32.c
  	@echo "    [TEST]    CRC32"
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 1f338b0..e990b78 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature:
-#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-4.7.0.tar.gz.sig
-sha256 88580bb3e6847c3edef436703a4fae403fc19b20739db4c31166ee4b256178d7  xfsprogs-4.7.0.tar.gz
+#   https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-4.8.0.tar.sign
+sha256 82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9  xfsprogs-4.8.0.tar.xz
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index b0875d1..e59f1f6 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.7.0
-XFSPROGS_SITE = ftp://oss.sgi.com/projects/xfs/cmd_tars
+XFSPROGS_VERSION = 4.8.0
+XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
+XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 
 XFSPROGS_DEPENDENCIES = util-linux
 
