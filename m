From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 22:30:18 +0200
Subject: [Buildroot] [git commit] libsoc: add new package
Message-ID: <20130912203028.B34909B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7fe073678a7b3202436c4e77d5e20cc54f34734
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix help text, doesn't need fork, file header, license tags]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libsoc/Config.in |    7 +++++++
 package/libsoc/libsoc.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 02e5afc..0d457a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -542,6 +542,7 @@ source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
 source "package/libqmi/Config.in"
 source "package/libserial/Config.in"
+source "package/libsoc/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libsoc/Config.in b/package/libsoc/Config.in
new file mode 100644
index 0000000..3e750bd
--- /dev/null
+++ b/package/libsoc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSOC
+	bool "libsoc"
+	help
+	  libsoc is a C library for interfacing with common SoC
+	  peripherals through generic kernel interfaces
+
+	  https://github.com/jackmitch/libsoc
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
new file mode 100644
index 0000000..f310266
--- /dev/null
+++ b/package/libsoc/libsoc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libsoc
+#
+################################################################################
+
+LIBSOC_VERSION = 356760dcb93b22d6c67c5232cde2ade8c968c932
+LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)
+LIBSOC_LICENSE = LGPLv2.1
+LIBSOC_LICENSE_FILES = COPYING
+LIBSOC_AUTORECONF = YES
+LIBSOC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
