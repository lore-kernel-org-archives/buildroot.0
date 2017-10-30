From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 30 Oct 2017 12:40:04 +0000
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
Message-ID: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Changes v1 -> v2:
- Actually selecting the needed dependencies (by Baruch)
- Dropped run-time dependencies perl and
  xfont_font-misc-misc (by Baruch)
- Made linux-pam optional dependency
- Added README.txt to license files (by Baruch)
- Added hashes for all license files (by Baruch)
---
 package/Config.in              |  1 +
 package/turbovnc/Config.in     | 24 ++++++++++++++++++++++++
 package/turbovnc/turbovnc.hash | 25 +++++++++++++++++++++++++
 package/turbovnc/turbovnc.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 package/turbovnc/Config.in
 create mode 100644 package/turbovnc/turbovnc.hash
 create mode 100644 package/turbovnc/turbovnc.mk

diff --git a/package/Config.in b/package/Config.in
index dbfb288..2ab14bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ comment "X applications"
 	source "package/qt-webkit-kiosk/Config.in"
 	source "package/rdesktop/Config.in"
 	source "package/synergy/Config.in"
+	source "package/turbovnc/Config.in"
 	source "package/wmctrl/Config.in"
 	source "package/x11vnc/Config.in"
 	source "package/xdotool/Config.in"
diff --git a/package/turbovnc/Config.in b/package/turbovnc/Config.in
new file mode 100644
index 0000000..0b98073
--- /dev/null
+++ b/package/turbovnc/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_TURBOVNC
+	bool "turbovnc"
+	select BR2_PACKAGE_JPEG_TURBO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXDMCP
+	help
+	  TurboVNC is a high-performance, enterprise-quality version 
+	  of VNC based on TightVNC, TigerVNC, and X.org.
+	  It contains a variant of Tight encoding that is tuned for
+	  maximum performance and compression with 3D applications
+	  (VirtualGL), video, and other image-intensive workloads.
+	  TurboVNC, in combination with VirtualGL, provides a 
+	  complete solution for remotely displaying 3D applications
+	  with interactive performance. TurboVNC's high-speed encoding
+	  methods have been adopted by TigerVNC and libvncserver,
+	  and TurboVNC is also compatible with any other TightVNC
+	  derivative.
+
+	  https://turbovnc.org
diff --git a/package/turbovnc/turbovnc.hash b/package/turbovnc/turbovnc.hash
new file mode 100644
index 0000000..3dc092a
--- /dev/null
+++ b/package/turbovnc/turbovnc.hash
@@ -0,0 +1,25 @@
+# From https://sourceforge.net/projects/turbovnc/files/2.1.2/
+md5	9d04b26d40664d0d8072e8b1828f69c4  turbovnc-2.1.2.tar.gz
+sha1	cd99a27cee86f0680410133beb25da1d6f35a3ea  turbovnc-2.1.2.tar.gz
+# Locally computed
+sha256	2389f76eafc48412b980a61280ffb8d111dacd9e51d5e3df2112f505558b48d4  turbovnc-2.1.2.tar.gz
+
+md5	b234ee4d69f5fce4486a80fdaf4a4263  doc/LICENSE.txt
+sha1	4cc77b90af91e615a64ae04893fdffa7939db84c  doc/LICENSE.txt
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  doc/LICENSE.txt
+
+md5	f1fbc9578354b488efd1c7e276855c6a  doc/LICENSE-PuTTY.txt
+sha1	a069392e138032b7ebb156bad71035146916821f  doc/LICENSE-PuTTY.txt
+sha256	867b1e03a9a1bd0131b5ab7cb0cc617750cbd9edec9dee1903e15b306bb8f94b  doc/LICENSE-PuTTY.txt
+
+md5	c017ff17fc6f0794adf93db5559ccd56  unix/Xvnc/extras/freetype2/docs/LICENSE.TXT
+sha1	265206b28e7c1b750b7e6ea27cc527a6cc6e7644  unix/Xvnc/extras/freetype2/docs/LICENSE.TXT
+sha256	f6333b3a9106f10190e96d9f994f934deb7a5632851a1aaf846b94651a80f4da  unix/Xvnc/extras/freetype2/docs/LICENSE.TXT
+
+md5	ddeb76cd34e791893c0f539fdab879bb  unix/Xvnc/lib/bzip2/LICENSE
+sha1	1c0c6888759a63c32bca7eb63353af2cd9bd5d9e  unix/Xvnc/lib/bzip2/LICENSE
+sha256	4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204  unix/Xvnc/lib/bzip2/LICENSE
+
+md5	009fb6d6593627afd6064fa51ca8d986  README.txt
+sha1	aa41dc5b5268417e32fc280077b25e715e6d18f3  README.txt
+sha256	6d38c387215532019f457f9b0050f24bcccdda2e8f2524014a79d294730735db  README.txt
diff --git a/package/turbovnc/turbovnc.mk b/package/turbovnc/turbovnc.mk
new file mode 100644
index 0000000..34208e3
--- /dev/null
+++ b/package/turbovnc/turbovnc.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# turbovnc
+#
+################################################################################
+
+TURBOVNC_VERSION = 2.1.2
+TURBOVNC_SOURCE = turbovnc-$(TURBOVNC_VERSION).tar.gz
+TURBOVNC_SITE = https://downloads.sourceforge.net/project/turbovnc/$(TURBOVNC_VERSION)
+TURBOVNC_DEPENDENCIES = jpeg-turbo openssl xlib_libICE xlib_libSM xlib_libX11 \
+			xlib_libXext xlib_libXau xlib_libXdmcp 
+TURBOVNC_LICENSE = GPL-2.0, MIT (putty), Dual FTL/GPL-2.0+ (freetype) \
+		   bzip2 license (bzip2), Zlib (zlib)
+TURBOVNC_LICENSE_FILES = doc/LICENSE.txt doc/LICENSE-PuTTY.txt \
+			 unix/Xvnc/extras/freetype2/doc/LICENSE.txt \
+			 unix/Xvnc/lib/bzip2/LICENSE README.txt
+
+# Build just server
+TURBOVNC_CONF_OPTS += -DTVNC_BUILDJAVA=0 -DTVNC_BUILDNATIVE=0
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+TURBOVNC_DEPENDENCIES += linux-pam
+endif
+
+$(eval $(cmake-package))
-- 
2.7.3
