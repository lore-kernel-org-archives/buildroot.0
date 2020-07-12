From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:13:26 +0200
Subject: [Buildroot] [git commit] package/libcutl: new package
Message-ID: <20200712091654.CFDC986829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afb8a599557f1517951bec5f3390066618434c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcutl is distributed in source code and includes the standard autotools
build system as well as the VC++ project files. It is a dependency for odb.

Because ODB is a host-only package, and no other package depends on libcutl,
this package will also be a host-only package.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/libcutl/libcutl.hash |  6 ++++++
 package/libcutl/libcutl.mk   | 15 +++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5d1c8013c..ea5cde8dd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -44,6 +44,7 @@ F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
 F:	package/libcpprestsdk/
+F:	package/libcutl/
 F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
diff --git a/package/libcutl/libcutl.hash b/package/libcutl/libcutl.hash
new file mode 100644
index 0000000000..1e0baa7f6e
--- /dev/null
+++ b/package/libcutl/libcutl.hash
@@ -0,0 +1,6 @@
+# From https://www.codesynthesis.com/download/libcutl/1.10/libcutl-1.10.0.tar.bz2.sha1
+sha1	2885b79529f8caeb13687d722f5c114186f56956	libcutl-1.10.0.tar.bz2
+
+# Locally Computed
+sha256	125163c670e372b47d5626d54379ff8fbaded6ccd5db77ac0bf5912a4017121c	libcutl-1.10.0.tar.bz2
+sha256	c7aa98c5af3b67174f16b12a1fed4332a51cd524b82c69e85baa4c2c412da239	LICENSE
diff --git a/package/libcutl/libcutl.mk b/package/libcutl/libcutl.mk
new file mode 100644
index 0000000000..49c05e6019
--- /dev/null
+++ b/package/libcutl/libcutl.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libcutl
+#
+################################################################################
+
+LIBCUTL_VERSION_MAJOR = 1.10
+LIBCUTL_VERSION = $(LIBCUTL_VERSION_MAJOR).0
+LIBCUTL_SOURCE = libcutl-$(LIBCUTL_VERSION).tar.bz2
+LIBCUTL_SITE = https://www.codesynthesis.com/download/libcutl/$(LIBCUTL_VERSION_MAJOR)
+LIBCUTL_INSTALL_STAGING = YES
+LIBCUTL_LICENSE = MIT
+LIBCUTL_LICENSE_FILES = LICENSE
+
+$(eval $(host-autotools-package))
