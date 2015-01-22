From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:22:52 -0500
Subject: [Buildroot] [PATCH 1/1] new package: freeradius-client
Message-ID: <1421954572-10445-1-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bender <codehero@gmail.com>
---
 package/Config.in                              |    1 +
 package/freeradius-client/Config.in            |    6 ++++++
 package/freeradius-client/freeradius-client.mk |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/freeradius-client/Config.in
 create mode 100644 package/freeradius-client/freeradius-client.mk

diff --git a/package/Config.in b/package/Config.in
index 266de13..4998ee6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -820,6 +820,7 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
+	source "package/freeradius-client/Config.in"
 	source "package/fmlib/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
diff --git a/package/freeradius-client/Config.in b/package/freeradius-client/Config.in
new file mode 100644
index 0000000..b319464
--- /dev/null
+++ b/package/freeradius-client/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FREERADIUS_CLIENT
+	bool "freeradius-client"
+	help
+		The freeradius-client library.
+
+		http://wiki.freeradius.org/project/Radiusclient
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
new file mode 100644
index 0000000..672c9c2
--- /dev/null
+++ b/package/freeradius-client/freeradius-client.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# freeradius-client
+#
+################################################################################
+
+FREERADIUS_CLIENT_VERSION = release_1_1_7
+FREERADIUS_CLIENT_SITE =  $(call github,FreeRADIUS,freeradius-client,$(FREERADIUS_CLIENT_VERSION))
+FREERADIUS_CLIENT_LICENSE = BSD-3c
+FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT
+FREERADIUS_CLIENT_INSTALL_STAGING = YES
+
+FREERADIUS_CLIENT_CONF_ENV = ac_cv_func_memcmp_working=yes \
+	ac_cv_func_uname=no
+
+FREERADIUS_CLIENT_CONF_OPTS = \
+	"--sysconfdir=/etc", \
+	"--enable-static"
+
+$(eval $(autotools-package))
-- 
1.7.8.6
