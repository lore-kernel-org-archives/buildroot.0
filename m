From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Apr 2012 00:21:39 +0200
Subject: [Buildroot] [git commit] New package: libdmtx
Message-ID: <20120416223356.7220896AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f41adabc5a12fcca1de5b6c296c2206b518abff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libdmtx/Config.in  |    7 +++++++
 package/libdmtx/libdmtx.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3e5f708..567fbed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
+source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
diff --git a/package/libdmtx/Config.in b/package/libdmtx/Config.in
new file mode 100644
index 0000000..db4187f
--- /dev/null
+++ b/package/libdmtx/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDMTX
+	bool "libdmtx"
+	help
+	  libdmtx is a software library that enables programs to read and write
+	  Data Matrix barcodes of the modern ECC200 variety.
+
+	  http://www.libdmtx.org/
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
new file mode 100644
index 0000000..495e59a
--- /dev/null
+++ b/package/libdmtx/libdmtx.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libdmtx
+#
+#############################################################
+
+LIBDMTX_VERSION = 0.7.4
+LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
+LIBDMTX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdmtx
+LIBDMTX_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
