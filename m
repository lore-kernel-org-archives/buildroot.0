From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 22 Jan 2013 11:09:33 +0100
Subject: [Buildroot] [PATCH v4 2/2] Media-ctl: new package
In-Reply-To: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr>
References: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1358849373-20243-2-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/Config.in              |    1 +
 package/media-ctl/Config.in    |    7 +++++++
 package/media-ctl/media-ctl.mk |   17 +++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/media-ctl/Config.in
 create mode 100644 package/media-ctl/media-ctl.mk

diff --git a/package/Config.in b/package/Config.in
index 39e2ec7..7856ff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -251,6 +251,7 @@ source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
 source "package/mdadm/Config.in"
+source "package/media-ctl/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
diff --git a/package/media-ctl/Config.in b/package/media-ctl/Config.in
new file mode 100644
index 0000000..832089f
--- /dev/null
+++ b/package/media-ctl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MEDIA_CTL
+	bool "media-ctl"
+	help
+	  Media controller control application
+	  Usefull mostly with ARM OMAP processors to configure and control the image subsystem
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
-- 
1.7.9.5
