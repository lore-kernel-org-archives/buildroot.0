From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 20:06:39 +0200
Subject: [Buildroot] [PATCH] new package: libwnck
Message-ID: <1361469999-9963-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libwnck

A window navigation construction kit

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in          |    1 +
 package/libwnck/Config.in  |   13 +++++++++++++
 package/libwnck/libwnck.mk |   19 +++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/libwnck/Config.in
 create mode 100644 package/libwnck/libwnck.mk

diff --git a/package/Config.in b/package/Config.in
index 8588951..51e92a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -433,6 +433,7 @@ source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
+source "package/libwnck/Config.in"
 source "package/opencv/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
diff --git a/package/libwnck/Config.in b/package/libwnck/Config.in
new file mode 100644
index 0000000..42ca4fc
--- /dev/null
+++ b/package/libwnck/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBWNCK
+	bool "libwnck"
+	select	BR2_PACKAGE_LIBGTK2
+	select	BR2_PACKAGE_STARTUP_NOTIFICATION
+	help
+	  libwnck is the Window Navigator Construction Kit, a library for use
+	  in writing pagers, tasklists, and more generally applications that 
+	  are dealing with window management.
+	  It tries hard to respect the Extended Window Manager Hints 
+	  specification (EMWH).
+
+	  http://www.gnome.org
+
diff --git a/package/libwnck/libwnck.mk b/package/libwnck/libwnck.mk
new file mode 100644
index 0000000..54d1866
--- /dev/null
+++ b/package/libwnck/libwnck.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# libwnck
+#
+#############################################################
+
+LIBWNCK_MAJOR_VERSION = 2.30
+LIBWNCK_MINOR_VERSION = 7
+LIBWNCK_VERSION = $(LIBWNCK_MAJOR_VERSION).$(LIBWNCK_MINOR_VERSION)
+LIBWNCK_SOURCE = libwnck-$(LIBWNCK_VERSION).tar.xz
+LIBWNCK_SITE = http://ftp.gnome.org/pub/gnome/sources/libwnck/$(LIBWNCK_MAJOR_VERSION)
+LIBWNCK_INSTALL_STAGING = YES
+LIBWNCK_LICENSE = LGPLv2.1+
+LIBWNCK_LICENSE_FILES = COPYING
+LIBWNCK_DEPENDENCIES = libgtk2 startup-notification
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
