From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 14:43:02 +0200
Subject: [Buildroot] [git commit] twolame: new package
Message-ID: <20140701125219.07D029D125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da8915b4ee6ea58106a3c7b4e4b528952f8d8e77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/twolame/Config.in  |   13 +++++++++++++
 package/twolame/twolame.mk |   14 ++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0e454dc..648e2c6 100644
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
