From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Jan 2011 10:32:36 -0300
Subject: [Buildroot] [PATCH] wavpack: new package
Message-ID: <1295530356-11558-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/wavpack/Config.in  |    8 ++++++++
 package/multimedia/wavpack/wavpack.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/wavpack/Config.in
 create mode 100644 package/multimedia/wavpack/wavpack.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 6d2cbc7..ba6c927 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -33,4 +33,5 @@ source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
+source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/wavpack/Config.in b/package/multimedia/wavpack/Config.in
new file mode 100644
index 0000000..1ef3e42
--- /dev/null
+++ b/package/multimedia/wavpack/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  WavPack is a completely open audio compression format providing
+	  lossless, high-quality lossy, and a unique hybrid compression mode.
+
+	  http://www.wavpack.com/
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
new file mode 100644
index 0000000..035963a
--- /dev/null
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# wavpack
+#
+################################################################################
+
+WAVPACK_VERSION = 4.60.1
+WAVPACK_SITE = http://www.wavpack.com
+WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
+WAVPACK_INSTALL_STAGING = YES
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+WAVPACK_DEPENDENCIES += libiconv
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,wavpack))
-- 
1.7.3.4
