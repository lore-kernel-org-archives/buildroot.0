From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:37 +0100
Subject: [Buildroot] [PATCH 07/13] libmodplug: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <c2eecc3b657fbcad032c74fcb8448d65903c8376.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MOD music file decoder.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                |    1 +
 package/libmodplug/Config.in     |   11 +++++++++++
 package/libmodplug/libmodplug.mk |   11 +++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libmodplug/Config.in
 create mode 100644 package/libmodplug/libmodplug.mk

diff --git a/package/Config.in b/package/Config.in
index c6e1fd4..ac021e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -349,6 +349,7 @@ source "package/alsa-lib/Config.in"
 source "package/audiofile/Config.in"
 source "package/celt051/Config.in"
 source "package/libao/Config.in"
+source "package/libmodplug/Config.in"
 source "package/libcdaudio/Config.in"
 source "package/libcdio/Config.in"
 source "package/libcue/Config.in"
diff --git a/package/libmodplug/Config.in b/package/libmodplug/Config.in
new file mode 100644
index 0000000..cdb591f
--- /dev/null
+++ b/package/libmodplug/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBMODPLUG
+	bool "libmodplug"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MOD music file decoder
+
+	  http://modplug-xmms.sourceforge.net/
+
+comment "libmodplug requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
new file mode 100644
index 0000000..889056e
--- /dev/null
+++ b/package/libmodplug/libmodplug.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libmodplug
+#
+#############################################################
+
+LIBMODPLUG_VERSION = 0.8.7
+LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
+LIBMODPLUG_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
