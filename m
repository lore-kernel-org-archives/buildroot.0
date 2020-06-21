From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Jun 2020 23:20:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: bump to version 1.0.5
Message-ID: <20200621212038.1809952-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gptfdisk/0001-ldlibs.patch | 31 ------------------------------
 package/gptfdisk/gptfdisk.hash     | 10 +++++-----
 package/gptfdisk/gptfdisk.mk       |  2 +-
 3 files changed, 6 insertions(+), 37 deletions(-)
 delete mode 100644 package/gptfdisk/0001-ldlibs.patch

diff --git a/package/gptfdisk/0001-ldlibs.patch b/package/gptfdisk/0001-ldlibs.patch
deleted file mode 100644
index ca1d7fbfea..0000000000
--- a/package/gptfdisk/0001-ldlibs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Add $(LDLIBS) support to enable clean static builds (for libintl).
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura gptfdisk-0.8.10.orig/Makefile gptfdisk-0.8.10/Makefile
---- gptfdisk-0.8.10.orig/Makefile	2015-05-01 08:45:14.667748141 -0300
-+++ gptfdisk-0.8.10/Makefile	2015-05-01 08:45:42.685699419 -0300
-@@ -14,19 +14,19 @@
- all:	cgdisk gdisk sgdisk fixparts
- 
- gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
--	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
-+	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid $(LDLIBS) -o gdisk
- #	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
- 
- cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
--	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw $(LDLIBS) -o cgdisk
- #	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
- 
- sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
--	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
-+	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt $(LDLIBS) -o sgdisk
- #	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
- 
- fixparts: $(MBR_LIB_OBJS) fixparts.o
--	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
-+	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) $(LDLIBS) -o fixparts
- 
- lint:	#no pre-reqs
- 	lint $(SRCS)
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index 0e52d9917f..bff17dcc21 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,6 +1,6 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.4/
-md5 5ecc3c44913bb6b53d3708d1ac7ac295  gptfdisk-1.0.4.tar.gz
-sha1 4c2d60bedd4eac1014727e3b126de96966205410  gptfdisk-1.0.4.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.5/
+md5  58dac67c85e46ca87b587231549aefe6  gptfdisk-1.0.5.tar.gz
+sha1  b642aa628cbc9fa63e9a73dad5acc588042527ac  gptfdisk-1.0.5.tar.gz
 # Locally computed
-sha256 b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d  gptfdisk-1.0.4.tar.gz
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f  gptfdisk-1.0.5.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index afe4a72886..e848837b76 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.4
+GPTFDISK_VERSION = 1.0.5
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
-- 
2.26.2
