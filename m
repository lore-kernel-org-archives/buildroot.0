From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:48 +0200
Subject: [Buildroot] [PATCH/next 03/10] package/libsilk: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sq silk

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |  1 +
 package/libsilk/Config.in  |  6 ++++++
 package/libsilk/libsilk.mk | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libsilk/Config.in
 create mode 100644 package/libsilk/libsilk.mk

diff --git a/package/Config.in b/package/Config.in
index bf4810f..7a45a6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,6 +706,7 @@ menu "Audio/Sound"
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
index 0000000..12cbcf1
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
+LIBSILK_LICENSE = Skype
+LIBSILK_LICENSE_FILES = COPYING
+LIBSILK_AUTORECONF = YES
+LIBSILK_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.1.4
