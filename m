From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 13:58:57 +0200
Subject: [Buildroot] [git commit] package/tidsp-binaries: remove package
Message-ID: <20181026115738.EB46B89000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e8790d5de3c7cdc58fdbcd353e42f6bb819ce4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The suit of TI OMAP3 dsp tools/libraries are being removed as the
upstream projects are no longer active.

Suggest using Buildroot 2018.02.x LTS if the feature is still
required.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                           |  6 ++++++
 package/Config.in                          |  1 -
 package/tidsp-binaries/Config.in           |  7 -------
 package/tidsp-binaries/tidsp-binaries.hash |  2 --
 package/tidsp-binaries/tidsp-binaries.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2089e82b45..bd236b2083 100644
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
index 0c39eef352..50005cdb70 100644
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
index 48f85a5d98..0000000000
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
index 6649c76ce4..0000000000
--- a/package/tidsp-binaries/tidsp-binaries.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  c56e5edd53c921768a033906426329279ca8ae6537c5d735c42b948e9778b05c  tidsp-binaries-23.i3.8.tar.gz
diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
deleted file mode 100644
index 9736bc7231..0000000000
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
