From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 11 Nov 2012 10:07:48 +0000
Subject: [Buildroot] [PATCH 2/2 v3] neardal: new package
In-Reply-To: <1352628468-14490-1-git-send-email-spdawson@gmail.com>
References: <1352628468-14490-1-git-send-email-spdawson@gmail.com>
Message-ID: <1352628468-14490-3-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (built-test on a minimal powerpc config)
---
 v3: Remove spurious dependency on neard, add Arnout Vandecappelle's acks
 v2: (No v2, bumped entire patch series to v3)

 package/Config.in          |    1 +
 package/neardal/Config.in  |    7 +++++++
 package/neardal/neardal.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/neardal/Config.in
 create mode 100644 package/neardal/neardal.mk

diff --git a/package/Config.in b/package/Config.in
index 6115fb4..0e6970c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -419,6 +419,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/neardal/Config.in"
 source "package/pcsc-lite/Config.in"
 endmenu
 
diff --git a/package/neardal/Config.in b/package/neardal/Config.in
new file mode 100644
index 0000000..719bf95
--- /dev/null
+++ b/package/neardal/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NEARDAL
+	bool "neardal"
+	select BR2_PACKAGE_DBUS_GLIB
+	help
+	  Provides a simple C API to exchange data with the neard NFC manager daemon.
+
+	  https://github.com/connectivity/neardal
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
new file mode 100644
index 0000000..f898df5
--- /dev/null
+++ b/package/neardal/neardal.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# neardal
+#
+#############################################################
+NEARDAL_VERSION = 0.7
+NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
+NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
+NEARDAL_INSTALL_STAGING = YES
+NEARDAL_LICENSE = GPLv2
+NEARDAL_LICENSE_FILES = COPYING
+
+NEARDAL_DEPENDENCIES = dbus-glib
+NEARDAL_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
