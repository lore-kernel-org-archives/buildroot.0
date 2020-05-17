From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Sun, 17 May 2020 22:40:00 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/libglvnd: new package
In-Reply-To: <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
 <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200517204003.2187318-2-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
---
 package/Config.in              |  1 +
 package/libglvnd/Config.in     | 18 ++++++++++++++++++
 package/libglvnd/libglvnd.hash |  1 +
 package/libglvnd/libglvnd.mk   | 19 +++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/libglvnd/Config.in
 create mode 100644 package/libglvnd/libglvnd.hash
 create mode 100644 package/libglvnd/libglvnd.mk

diff --git a/package/Config.in b/package/Config.in
index c245abbc42..e629e5d8ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -311,6 +311,7 @@ comment "Graphic libraries"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
+	source "package/libglvnd/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
new file mode 100644
index 0000000000..dc8dfb55c8
--- /dev/null
+++ b/package/libglvnd/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBGLVND
+	bool "libglvnd"
+        select BR2_PACKAGE_XLIB_LIBXEXT
+        select BR2_PACKAGE_XLIB_LIBX11
+        select BR2_PACKAGE_XLIB_XORGPROTO
+
+if BR2_PACKAGE_LIBGLVND
+
+config BR2_PACKAGE_PROVIDES_LIBGL
+	default "libglvnd"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "libglvnd"
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "libglvnd"
+
+endif
diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
new file mode 100644
index 0000000000..9ed61b6e00
--- /dev/null
+++ b/package/libglvnd/libglvnd.hash
@@ -0,0 +1 @@
+sha256  b26c931ff79feced0d1ac69332797a08427308fa85541282ee9995680c880b24 libglvnd-v1.3.1.tar.gz
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
new file mode 100644
index 0000000000..5868947e0a
--- /dev/null
+++ b/package/libglvnd/libglvnd.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libglvnd
+#
+################################################################################
+
+LIBGLVND_VERSION = 1.3.1
+LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+LIBGLVND_LICENSE = MIT
+LIBGLVND_LICENSE_FILES = LICENSE
+LIBGLVND_INSTALL_STAGING = YES
+LIBGLVND_PROVIDES = libgl libgles libegl
+LIBGLVND_DEPENDENCIES = \
+  xlib_libX11 \
+  xlib_libXext \
+  xorgproto
+
+$(eval $(meson-package))
-- 
2.26.2


-- 
CONFIDENTIALITY NOTICE
------------------------------------
This
 E-mail is 
intended only to be read or used by the addressee.The 
information 
contained in this E-mail message may be confidential 
information. If you 
are not the intended recipient, any use, 
interference with, distribution, 
disclosure or copying of this material 
is unauthorized and prohibited. 
Confidentiality attached to this 
communication is not waived or lost by 
reason of the mistaken delivery 
to you.
If you have received this message 
in error, please delete
 it and notify us by return E-mail or telephone 
NOVOMATIC Technologies 
Poland S.A. +48 12 258 00 50. Any E-mail attachment 
may contain software
 viruses which could damage your own computer system. 
Whilst reasonable 
precaution has been taken to minimize this risk, we 
cannot accept 
liability for any damage which you sustain as a result of 
software 
viruses. You should therefore carry out your own virus checks 
before 
opening any attachments.
------------------------------------

NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w
