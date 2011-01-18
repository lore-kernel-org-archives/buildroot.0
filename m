From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:35 -0300
Subject: [Buildroot] [PATCH 05/10] libsamplerate: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in                      |    1 +
 package/multimedia/libsamplerate/Config.in        |    9 +++++++++
 package/multimedia/libsamplerate/libsamplerate.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libsamplerate/Config.in
 create mode 100644 package/multimedia/libsamplerate/libsamplerate.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index ba6c927..cf44d64 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -20,6 +20,7 @@ source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
diff --git a/package/multimedia/libsamplerate/Config.in b/package/multimedia/libsamplerate/Config.in
new file mode 100644
index 0000000..4333b82
--- /dev/null
+++ b/package/multimedia/libsamplerate/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSAMPLERATE
+	bool "libsamplerate"
+	help
+	  Secret Rabbit Code (aka libsamplerate) is a Sample Rate Converter
+	  for audio. One example of where such a thing would be useful
+	  is converting audio from the CD sample rate of 44.1kHz
+	  to the 48kHz sample rate used by DAT players. 
+
+	  http://www.mega-nerd.com/SRC/
diff --git a/package/multimedia/libsamplerate/libsamplerate.mk b/package/multimedia/libsamplerate/libsamplerate.mk
new file mode 100644
index 0000000..94b07a4
--- /dev/null
+++ b/package/multimedia/libsamplerate/libsamplerate.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libsamplerate
+#
+################################################################################
+
+LIBSAMPLERATE_VERSION = 0.1.7
+LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
+LIBSAMPLERATE_INSTALL_STAGING = YES
+LIBSAMPLERATE_DEPENDENCIES = host-pkg-config
+LIBSAMPLERATE_CONF_OPT = --disable-fftw --program-transform-name=''
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LIBSAMPLERATE_DEPENDENCIES += libsndfile
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,libsamplerate))
-- 
1.7.3.4
