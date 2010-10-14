From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:59:07 +0200
Subject: [Buildroot] [git commit master 1/1] xapp_xmore: needs libXaw
Message-ID: <20101014185922.258DB8CA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aecb5b4dc7cd1bcd54e9711b1b11a344fc6391dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xmore/Config.in     |    1 +
 package/x11r7/xapp_xmore/xapp_xmore.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index e64b99f..23fd147 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMORE
 	bool "xmore"
 	select BR2_PACKAGE_XLIB_LIBXPRINTUTIL
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  plain text display program for the X Window System
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index ffb49e7..0b68e71 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -8,6 +8,6 @@ XAPP_XMORE_VERSION = 1.0.1
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_AUTORECONF = NO
-XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil
+XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xmore))
-- 
1.7.1
