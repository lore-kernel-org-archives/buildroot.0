From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 22:38:52 -0300
Subject: [Buildroot] [PATCH 1/3] twolame: new package
Message-ID: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          |  1 +
 package/twolame/Config.in  | 13 +++++++++++++
 package/twolame/twolame.mk | 14 ++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/twolame/Config.in
 create mode 100644 package/twolame/twolame.mk

diff --git a/package/Config.in b/package/Config.in
index 838e822..075a4be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/tidsp-binaries/Config.in"
 	source "package/tstools/Config.in"
+	source "package/twolame/Config.in"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
diff --git a/package/twolame/Config.in b/package/twolame/Config.in
new file mode 100644
index 0000000..bd151e2
--- /dev/null
+++ b/package/twolame/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TWOLAME
+	bool "twolame"
+	depends on BR2_LARGEFILE # libsndfile
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  TwoLAME is an optimised MPEG Audio Layer 2 (MP2) encoder based on
+	  tooLAME by Mike Cheng, which in turn is based upon the ISO dist10
+	  code and portions of LAME.
+
+	  http://www.twolame.org/
+
+comment "twolame needs a toolchain w/ largefile"
+        depends on !BR2_LARGEFILE
diff --git a/package/twolame/twolame.mk b/package/twolame/twolame.mk
new file mode 100644
index 0000000..a26491f
--- /dev/null
+++ b/package/twolame/twolame.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# twolame
+#
+################################################################################
+
+TWOLAME_VERSION = 0.3.13
+TWOLAME_SITE = http://downloads.sourceforge.net/project/twolame/twolame/$(TWOLAME_VERSION)
+TWOLAME_DEPENDENCIES = host-pkgconf libsndfile
+TWOLAME_INSTALL_STAGING = YES
+TWOLAME_LICENSE = LGPLv2.1+
+TWOLAME_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.5
