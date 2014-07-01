From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 14:45:46 +0200
Subject: [Buildroot] [git commit] opencore-amr: new package
Message-ID: <20140701125219.188DB9D096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff34b4d60abf556be66a868ba1f27130875d2028
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/opencore-amr/Config.in       |   11 +++++++++++
 package/opencore-amr/opencore-amr.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 648e2c6..4a2cf4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -522,6 +522,7 @@ menu "Audio/Sound"
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
