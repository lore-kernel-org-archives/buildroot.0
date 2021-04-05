From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  5 Apr 2021 12:26:14 +0200
Subject: [Buildroot] [PATCH] package/quickjs: bump to version 2021-03-27
Message-ID: <20210405102614.176581-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove patch (merged upstream)
- file LICENSE added

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ile-add-optional-link-with-libatomic.patch | 37 -------------------
 package/quickjs/quickjs.hash                  |  3 +-
 package/quickjs/quickjs.mk                    |  3 +-
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch

diff --git a/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch b/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
deleted file mode 100644
index 76634a51a..000000000
--- a/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2cf2aa34d5d55a4eedb1aedd4d56d89d24870230 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 3 Jan 2021 21:11:44 +0100
-Subject: [PATCH] Makefile: allow linking with extra libraries
-
-With some toolchains, it is neede to link with extra libraries, for
-example with -latomic, to fix:
-
-  .../build/quickjs-2020-11-08/quickjs.c:12229: undefined reference to `__atomic_fetch_xor_1'
-
-Fixes:
-  http://autobuild.buildroot.net/results/e0766eef95a2559d51e58d1a81a9c40df84ae509
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[yann.morin.1998 at free.fr:
-  - make it a generic variable, not tied to -latomic
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index e6ae827..22ad496 100644
---- a/Makefile
-+++ b/Makefile
-@@ -179,6 +179,7 @@ endif
- ifndef CONFIG_WIN32
- LIBS+=-ldl -lpthread
- endif
-+LIBS+=$(EXTRA_LIBS)
- 
- $(OBJDIR):
- 	mkdir -p $(OBJDIR) $(OBJDIR)/examples $(OBJDIR)/tests
--- 
-2.29.2
-
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 5dbd4575f..b6f160800 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  2e9d63dab390a95ed365238f21d8e9069187f7ed195782027f0ab311bb64187b  quickjs-2020-11-08.tar.xz
+sha256  a45bface4c3379538dea8533878d694e289330488ea7028b105f72572fe7fe1a  quickjs-2021-03-27.tar.xz
+sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index b85c255f2..a026eec4f 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2020-11-08
+QUICKJS_VERSION = 2021-03-27
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
+QUICKJS_LICENSE_FILES = LICENSE
 QUICKJS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.27.0
