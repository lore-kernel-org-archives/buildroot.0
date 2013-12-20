From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 20 Dec 2013 16:05:24 +0100
Subject: [Buildroot] [PATCH v2 2/2] evemu: new package
In-Reply-To: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
References: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1387551924-4824-3-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/Config.in       |  1 +
 package/evemu/Config.in |  7 +++++++
 package/evemu/evemu.mk  | 17 +++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/evemu/Config.in
 create mode 100644 package/evemu/evemu.mk

diff --git a/package/Config.in b/package/Config.in
index 8675856..a4c8354 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,6 +271,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/evemu/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/fconfig/Config.in"
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
index 0000000..e230ee2
--- /dev/null
+++ b/package/evemu/evemu.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# evemu
+#
+################################################################################
+
+EVEMU_VERSION = 1.0.10
+EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
+EVEMU_LICENSE = LGPLv3
+EVEMU_LICENSE_FILES = COPYING
+
+# Uses PKG_CHECK_MODULES() in configure.ac
+EVEMU_DEPENDENCIES = host-pkgconf libevdev
+# the package provides a autogen.sh, but we'd rather run buildroots autoreconf
+EVEMU_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.8.4.1
