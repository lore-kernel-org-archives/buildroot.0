From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 23:00:38 +0100
Subject: [Buildroot] [git commit] Media-ctl: new package
Message-ID: <20130122220137.82DF09A742@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d76a37d1d2e38d59127b5da53a20c48e177a9f7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix help text]
Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/media-ctl/Config.in    |    9 +++++++++
 package/media-ctl/media-ctl.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c4e5ad5..ebd9817 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -252,6 +252,7 @@ source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
 source "package/mdadm/Config.in"
+source "package/media-ctl/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
diff --git a/package/media-ctl/Config.in b/package/media-ctl/Config.in
new file mode 100644
index 0000000..8d1beda
--- /dev/null
+++ b/package/media-ctl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MEDIA_CTL
+	bool "media-ctl"
+	help
+	  Media controller control application
+
+	  Useful mostly with ARM OMAP processors to configure and
+	  control the image subsystem
+
+	  http://git.ideasonboard.org/media-ctl.git
diff --git a/package/media-ctl/media-ctl.mk b/package/media-ctl/media-ctl.mk
new file mode 100644
index 0000000..065751e
--- /dev/null
+++ b/package/media-ctl/media-ctl.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# media-ctl
+#
+#############################################################
+
+MEDIA_CTL_VERSION = ac40b79f002a2315f909548614ccd2d408da25b7
+MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
+MEDIA_CTL_INSTALL_STAGING = YES
+MEDIA_CTL_LICENSE = LGPLv2.1+
+MEDIA_CTL_LICENSE_FILES = COPYING.LIB
+
+MEDIA_CTL_AUTORECONF = YES
+MEDIA_CTL_CONF_OPT = --with-kernel-headers=$(STAGING_DIR)/usr/include
+MEDIA_CTL_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
