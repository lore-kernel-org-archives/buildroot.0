From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Apr 2011 10:27:17 +0200
Subject: [Buildroot] [git commit] package: add can-utils
Message-ID: <20110421082833.134AB81E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d75acdbee2d3dc3f611c67ac0d3a05c544b8ca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add SocketCAN utilities.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/can-utils/Config.in    |    8 ++++++++
 package/can-utils/can-utils.mk |   11 +++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/can-utils/Config.in
 create mode 100644 package/can-utils/can-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 014c2c0..ce39edd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
new file mode 100644
index 0000000..79c1459
--- /dev/null
+++ b/package/can-utils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CAN_UTILS
+	bool "can-utils"
+	help
+	  SocketCAN is a set of open source CAN drivers and a
+	  networking stack.
+	  This package provides various tools for this stack.
+
+	  http://developer.berlios.de/projects/socketcan/
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
new file mode 100644
index 0000000..f602490
--- /dev/null
+++ b/package/can-utils/can-utils.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# can-utils
+#
+#############################################################
+
+CAN_UTILS_VERSION = 1235
+CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
+CAN_UTILS_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS,package,can-utils))
-- 
1.7.3.4
