From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 28 May 2013 14:01:18 +0200
Subject: [Buildroot] [PATCH v2 1/1] attr: bump to version 2.4.47
Message-ID: <1369742478-31960-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attr-0001-attr-Fix-static-build-installation.patch has been integrated
in the new upstream version.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v1 --> v2
add description regarding the reason of removing a patch

 ...r-0001-attr-Fix-static-build-installation.patch |   30 --------------------
 package/attr/attr.mk                               |    2 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 package/attr/attr-0001-attr-Fix-static-build-installation.patch

diff --git a/package/attr/attr-0001-attr-Fix-static-build-installation.patch b/package/attr/attr-0001-attr-Fix-static-build-installation.patch
deleted file mode 100644
index ed51dbb..0000000
--- a/package/attr/attr-0001-attr-Fix-static-build-installation.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1d510e6049e7c7cb7ed4e87780b2c1a997d47b64 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 17 Nov 2012 19:36:39 +0100
-Subject: [PATCH] attr: Fix static build installation
-
-When doing a static build the .lai file is not created, so do not try
-to install it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/buildmacros |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/include/buildmacros b/include/buildmacros
-index ab89182..d81e62b 100644
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -98,8 +98,7 @@ endif
- 
- INSTALL_LTLIB_STATIC = \
- 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
--	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
--	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_DEVLIB_DIR)
-+	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);
- 
- INSTALL_MAN = \
- 	@for d in $(MAN_PAGES); do \
--- 
-1.7.9.5
-
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 288052d..2b67010 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ATTR_VERSION = 2.4.46
+ATTR_VERSION = 2.4.47
 ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
-- 
1.7.9.5
