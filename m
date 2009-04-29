From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 13:08:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [26241] trunk/buildroot/package/multimedia:
	gst-plugins-base gst-plugins-good gst-pl etc...
Message-ID: <20090429130823.4BA2576461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-29 13:08:22 +0000 (Wed, 29 Apr 2009)
New Revision: 26241

Log:
package/multimedia/gstreamer: bump version

Patch by Sven Neumann <s.neumann@raumfeld.com>, closes #101.

Removed:
   trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
   trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch

Modified:
   trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
   trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk


Changeset:
Deleted: trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.21-build_fix_missing_gtkdoc.patch	2009-04-29 13:08:22 UTC (rev 26241)
@@ -1,31 +0,0 @@
-Submitted By: Ken Moffat <ken@linuxfromscratch dot org>
-Date: 2008-10-15
-Initial Package Version: 0.10.21
-Upstream Status: Not yet known, just raised as gnome bug 556444.
-Origin: Self
-Description: Allows 'make install' to succeed if gtkdoc-rebase is not present.
-
-diff -Naur gst-plugins-base-0.10.21.orig/common/gtk-doc.mak gst-plugins-base-0.10.21/common/gtk-doc.mak
---- gst-plugins-base-0.10.21.orig/common/gtk-doc.mak	2008-09-10 10:13:25.000000000 +0100
-+++ gst-plugins-base-0.10.21/common/gtk-doc.mak	2008-10-15 18:39:02.000000000 +0100
-@@ -201,7 +201,7 @@
- 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
- 	  fi; \
- 	  which gtkdoc-rebase >/dev/null && \
--	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
- 	fi) 
- uninstall-local:
- 	(installfiles=`echo ./html/*.html`; \
-diff -Naur gst-plugins-base-0.10.21.orig/docs/libs/Makefile.in gst-plugins-base-0.10.21/docs/libs/Makefile.in
---- gst-plugins-base-0.10.21.orig/docs/libs/Makefile.in	2008-10-02 23:46:08.000000000 +0100
-+++ gst-plugins-base-0.10.21/docs/libs/Makefile.in	2008-10-15 18:38:42.000000000 +0100
-@@ -822,7 +822,7 @@
- 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
- 	  fi; \
- 	  which gtkdoc-rebase >/dev/null && \
--	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
- 	fi) 
- uninstall-local:
- 	(installfiles=`echo ./html/*.html`; \

Modified: trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gst-plugins-base/gst-plugins-base.mk	2009-04-29 13:08:22 UTC (rev 26241)
@@ -3,10 +3,11 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.21
+GST_PLUGINS_BASE_VERSION = 0.10.22
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
+GST_PLUGINS_BASE_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_BASE_CONF_OPT = \
 		$(DISABLE_NLS) \

Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-04-29 13:08:22 UTC (rev 26241)
@@ -3,9 +3,10 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.11
+GST_PLUGINS_GOOD_VERSION = 0.10.13
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_GOOD_CONF_OPT = \
 		$(DISABLE_NLS) \

Modified: trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk	2009-04-29 13:08:22 UTC (rev 26241)
@@ -3,9 +3,10 @@
 # gst-plugins-ugly
 #
 #############################################################
-GST_PLUGINS_UGLY_VERSION = 0.10.9
+GST_PLUGINS_UGLY_VERSION = 0.10.10
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
+GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_UGLY_CONF_OPT = \
 		$(DISABLE_NLS) \

Deleted: trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch	2009-04-29 13:08:22 UTC (rev 26241)
@@ -1,43 +0,0 @@
-Submitted By: Ken Moffat <ken@linuxfromscratch dot org>
-Date: 2008-10-15
-Initial Package Version: 0.10.21
-Upstream Status: Not yet known, just raised as gnome bug 556348.
-Origin: Self
-Description: Allows 'make install' to succeed if gtkdoc-rebase is not present.
-
-diff -Naur gstreamer-0.10.21.orig/common/gtk-doc.mak gstreamer-0.10.21/common/gtk-doc.mak
---- gstreamer-0.10.21.orig/common/gtk-doc.mak	2008-09-10 10:13:16.000000000 +0100
-+++ gstreamer-0.10.21/common/gtk-doc.mak	2008-10-15 18:12:18.000000000 +0100
-@@ -201,7 +201,7 @@
- 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
- 	  fi; \
- 	  which gtkdoc-rebase >/dev/null && \
--	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
- 	fi) 
- uninstall-local:
- 	(installfiles=`echo ./html/*.html`; \
-diff -Naur gstreamer-0.10.21.orig/docs/gst/Makefile.in gstreamer-0.10.21/docs/gst/Makefile.in
---- gstreamer-0.10.21.orig/docs/gst/Makefile.in	2008-10-02 22:54:18.000000000 +0100
-+++ gstreamer-0.10.21/docs/gst/Makefile.in	2008-10-15 18:12:45.000000000 +0100
-@@ -809,7 +809,7 @@
- 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
- 	  fi; \
- 	  which gtkdoc-rebase >/dev/null && \
--	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
- 	fi) 
- uninstall-local:
- 	(installfiles=`echo ./html/*.html`; \
-diff -Naur gstreamer-0.10.21.orig/docs/libs/Makefile.in gstreamer-0.10.21/docs/libs/Makefile.in
---- gstreamer-0.10.21.orig/docs/libs/Makefile.in	2008-10-02 22:54:18.000000000 +0100
-+++ gstreamer-0.10.21/docs/libs/Makefile.in	2008-10-15 18:12:18.000000000 +0100
-@@ -811,7 +811,7 @@
- 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
- 	  fi; \
- 	  which gtkdoc-rebase >/dev/null && \
--	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
- 	fi) 
- uninstall-local:
- 	(installfiles=`echo ./html/*.html`; \

Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-04-29 12:02:57 UTC (rev 26240)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-04-29 13:08:22 UTC (rev 26241)
@@ -3,10 +3,11 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.21
+GSTREAMER_VERSION = 0.10.22
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
+GSTREAMER_LIBTOOL_PATCH = NO
 
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
