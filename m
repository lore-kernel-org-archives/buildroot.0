From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 13:52:23 +0100
Subject: [Buildroot] [git commit master 1/1] libsamplerate: new package
Message-ID: <20110120130801.8A48A8B533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ba84234e831cf8c1c78d5073be5cda474c5f299
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                      |    1 +
 package/multimedia/libsamplerate/Config.in        |    9 +++++++++
 package/multimedia/libsamplerate/libsamplerate.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libsamplerate/Config.in
 create mode 100644 package/multimedia/libsamplerate/libsamplerate.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 6d2cbc7..22c2d03 100644
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
index 0000000..b394fdb
--- /dev/null
+++ b/package/multimedia/libsamplerate/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSAMPLERATE
+	bool "libsamplerate"
+	help
+	  Secret Rabbit Code (aka libsamplerate) is a Sample Rate
+	  Converter for audio. One example of where such a thing would
+	  be useful is converting audio from the CD sample rate of
+	  44.1kHz to the 48kHz sample rate used by DAT players.
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
