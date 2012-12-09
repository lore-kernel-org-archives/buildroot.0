From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:14:01 +0100
Subject: [Buildroot] [PATCH 6/8] xapp_xmh: add dependency on xdata_xbitmap
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <166d0d20add891dc789cb3272006d75d803837cd.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/fa059a89a305914700f63d7f0b0d4a3f63beb039/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmh/Config.in   |    1 +
 package/x11r7/xapp_xmh/xapp_xmh.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 3da965a..1ef65c7 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
 	  send and read mail with an X interface to MH
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 934f38d..920289e 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -7,6 +7,6 @@
 XAPP_XMH_VERSION = 1.0.2
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMH_DEPENDENCIES = xlib_libXaw
+XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
 $(eval $(autotools-package))
-- 
1.7.9.5
