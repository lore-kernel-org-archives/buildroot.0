From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Nov 2018 23:44:31 +0100
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.174
Message-ID: <20181112224431.11501-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-16062: dwarf_getaranges in dwarf_getaranges.c in libdw in elfutils
before 2018-08-18 allows remote attackers to cause a denial of service
(heap-based buffer over-read) via a crafted file.

CVE-2018-16402: libelf/elf_end.c in elfutils 0.173 allows remote attackers
to cause a denial of service (double free and application crash) or possibly
have unspecified other impact because it tries to decompress twice.

CVE-2018-16403: libdw in elfutils 0.173 checks the end of the attributes
list incorrectly in dwarf_getabbrev in dwarf_getabbrev.c and dwarf_hasattr
in dwarf_hasattr.c, leading to a heap-based buffer over-read and an
application crash.

For more details, see the announcement:
https://sourceware.org/ml/elfutils-devel/2018-q3/msg00116.html

0.172 and 0.173 also included fixes for crashes and hangs found by afl-fuzz
(no CVEs assigned):
https://sourceware.org/ml/elfutils-devel/2018-q2/msg00272.html
https://sourceware.org/ml/elfutils-devel/2018-q2/msg00209.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index dc321e9359..5a76cd5868 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.171/sha512.sum
-sha512 777be2d63ca9b11440bf358a33428d9ca974e2612a880934156c9f7194af596ed627c1ed2d48dbd47a3761c94913b8f39565f9dcb6b62c92bf229f04c96d5ee3  elfutils-0.171.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.174/sha512.sum
+sha512 696708309c2a9a076099748809ecdc0490f4a8a842b2efc1aae0d746e7c5a8b203743f5626739eff837216b0c052696516b2821f5d3cc3f2eef86597c96d42df  elfutils-0.174.tar.bz2
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 5eaaaeadad..2d62017bba 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.171
+ELFUTILS_VERSION = 0.174
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.11.0
