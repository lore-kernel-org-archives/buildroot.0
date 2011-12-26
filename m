From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:19:13 +0100
Subject: [Buildroot] [git commit] xapp_xman: drop optional xprint option
Message-ID: <20111226071932.925808FDD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39ae9160d419944193b1d77f7f8f86112de0a629
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When built with --enable-xprint, xman needs libXaw8 (rather than libXaw7),
which we don't have in buildroot.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xman/xapp_xman.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 2706d61..6caaf3f 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -13,8 +13,4 @@ XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
 		ac_cv_file__etc_manpath_config=no
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXPRINTUTIL),y)
-XAPP_XMAN_CONF_OPT += --enable-xprint
-endif
-
 $(eval $(call AUTOTARGETS))
