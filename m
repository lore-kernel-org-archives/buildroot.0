From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jun 2020 22:52:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/xvkbd: bump to version 4.1
Message-ID: <20200614205231.893919-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version) and so autoreconf
- Update hash of README (update in year, version, miscellaneous
  information)
- Update indentaton in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Makefile-am-fix-install-data-hook.patch | 27 -------------------
 package/xvkbd/xvkbd.hash                      |  6 ++---
 package/xvkbd/xvkbd.mk                        |  4 +--
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/xvkbd/0001-Makefile-am-fix-install-data-hook.patch

diff --git a/package/xvkbd/0001-Makefile-am-fix-install-data-hook.patch b/package/xvkbd/0001-Makefile-am-fix-install-data-hook.patch
deleted file mode 100644
index b275760de1..0000000000
--- a/package/xvkbd/0001-Makefile-am-fix-install-data-hook.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Makefile.am: fix install-data-hook
-
-- Prefix $(appdefaultdir) and $(datarootdir) with $(DESTDIR) to allow
-  cross-compilation
-- Create $(DESTDIR)$(appdefaultdir) if it doesn't exist
-
-Upstream status: sent to Tom Sato <VEF00200@nifty.com>
-
-diff -Nuar xvkbd-4.0-orig/Makefile.am xvkbd-4.0/Makefile.am
---- xvkbd-4.0-orig/Makefile.am	2019-10-06 11:27:13.692243604 +0200
-+++ xvkbd-4.0/Makefile.am	2019-10-06 11:35:15.872263440 +0200
-@@ -17,11 +17,12 @@
- 	[ which ad2c > /dev/null ] || ad2c XVkbd-common.ad > XVkbd-common.h
- 
- install-data-hook:
-+	[ -d $(DESTDIR)$(appdefaultdir) ] || mkdir $(DESTDIR)$(appdefaultdir)
- 	for file in *.ad; do \
--		$(INSTALL_DATA) $$file $(appdefaultdir)/$${file%.ad}; \
-+		$(INSTALL_DATA) $$file $(DESTDIR)$(appdefaultdir)/$${file%.ad}; \
- 	done
--	[ -d $(datarootdir)/xvkbd/ ] || mkdir $(datarootdir)/xvkbd/
--	$(INSTALL_DATA) words.english $(datarootdir)/xvkbd/words.english
-+	[ -d $(DESTDIR)$(datarootdir)/xvkbd/ ] || mkdir $(DESTDIR)$(datarootdir)/xvkbd/
-+	$(INSTALL_DATA) words.english $(DESTDIR)$(datarootdir)/xvkbd/words.english
- 
- EXTRA_DIST = XVkbd-common.h *.ad *.xbm xvkbd.man README ChangeLog Imakefile words.english
- 
diff --git a/package/xvkbd/xvkbd.hash b/package/xvkbd/xvkbd.hash
index dd6ed79b93..8f13ab7c50 100644
--- a/package/xvkbd/xvkbd.hash
+++ b/package/xvkbd/xvkbd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	eb54e440badc40299ba9a8f27fcea740cd3501310e8955651af7ade517a3ac82	xvkbd-4.0.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-sha256	af0d9b39a91d2779e9758d8dacc24d466bea124c1d401687bddc48543516cd68	README
+sha256  952d07df0fe1e45286520b7c98b4fd00fd60dbf3e3e8ff61e12c259f76a3bef4  xvkbd-4.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  5dada320d6b4fb7c76ef110a027b019feaf1149576acf7ac5cacf0d0dcdc3671  README
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 1d056c1c4c..f65c02bc06 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-XVKBD_VERSION = 4.0
+XVKBD_VERSION = 4.1
 XVKBD_SITE = http://t-sato.in.coocan.jp/xvkbd
 XVKBD_LICENSE = GPL-2.0+
 XVKBD_LICENSE_FILES = COPYING README
-# We're patching Makefile.am
-XVKBD_AUTORECONF = YES
 
 XVKBD_DEPENDENCIES = \
 	xlib_libICE \
-- 
2.26.2
