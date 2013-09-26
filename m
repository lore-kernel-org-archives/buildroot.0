From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:51 -0500
Subject: [Buildroot] [PATCH v3 08/11] libpng12: new package
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-9-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in            |    1 +
 package/libpng12/Config.in   |    9 +++++++++
 package/libpng12/libpng12.mk |   18 ++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libpng12/Config.in
 create mode 100644 package/libpng12/libpng12.mk

diff --git a/package/Config.in b/package/Config.in
index 408bc24..075bdc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libpng12/Config.in"
 source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
diff --git a/package/libpng12/Config.in b/package/libpng12/Config.in
new file mode 100644
index 0000000..8e36483
--- /dev/null
+++ b/package/libpng12/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBPNG12
+	bool "libpng12"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Library for handling PNG (Portable Network Graphics)
+	  images. This installs the 1.2.x series.  Different versions of
+	  libpng have different APIs.
+
+	  http://www.libpng.org/
diff --git a/package/libpng12/libpng12.mk b/package/libpng12/libpng12.mk
new file mode 100644
index 0000000..39094f2
--- /dev/null
+++ b/package/libpng12/libpng12.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libpng12
+#
+################################################################################
+
+LIBPNG12_VERSION = 1.2.50
+LIBPNG12_SERIES = 12
+LIBPNG12_SOURCE = libpng-$(LIBPNG12_VERSION).tar.bz2
+LIBPNG12_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG12_SERIES)/$(LIBPNG12_VERSION)
+LIBPNG12_LICENSE = libpng license
+LIBPNG12_LICENSE_FILES = LICENSE
+LIBPNG12_INSTALL_STAGING = YES
+LIBPNG12_DEPENDENCIES = host-pkgconf zlib
+LIBPNG12_CONFIG_SCRIPTS = libpng$(LIBPNG12_SERIES)-config libpng-config
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
