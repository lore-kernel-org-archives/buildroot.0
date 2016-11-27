From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:30:52 +0100
Subject: [Buildroot] [git commit] efivar: bump to version 30
Message-ID: <20161201222140.2DBC38026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7497818be7e4fcab7f18edcc5aa857ca93a7d201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use newest release.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fs-to-avoid-the-multiple-definitions-bug-.patch | 29 ++++++++++++++++++++++
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  2 +-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch b/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
new file mode 100644
index 0000000..2bc3ff2
--- /dev/null
+++ b/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
@@ -0,0 +1,29 @@
+From 314eb67b239e60c2ed3700e2baf9cd0e590465f3 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Thu, 27 Oct 2016 09:19:18 -0400
+Subject: [PATCH] Use -z muldefs to avoid the multiple definitions bug
+ without -flto
+
+This fixes github issue #64
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+---
+ Make.defaults | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Make.defaults b/Make.defaults
+index aa974d9..c9d599f 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -32,6 +32,7 @@ cflags	= $(CFLAGS) -I${TOPDIR}/src/include/efivar/ \
+ clang_ccldflags =
+ gcc_ccldflags =
+ ccldflags = $(cflags) -L. $(CCLDFLAGS) $(LDFLAGS) \
++	-Wl,-z,muldefs \
+ 	$(if $(findstring clang,$(CCLD)),$(clang_ccldflags),) \
+ 	$(if $(findstring gcc,$(CCLD)),$(gcc_ccldflags),) \
+ 	$(call pkg-config-ccldflags)
+-- 
+2.10.2
+
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index 3671bbc..e337b96 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 7fed0b31fe796d7dfef40cccb97b8bb0b806f16e568074ad2d456be30e195f5e efivar-28.tar.gz
+sha256 20709c76311f8eb8be92977b7ac008ce62501fa9f7fe885a784321540fc352f9 efivar-30.tar.gz
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index cff3ac1..913322e 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 28
+EFIVAR_VERSION = 30
 EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPLv2.1
 EFIVAR_LICENSE_FILES = COPYING
