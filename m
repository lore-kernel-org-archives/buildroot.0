From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sun, 23 May 2021 10:35:08 +0000
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version 1.6.9
Message-ID: <20210523103508.29359-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...-makedumpfile.h-fix-build-on-sparc64.patch | 35 -------------------
 package/makedumpfile/makedumpfile.hash        |  2 +-
 package/makedumpfile/makedumpfile.mk          |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch

diff --git a/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch b/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch
deleted file mode 100644
index defc101949..0000000000
--- a/package/makedumpfile/0002-makedumpfile.h-fix-build-on-sparc64.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2c132ac5e6656723821acdb0ee57b34c42851fed Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 4 Feb 2021 20:15:56 +0100
-Subject: [PATCH] makedumpfile.h: fix build on sparc64
-
-Fix the following build failure on sparc64:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: /tmp/ccylTux8.o: in function `find_kaslr_offsets':
-/home/giuliobenetti/autobuild/run/instance-0/output-1/build/makedumpfile-1.6.8/makedumpfile.c:4017: undefined reference to `get_kaslr_offset'
-
-Fixes:
- - http://autobuild.buildroot.org/results/1421f54f7599bba62c0a4bd5c65ce21c8cc7ee1a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-http://lists.infradead.org/pipermail/kexec/2021-February/021996.html]
----
- makedumpfile.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/makedumpfile.h b/makedumpfile.h
-index 97a5554..dfc1a77 100644
---- a/makedumpfile.h
-+++ b/makedumpfile.h
-@@ -1139,6 +1139,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
- #define get_machdep_info()      TRUE
- #define get_phys_base()         get_phys_base_sparc64()
- #define get_versiondep_info()   get_versiondep_info_sparc64()
-+#define get_kaslr_offset(X)     stub_false()
- #define vaddr_to_paddr(X)       vaddr_to_paddr_sparc64(X)
- #define paddr_to_vaddr(X)	paddr_to_vaddr_general(X)
- #define is_phys_addr(X)		stub_true_ul(X)
--- 
-2.29.2
-
diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 1b2df008d2..f85f334cbf 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  85d79b7090e9a8ce0d426795d3bc1de2858def7e12954d9bc6ae03de160b694c  makedumpfile-1.6.8.tar.gz
+sha256  393ea8f22393c059ad21de9b1c3f45d9d0d8dbeb0ccb1417815b835d03f7c350  makedumpfile-1.6.9.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 99fb3a71c8..16271e2246 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.6.8
+MAKEDUMPFILE_VERSION = 1.6.9
 MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
-- 
2.31.1
