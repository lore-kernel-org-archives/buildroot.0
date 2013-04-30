From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Apr 2013 09:34:53 +0200
Subject: [Buildroot] [git commit] libxkbcommon: new package
Message-ID: <20130430081120.5768B97276@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67a96673830383028018f254611a9968b9efeffc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: set gnu99 C mode]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libxkbcommon/Config.in       |    8 ++++++++
 package/libxkbcommon/libxkbcommon.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f39ecf6..83234c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -470,6 +470,7 @@ source "package/libserial/Config.in"
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
index 0000000..6f66824
--- /dev/null
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -0,0 +1,18 @@
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
+# uses C99 features
+LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
+$(eval $(autotools-package))
