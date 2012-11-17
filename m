From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:07 +0100
Subject: [Buildroot] [PATCH 09/10] attr: fix static build
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8d67b671b3a24be1156ae115c84db70a7a48e3fc.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/58a3d4113172813183d43fddc1248b35bd0c4994/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...r-0001-attr-Fix-static-build-installation.patch |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/attr/attr-0001-attr-Fix-static-build-installation.patch

diff --git a/package/attr/attr-0001-attr-Fix-static-build-installation.patch b/package/attr/attr-0001-attr-Fix-static-build-installation.patch
new file mode 100644
index 0000000..ed51dbb
--- /dev/null
+++ b/package/attr/attr-0001-attr-Fix-static-build-installation.patch
@@ -0,0 +1,30 @@
+From 1d510e6049e7c7cb7ed4e87780b2c1a997d47b64 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 17 Nov 2012 19:36:39 +0100
+Subject: [PATCH] attr: Fix static build installation
+
+When doing a static build the .lai file is not created, so do not try
+to install it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/buildmacros |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/buildmacros b/include/buildmacros
+index ab89182..d81e62b 100644
+--- a/include/buildmacros
++++ b/include/buildmacros
+@@ -98,8 +98,7 @@ endif
+ 
+ INSTALL_LTLIB_STATIC = \
+ 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
+-	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
+-	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_DEVLIB_DIR)
++	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);
+ 
+ INSTALL_MAN = \
+ 	@for d in $(MAN_PAGES); do \
+-- 
+1.7.9.5
+
-- 
1.7.9.5
