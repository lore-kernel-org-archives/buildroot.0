From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 22:38:53 -0300
Subject: [Buildroot] [PATCH 2/3] opencore-amr: new package
In-Reply-To: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403919534-28847-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                    |  1 +
 package/opencore-amr/Config.in       | 11 +++++++++++
 package/opencore-amr/opencore-amr.mk | 13 +++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/opencore-amr/Config.in
 create mode 100644 package/opencore-amr/opencore-amr.mk

diff --git a/package/Config.in b/package/Config.in
index 075a4be..51cf204 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -515,6 +515,7 @@ menu "Audio/Sound"
 	source "package/libsndfile/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
 	source "package/portaudio/Config.in"
 	source "package/speex/Config.in"
diff --git a/package/opencore-amr/Config.in b/package/opencore-amr/Config.in
new file mode 100644
index 0000000..93b6457
--- /dev/null
+++ b/package/opencore-amr/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_OPENCORE_AMR
+	bool "opencore-amr"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Library of OpenCORE Framework implementation of Adaptive Multi Rate
+	  Narrowband and Wideband (AMR-NB and AMR-WB) speech codec.
+
+	  http://opencore-amr.sourceforge.net/
+
+comment "opencore-amr needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/opencore-amr/opencore-amr.mk b/package/opencore-amr/opencore-amr.mk
new file mode 100644
index 0000000..8b6aa29
--- /dev/null
+++ b/package/opencore-amr/opencore-amr.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# opencore-amr
+#
+################################################################################
+
+OPENCORE_AMR_VERSION = 0.1.3
+OPENCORE_AMR_SITE = http://downloads.sourceforge.net/project/opencore-amr/opencore-amr
+OPENCORE_AMR_INSTALL_STAGING = YES
+OPENCORE_AMR_LICENSE = Apache-2.0
+OPENCORE_AMR_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.5
