From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Apr 2012 09:41:58 +0200
Subject: [Buildroot] [git commit] package: add fmtools
Message-ID: <20120408074445.B004C96A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acf7bb7217d7de6981909112bdbd2af1faf680b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix install, help text]
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/fmtools/Config.in  |    9 +++++++++
 package/fmtools/fmtools.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c895cc1..4c6d4d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -174,6 +174,7 @@ source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
+source "package/fmtools/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
 source "package/genext2fs/Config.in"
diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
new file mode 100644
index 0000000..1591618
--- /dev/null
+++ b/package/fmtools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FMTOOLS
+	bool "fmtools"
+	help
+	  fmtools is a pair of simple command-line utilities for
+	  "video4linux" radio tuner cards under Linux. It includes
+	  fm for power control, tuning, and volume and fmscan for
+	  scanning for stations.
+
+	  http://www.stanford.edu/~blp/fmtools/
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
new file mode 100644
index 0000000..f705173
--- /dev/null
+++ b/package/fmtools/fmtools.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# fmtools
+#
+#############################################################
+
+FMTOOLS_VERSION = 1.0.2
+FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+
+define FMTOOLS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FMTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin/fm
+	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin/fmscan
+endef
+
+$(eval $(call GENTARGETS))
