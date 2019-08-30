From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:28:51 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/elfutils:
 security bump to version 0.176
Message-ID: <20190830202602.AF54F88755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=744ec0ec789d244209a47570c68d016e00fbf1bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes CVE-2018-18310: An invalid memory address dereference was
discovered in dwfl_segment_report_module.c in libdwfl in elfutils
through v0.174. The vulnerability allows attackers to cause a denial of
service (application crash) with a crafted ELF file, as demonstrated by
consider_notes.

Fixes CVE-2018-18520: An Invalid Memory Address Dereference exists in
the function elf_end in libelf in elfutils through v0.174. Although
eu-size is intended to support ar files inside ar files,
handle_ar in size.c closes the outer ar file before handling all inner
entries. The vulnerability allows attackers to cause a denial of service
(application crash) with a crafted ELF file.

Fixes CVE-2018-18521: Divide-by-zero vulnerabilities in the function
arlib_add_symbols() in arlib.c in elfutils 0.174 allow remote attackers
to cause a denial of service (application crash) with a crafted ELF
file, as demonstrated by eu-ranlib, because a zero sh_entsize is
mishandled.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 725531fc323d473a861f078e6a30a1139a0e0350)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.hash | 4 ++--
 package/elfutils/elfutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 5a76cd5868..15dddc2fdf 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.174/sha512.sum
-sha512 696708309c2a9a076099748809ecdc0490f4a8a842b2efc1aae0d746e7c5a8b203743f5626739eff837216b0c052696516b2821f5d3cc3f2eef86597c96d42df  elfutils-0.174.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.176/sha512.sum
+sha512 7f032913be363a43229ded85d495dcf7542b3c85974aaaba0d984228dc9ac1721da3dc388d3fa02325a80940161db7e9ad2c9e4521a424ad8a7d050c0902915b  elfutils-0.176.tar.bz2
 # Locally calculated
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 2d62017bba..ea54862870 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.174
+ELFUTILS_VERSION = 0.176
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
