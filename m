From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 17:31:55 +0100
Subject: [Buildroot] [PATCH 5/7] libXaw: do not build docs (fails if missing
	host tools), also cleanup makefile
In-Reply-To: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
References: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271262717-2253-6-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 8684ac8..ac8c5f8 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -7,9 +7,8 @@
 XLIB_LIBXAW_VERSION = 1.0.7
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXAW_AUTORECONF = NO
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
-XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static
+XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static --disable-docs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXaw))
-- 
1.7.0
