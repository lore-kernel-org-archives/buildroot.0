From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 28 Jun 2013 20:52:35 +0200
Subject: [Buildroot] [PATCH 2/4] package/libsvg: new package
In-Reply-To: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
References: <1372445557-15546-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1372445557-15546-2-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Libsvg provides a library for parsing SVG content in files or buffers.
Libsvg does not do any rendering, but instead provides a function-based
interface that can be used by various rendering engines.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/Config.in        |    1 +
 package/libsvg/Config.in |   10 ++++++++++
 package/libsvg/libsvg.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libsvg/Config.in
 create mode 100644 package/libsvg/libsvg.mk

diff --git a/package/Config.in b/package/Config.in
index ebeabeb..7f5714d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -461,6 +461,7 @@ source "package/libpng/Config.in"
 source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
+source "package/libsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
diff --git a/package/libsvg/Config.in b/package/libsvg/Config.in
new file mode 100644
index 0000000..0e372fe
--- /dev/null
+++ b/package/libsvg/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSVG
+	bool "libsvg"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Libsvg provides a parser for SVG content in files or buffers.
+	  Libsvg does not do any rendering, but instead provides a
+	  function-based interface that can be used by various rendering
+	  engines.
+
+	  http://www.t2-project.org/packages/libsvg.html
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
new file mode 100644
index 0000000..069314d
--- /dev/null
+++ b/package/libsvg/libsvg.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libsvg
+#
+################################################################################
+
+LIBSVG_VERSION         = 0.1.4
+LIBSVG_SOURCE          = libsvg-$(LIBSVG_VERSION).tar.gz
+LIBSVG_SITE            = http://cairographics.org/snapshots/
+LIBSVG_DEPENDENCIES    = libxml2
+LIBSVG_INSTALL_STAGING = YES
+LIBSVG_LICENSE         = LGPLv2
+LIBSVG_LICENSE_FILES   = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
