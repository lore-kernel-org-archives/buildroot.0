From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  6 Oct 2011 15:14:17 +0200
Subject: [Buildroot] [PATCH 3/3] new package: gupnp-av
In-Reply-To: <1317906857-24169-1-git-send-email-s.neumann@raumfeld.com>
References: <1317906857-24169-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317906857-24169-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GUPnP-AV is a collection of helpers for building AV (audio/video)
applications using GUPnP.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in            |    1 +
 package/gupnp-av/Config.in   |    8 ++++++++
 package/gupnp-av/gupnp-av.mk |   17 +++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100755 package/gupnp-av/Config.in
 create mode 100755 package/gupnp-av/gupnp-av.mk

diff --git a/package/Config.in b/package/Config.in
index bf143f4..4c1c372 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -323,6 +323,7 @@ endif
 menu "Networking"
 source "package/gssdp/Config.in"
 source "package/gupnp/Config.in"
+source "package/gupnp-av/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/gupnp-av/Config.in b/package/gupnp-av/Config.in
new file mode 100755
index 0000000..3b7537d
--- /dev/null
+++ b/package/gupnp-av/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GUPNP_AV
+	bool "gupnp-av"
+	depends on BR2_PACKAGE_GUPNP
+	help
+	  GUPnP-AV is a collection of helpers for building AV (audio/video)
+	  applications using GUPnP.
+
+	  http://www.gupnp.org/
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
new file mode 100755
index 0000000..ed1b3fb
--- /dev/null
+++ b/package/gupnp-av/gupnp-av.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# gupnp-av
+#
+#############################################################
+
+GUPNP_AV_VERSION = 0.6.3
+GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.gz
+GUPNP_AV_SITE = http://www.gupnp.org/sites/all/files/sources
+GUPNP_AV_INSTALL_STAGING = YES
+
+GUPNP_AV_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GUPNP_AV_DEPENDENCIES = host-pkg-config host-libglib2 gupnp
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.4.1
