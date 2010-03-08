From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libxcb to 1.5
Message-ID: <20100308133617.971B1776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3f3262b950bb7277bceb1d4cbc46e78ad23383c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/libxcb/libxcb.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 19cfc6a..ec9843e 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -3,16 +3,17 @@
 # libxcb
 #
 #############################################################
-LIBXCB_VERSION = 1.1
+LIBXCB_VERSION = 1.5
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_AUTORECONF = NO
+LIBXCB_LIBTOOL_PATCH = NO
 LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb
+LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python2.6/site-packages
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
 
-- 
1.6.3.3
