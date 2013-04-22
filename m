From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 18:07:51 +0200
Subject: [Buildroot] [PATCH 2/4] libxkbcommon: new package
In-Reply-To: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1366646873-26196-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/libxkbcommon/Config.in       |    8 ++++++++
 package/libxkbcommon/libxkbcommon.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libxkbcommon/Config.in
 create mode 100644 package/libxkbcommon/libxkbcommon.mk

diff --git a/package/Config.in b/package/Config.in
index f28cedd..f3be210 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -466,6 +466,7 @@ source "package/libnfc-llcp/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
+source "package/libxkbcommon/Config.in"
 source "package/mtdev/Config.in"
 source "package/ne10/Config.in"
 source "package/neardal/Config.in"
diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
new file mode 100644
index 0000000..0a52c6f
--- /dev/null
+++ b/package/libxkbcommon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBXKBCOMMON
+	bool "libxkbcommon"
+	help
+	  xkbcommon is a keymap compiler and support library which
+	  processes a reduced subset of keymaps as defined by the XKB
+	  specification.
+
+	  http://xkbcommon.org/
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
new file mode 100644
index 0000000..1ff851b
--- /dev/null
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libxkbcommon
+#
+#############################################################
+
+LIBXKBCOMMON_VERSION = 0.3.0
+LIBXKBCOMMON_SITE = http://xkbcommon.org/download/
+LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
+LIBXKBCOMMON_LICENSE = MIT/X11
+LIBXKBCOMMON_LICENSE_FILES = COPYING
+
+LIBXKBCOMMON_INSTALL_STAGING = YES
+LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
+
+$(eval $(autotools-package))
-- 
1.7.9.5
