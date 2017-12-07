From: Chris Brandt <chris.brandt@renesas.com>
Date: Thu,  7 Dec 2017 13:46:05 -0500
Subject: [Buildroot] [PATCH] axfsutils: bump version
Message-ID: <20171207184605.15915-1-chris.brandt@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches are no longer needed because they have been pushed back into
the upstream axfs repository.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 package/axfsutils/0001-fix-cflags.patch  | 19 -------------------
 package/axfsutils/0002-use-ldflags.patch | 20 --------------------
 package/axfsutils/axfsutils.hash         |  2 +-
 package/axfsutils/axfsutils.mk           |  2 +-
 4 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/axfsutils/0001-fix-cflags.patch
 delete mode 100644 package/axfsutils/0002-use-ldflags.patch

diff --git a/package/axfsutils/0001-fix-cflags.patch b/package/axfsutils/0001-fix-cflags.patch
deleted file mode 100644
index 0415d82f45..0000000000
--- a/package/axfsutils/0001-fix-cflags.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Makefile: complement CFLAGS provided by the user
-
-In some circumstances, the user may want to pass its own CFLAGS,
-like for when the zlib headers are not located in the standard gcc
-search paths.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN a/mkfs.axfs-legacy/Makefile b/mkfs.axfs-legacy/Makefile
---- a/mkfs.axfs-legacy/Makefile
-+++ b/mkfs.axfs-legacy/Makefile
-@@ -1,5 +1,5 @@
--INC = -I./
--CFLAGS = -g $(INC) -O0
-+INC += -I./
-+CFLAGS += -g $(INC) -O0
- 
- MKFSOBJS = mkfs.axfs.o
- 
diff --git a/package/axfsutils/0002-use-ldflags.patch b/package/axfsutils/0002-use-ldflags.patch
deleted file mode 100644
index 20e03a9bb5..0000000000
--- a/package/axfsutils/0002-use-ldflags.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Makefile: use LDFLAGS as provided by the user
-
-In some circumstances, the user may want to pass some LDFLAGS, like
--L flags to point to the zlib location if it was not installed in a
-standard location.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN a/mkfs.axfs-legacy/Makefile b/mkfs.axfs-legacy/Makefile
---- a/mkfs.axfs-legacy/Makefile
-+++ b/mkfs.axfs-legacy/Makefile
-@@ -6,7 +6,7 @@
- all:   mkfs.axfs
- 
- mkfs.axfs: $(MKFSOBJS)
--	$(CC) $(CFLAGS) -o mkfs.axfs $(MKFSOBJS) -lz
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o mkfs.axfs $(MKFSOBJS) -lz
- 
- clean_mkfs.axfs:
- 	rm -rf $(MKFSOBJS) mkfs.axfs
diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
index bde94a0b90..f7fc659675 100644
--- a/package/axfsutils/axfsutils.hash
+++ b/package/axfsutils/axfsutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 80dd97305b005262643e9fad04ec03b860430ea2c58666ce5b007897afbc9693 axfsutils-64886703fdff6cfc64eb20fbe7d7295bbeec867b.tar.gz
+sha256 2f3bb1ebc0eda1a8d09e927dd8db271fb7ceade06a331cd2369b27c3fd8d5f2f axfsutils-719ab26ca3e61200adc1d643dc89d494a75ee59f.tar.gz
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 00d3a3a8b0..de6d849269 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXFSUTILS_VERSION = 64886703fdff6cfc64eb20fbe7d7295bbeec867b
+AXFSUTILS_VERSION = 719ab26ca3e61200adc1d643dc89d494a75ee59f
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
 AXFSUTILS_LICENSE = GPL-2.0
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
-- 
2.14.1
