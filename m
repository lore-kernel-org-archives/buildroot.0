From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 29 Apr 2013 17:39:47 -0700
Subject: [Buildroot] [PATCH] fdk-aac: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1367282387-8011-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in          |    1 +
 package/fdk-aac/Config.in  |   12 ++++++++++++
 package/fdk-aac/fdk-aac.mk |   14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/fdk-aac/Config.in
 create mode 100644 package/fdk-aac/fdk-aac.mk

diff --git a/package/Config.in b/package/Config.in
index 56fdd2f..9a06284 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ menu "Audio/Sound"
 source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
+source "package/fdk-aac/Config.in"
 source "package/libao/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
new file mode 100644
index 0000000..4fba357
--- /dev/null
+++ b/package/fdk-aac/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FDK_AAC
+	bool "fdk-aac"
+	# These architectures are not supported by FDK AAC
+	depends on !(BR2_bfin || BR2_avr32 || BR2_sparc || BR2_xtensa \
+			|| BR2_microblaze)
+	help
+	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
+	  is software that implements the MPEG Advanced Audio Coding ("AAC")
+	  encoding and decoding scheme for digital audio
+
+	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
+
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
new file mode 100644
index 0000000..b36f144
--- /dev/null
+++ b/package/fdk-aac/fdk-aac.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# fdk-aac
+#
+#############################################################
+
+FDK_AAC_VERSION = 0.1.1
+FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
+FDK_AAC_LICENSE = fdk-aac license
+FDK_AAC_LICENSE_FILES = NOTICE
+
+FDK_AAC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
