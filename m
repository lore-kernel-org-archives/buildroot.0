From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:33:18 +0200
Subject: [Buildroot] [git commit] package/libsilk: new package
Message-ID: <20150901083108.371FF800E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19ff3f764628a151e08d8c504b8acf240091b1f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix license, it's BSD-3c.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libsilk/Config.in  |    6 ++++++
 package/libsilk/libsilk.mk |   16 ++++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 810f4ae..5912563 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ menu "Audio/Sound"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsidplay2/Config.in"
+	source "package/libsilk/Config.in"
 	source "package/libsndfile/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
diff --git a/package/libsilk/Config.in b/package/libsilk/Config.in
new file mode 100644
index 0000000..10fe03a
--- /dev/null
+++ b/package/libsilk/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSILK
+	bool "libsilk"
+	help
+	  SILK is an audio compression format and audio codec.
+
+	  http://tools.ietf.org/html/draft-vos-silk-01
diff --git a/package/libsilk/libsilk.mk b/package/libsilk/libsilk.mk
new file mode 100644
index 0000000..eefdf8f
--- /dev/null
+++ b/package/libsilk/libsilk.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libsilk
+#
+################################################################################
+
+LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
+# we use the FreeSwitch fork because it contains pkgconf support
+LIBSILK_SITE = https://freeswitch.org/stash/scm/sd/libsilk.git
+LIBSILK_SITE_METHOD = git
+LIBSILK_LICENSE = BSD-3c
+LIBSILK_LICENSE_FILES = COPYING
+LIBSILK_AUTORECONF = YES
+LIBSILK_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
