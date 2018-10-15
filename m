From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Oct 2018 11:46:44 -0500
Subject: [Buildroot] [PATCH 3/3] package/tidsp-binaries: remove package
In-Reply-To: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539622004-43558-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1539622004-43558-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The suit of TI OMAP3 dsp tools/libraries are being removed as the
upstream projects are no longer active.

Suggest using Buildroot 2018.02.6 LTS if the feature is still
required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

This patchset was started after an update was proposed to the TI DSP
related packages to fix upstream homepage URLS. It seems the upstream
stablized for this DSP feature set primarily for OMAP3 and then the
technology has not been moving forward with newer processors.
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/tidsp-binaries/Config.in           |  7 -------
 package/tidsp-binaries/tidsp-binaries.hash |  2 --
 package/tidsp-binaries/tidsp-binaries.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 26 deletions(-)
 delete mode 100644 package/tidsp-binaries/Config.in
 delete mode 100644 package/tidsp-binaries/tidsp-binaries.hash
 delete mode 100644 package/tidsp-binaries/tidsp-binaries.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2089e82..bd236b2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_TIDSP_BINARIES
+	bool "tidsp-binaries package removed"
+	select BR2_LEGACY
+	help
+	  The tidsp-binaries package was removed.
+
 config BR2_PACKAGE_DSP_TOOLS
 	bool "dsp-tools package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2b645cd..02bd2ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -47,7 +47,6 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
-	source "package/tidsp-binaries/Config.in"
 	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
diff --git a/package/tidsp-binaries/Config.in b/package/tidsp-binaries/Config.in
deleted file mode 100644
index 48f85a5..0000000
--- a/package/tidsp-binaries/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_TIDSP_BINARIES
-	bool "tidsp-binaries"
-	depends on BR2_cortex_a8
-	help
-	  TI OMAP3 DSP algorithms.
-
-	  https://gforge.ti.com/gf/project/openmax/
diff --git a/package/tidsp-binaries/tidsp-binaries.hash b/package/tidsp-binaries/tidsp-binaries.hash
deleted file mode 100644
index 6649c76..0000000
--- a/package/tidsp-binaries/tidsp-binaries.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  c56e5edd53c921768a033906426329279ca8ae6537c5d735c42b948e9778b05c  tidsp-binaries-23.i3.8.tar.gz
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
deleted file mode 100644
index 9736bc7..0000000
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# tidsp-binaries
-#
-################################################################################
-
-TIDSP_BINARIES_VERSION = 23.i3.8
-TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files
-TIDSP_BINARIES_LICENSE = TI Proprietary License
-TIDSP_BINARIES_LICENSE_FILES = LICENSE
-
-define TIDSP_BINARIES_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
1.9.1
