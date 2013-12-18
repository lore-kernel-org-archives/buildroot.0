From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 18 Dec 2013 15:01:09 +0100
Subject: [Buildroot] [PATCH] evemu: New package. Also adds libevdev.
Message-ID: <1387375269-25387-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---

evemu is also available in version v1.2.0, but crosscompile for arm didnt work.
Using v1.0.10 which does compile and work (and is the current Ubuntu version).

 package/Config.in            |  2 ++
 package/evemu/Config.in      |  7 +++++++
 package/evemu/evemu.mk       | 15 +++++++++++++++
 package/libevdev/Config.in   |  6 ++++++
 package/libevdev/libevdev.mk | 15 +++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/evemu/Config.in
 create mode 100644 package/evemu/evemu.mk
 create mode 100644 package/libevdev/Config.in
 create mode 100644 package/libevdev/libevdev.mk

diff --git a/package/Config.in b/package/Config.in
index 3429c0e..87fda51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
+source "package/evemu/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
@@ -602,6 +603,7 @@ source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
+source "package/libevdev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
diff --git a/package/evemu/Config.in b/package/evemu/Config.in
new file mode 100644
index 0000000..07b7174
--- /dev/null
+++ b/package/evemu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EVEMU
+	bool "evemu"
+	select BR2_PACKAGE_LIBEVDEV
+	help
+	  evemu records and replays device descriptions and events
+
+	  http://www.freedesktop.org/wiki/Evemu/
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
new file mode 100644
index 0000000..923d205
--- /dev/null
+++ b/package/evemu/evemu.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# evemu
+#
+################################################################################
+
+EVEMU_VERSION = 1.0.10
+EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.gz
+EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
+
+EVEMU_AUTORECONF = YES
+EVEMU_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
diff --git a/package/libevdev/Config.in b/package/libevdev/Config.in
new file mode 100644
index 0000000..91dd9db
--- /dev/null
+++ b/package/libevdev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBEVDEV
+	bool "libevdev"
+	help
+	  libevdev is a wrapper library for evdev devices
+
+	  http://freedesktop.org/wiki/Software/libevdev/
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
new file mode 100644
index 0000000..12b6b11
--- /dev/null
+++ b/package/libevdev/libevdev.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libevdev
+#
+################################################################################
+
+LIBEVDEV_VERSION = 0.5
+LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.gz
+LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
+
+LIBEVDEV_AUTORECONF = YES
+LIBEVDEV_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
-- 
1.8.4.1
