From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:54 +0200
Subject: [Buildroot] [PATCH/next 09/10] package/libsoundtouch: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |  1 +
 package/libsoundtouch/Config.in        |  8 ++++++++
 package/libsoundtouch/libsoundtouch.mk | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/libsoundtouch/Config.in
 create mode 100644 package/libsoundtouch/libsoundtouch.mk

diff --git a/package/Config.in b/package/Config.in
index 8fa4414..627c5b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -712,6 +712,7 @@ menu "Audio/Sound"
 	source "package/libsidplay2/Config.in"
 	source "package/libsilk/Config.in"
 	source "package/libsndfile/Config.in"
+	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
 	source "package/mp4v2/Config.in"
diff --git a/package/libsoundtouch/Config.in b/package/libsoundtouch/Config.in
new file mode 100644
index 0000000..396036f
--- /dev/null
+++ b/package/libsoundtouch/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBSOUNDTOUCH
+	bool "libsoundtouch"
+	help
+	  SoundTouch is an open-source audio processing library for
+	  changing the Tempo, Pitch and Playback Rates of audio streams
+	  or audio files.
+
+	  http://www.surina.net/soundtouch
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
new file mode 100644
index 0000000..cdfec20
--- /dev/null
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libsoundtouch
+#
+################################################################################
+
+LIBSOUNDTOUCH_VERSION = 010a91a59071c7fefd316fca62c0d980ec85b4b1
+LIBSOUNDTOUCH_SITE = https://freeswitch.org/stash/scm/sd/libsoundtouch.git
+LIBSOUNDTOUCH_SITE_METHOD = git
+LIBSOUNDTOUCH_LICENSE = LGPLv2.1+
+LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
+LIBSOUNDTOUCH_AUTORECONF = YES
+LIBSOUNDTOUCH_INSTALL_STAGING = YES
+
+define LIBSOUNDTOUCH_CREATE_CONFIG_M4
+	mkdir -p $(@D)/config/m4
+endef
+LIBSOUNDTOUCH_POST_PATCH_HOOKS += LIBSOUNDTOUCH_CREATE_CONFIG_M4
+
+$(eval $(autotools-package))
-- 
2.1.4
