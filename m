From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 19:23:45 +0100
Subject: [Buildroot] [git commit] jasper: new package
Message-ID: <20140112182938.A3B479BFDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f596dbdf5fcabed82b6078446da686def7fde2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JPEG-2000 decoder.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/jasper/Config.in |    7 +++++++
 package/jasper/jasper.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 20e142f..c47f1ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/harfbuzz/Config.in"
 source "package/imlib2/Config.in"
+source "package/jasper/Config.in"
 source "package/jpeg/Config.in"
 source "package/lcms2/Config.in"
 source "package/lesstif/Config.in"
diff --git a/package/jasper/Config.in b/package/jasper/Config.in
new file mode 100644
index 0000000..087b520
--- /dev/null
+++ b/package/jasper/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JASPER
+	bool "jasper"
+	select BR2_PACKAGE_JPEG
+	help
+	  JPEG-2000 decoder
+
+	  http://www.ece.uvic.ca/~mdadams/jasper/
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
new file mode 100644
index 0000000..5092ab3
--- /dev/null
+++ b/package/jasper/jasper.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# jasper
+#
+#############################################################
+
+JASPER_VERSION = 1.900.1
+JASPER_SITE = http://sources.openelec.tv/devel
+JASPER_SOURCE = jasper-$(JASPER_VERSION).tar.bz2
+JASPER_INSTALL_STAGING = YES
+JASPER_DEPENDENCIES = jpeg
+JASPER_LICENSE = MIT
+JASPER_LICENSE_FILE = LICENSE
+
+$(eval $(autotools-package))
