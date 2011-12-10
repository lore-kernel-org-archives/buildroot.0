From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:13:15 +0100
Subject: [Buildroot] [git commit] New package: giblib
Message-ID: <20111210222040.C5A0B8F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5917191b3fd88104493165c1bcb0e116b1f848da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Needs X support and X support in imlib2]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-By: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/giblib/Config.in |   10 ++++++++++
 package/giblib/giblib.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 50fbfc0..cf0f400 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -277,6 +277,7 @@ source "package/cairo/Config.in"
 source "package/fltk/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
+source "package/giblib/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
new file mode 100644
index 0000000..7153bd5
--- /dev/null
+++ b/package/giblib/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GIBLIB
+	bool "giblib"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_IMLIB2
+	select BR2_PACKAGE_IMLIB2_X
+	help
+	  Giblib is a simple library which wraps imlib2.
+
+	  http://linuxbrit.co.uk/giblib/
+
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
new file mode 100644
index 0000000..8288b74
--- /dev/null
+++ b/package/giblib/giblib.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# giblib
+#
+#############################################################
+GIBLIB_VERSION = 1.2.4
+GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
+GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
+GIBLIB_INSTALL_STAGING = YES
+GIBLIB_DEPENDENCIES = imlib2
+GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
+		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
+
+$(eval $(call AUTOTARGETS))
