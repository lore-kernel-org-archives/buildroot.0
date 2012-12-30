From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:31:50 +0100
Subject: [Buildroot] [PATCH 12/19] efl/libevas: adjust dependency on X11
	libraries
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7778a20102b4497db39cce819aeb2d3ba804e3e8.1356849033.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libevas configure script actually checks the presence of libX11
and libXext, so use those two libraries as the dependencies for the
X11 backend of libevas.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/Config.in  |    1 +
 package/efl/libevas/libevas.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index d8e5002..bd845c1 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -91,6 +91,7 @@ config BR2_PACKAGE_LIBEVAS_X11
 	bool "libevas X11 backend"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
 	  This enables the software X11 rendering engine that renders
 	  to X drawable targets using highly optimised software
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 6e69d7f..098afe3 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -63,7 +63,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
 LIBEVAS_CONF_OPT += --enable-software-xlib
-LIBEVAS_DEPENDENCIES += xproto_xproto
+LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
-- 
1.7.9.5
