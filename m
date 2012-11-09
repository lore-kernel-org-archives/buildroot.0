From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 13:51:47 +0000
Subject: [Buildroot] [PATCH 1/2 v2] neard: new package
Message-ID: <1352469107-25993-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Incorporated improvements suggested by Thomas Petazzoni

 package/Config.in       |    1 +
 package/neard/Config.in |   12 ++++++++++++
 package/neard/neard.mk  |   15 +++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/neard/Config.in
 create mode 100644 package/neard/neard.mk

diff --git a/package/Config.in b/package/Config.in
index 074e9df..6115fb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -237,6 +237,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
+source "package/neard/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
diff --git a/package/neard/Config.in b/package/neard/Config.in
new file mode 100644
index 0000000..a50dbeb
--- /dev/null
+++ b/package/neard/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NEARD
+	bool "neard"
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNL
+	help
+	  Near Field Communication (NFC) manager. This userspace daemon is a part
+	  of the NFC stack provided by the Linux NFC project.
+
+	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
+
+	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
new file mode 100644
index 0000000..8c12627
--- /dev/null
+++ b/package/neard/neard.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# neard
+#
+#############################################################
+NEARD_VERSION = 0.7
+NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
+NEARD_INSTALL_STAGING = YES
+NEARD_LICENSE = GPLv2
+NEARD_LICENSE_FILES = COPYING
+
+NEARD_DEPENDENCIES = dbus libglib2 libnl
+NEARD_CONF_OPT = --disable-traces
+
+$(eval $(autotools-package))
-- 
1.7.10.4
