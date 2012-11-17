From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:49:20 +0100
Subject: [Buildroot] [git commit] attr: fix static build
Message-ID: <20121117225527.2E2F49A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ad2879a8bca386fa5c256a4286ccc928601cc1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/58a3d4113172813183d43fddc1248b35bd0c4994/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...r-0001-attr-Fix-static-build-installation.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

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
