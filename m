From: Hubert Sokolowski <hubert.sokolowski@intel.com>
Date: Fri, 29 Jul 2016 18:54:59 +0200
Subject: [Buildroot] [PATCH 1/1] lshw: bump version to B.02.18
Message-ID: <1469811299-17096-1-git-send-email-hubert.sokolowski@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version B.02.17 was found to be unstable on recent HW.
Obsolete patches are removed for the following reasons:
- 0001-add-LIBS.patch does not apply and needs to be
  recreated if still needed, the patch was created in 2012
  and since then it was not upstreamed to lshw repo.
- patches from git.alpinelinux.org are no longer available
  on the server.
- the last patch from github.com is included in that version.
This patch was tested with kernel 4.4.16.

Signed-off-by: Hubert Sokolowski <hubert.sokolowski@intel.com>
---
 package/lshw/0001-add-LIBS.patch | 30 ------------------------------
 package/lshw/lshw.hash           |  5 +----
 package/lshw/lshw.mk             |  6 +-----
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/lshw/0001-add-LIBS.patch

diff --git a/package/lshw/0001-add-LIBS.patch b/package/lshw/0001-add-LIBS.patch
deleted file mode 100644
index 70b2a5b..0000000
--- a/package/lshw/0001-add-LIBS.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-We need to be able to pass extra LIBS when our toolchain lacks NLS support,
-this way we can build libintl and link to it.
-A good example is uClibc with locale support disabled.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lshw-B.02.16.orig/src/gui/Makefile lshw-B.02.16/src/gui/Makefile
---- lshw-B.02.16.orig/src/gui/Makefile	2012-05-28 12:32:49.303885759 -0300
-+++ lshw-B.02.16/src/gui/Makefile	2012-05-28 12:33:33.850206001 -0300
-@@ -11,7 +11,7 @@
- CXXFLAGS=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
- CFLAGS=$(CXXFLAGS) $(DEFINES)
- GTKLIBS=$(shell pkg-config gtk+-2.0 gmodule-2.0 --libs)
--LIBS=-L../core -llshw -lresolv -lsqlite3 $(GTKLIBS)
-+LIBS+=-L../core -llshw -lresolv -lsqlite3 $(GTKLIBS)
- LDFLAGS=
- ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
- 	LDFLAGS+= -Wl,--as-needed
-diff -Nura lshw-B.02.16.orig/src/Makefile lshw-B.02.16/src/Makefile
---- lshw-B.02.16.orig/src/Makefile	2012-05-28 12:32:49.292885680 -0300
-+++ lshw-B.02.16/src/Makefile	2012-05-28 12:33:24.530139060 -0300
-@@ -30,7 +30,7 @@
- 	LDFLAGS+= -Wl,--as-needed
- endif
- LDSTATIC=-static
--LIBS=-llshw -lresolv
-+LIBS+=-llshw -lresolv
- ifeq ($(SQLITE), 1)
- 	LIBS+= $(shell pkg-config --libs sqlite3)
- endif
diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 8dfc7d3..0694229 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,5 +1,2 @@
 # Locally calculated
-sha256	eb9cc053fa0f1e78685cb695596e73931bfb55d2377e3bc3b8b94aff4c5a489c	lshw-B.02.17.tar.gz
-sha256	2e5a3d63da8475db17fd90969bcb1930cf19d2b8da7be41edeea5c2a53878382	no-private-uint.patch
-sha256	c8365f7ac8fc7a751c78d89ab446111bb1a235bc977a1b21e1b826c2e62361d1	basename-limits-long-bits.patch
-sha256	9eba284061574e02a6b162ab20dff07c48693e00f781220ee974ba5c90d1cca9	988f5449791ebf869ab9fa7520463dab4eae3404.patch
+sha256	ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f	lshw-B.02.18.tar.gz
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index e8e67e2..9227584 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-LSHW_VERSION = B.02.17
+LSHW_VERSION = B.02.18
 LSHW_SITE = http://ezix.org/software/files
-LSHW_PATCH = \
-	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/basename-limits-long-bits.patch \
-	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/no-private-uint.patch \
-	https://github.com/lyonel/lshw/commit/988f5449791ebf869ab9fa7520463dab4eae3404.patch
 LSHW_LICENSE = GPLv2
 LSHW_LICENSE_FILES = COPYING
 
-- 
2.5.0
