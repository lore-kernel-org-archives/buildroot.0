From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Sep 2012 22:51:01 +0200
Subject: [Buildroot] [git commit] xlib_libSM: only build documentation if
	needed
Message-ID: <20120926212531.70C0399722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=812eae5ccf281f89efba6092cb432224c0f7e89c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documentation generation is slow, so only create it if requested.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libSM/xlib_libSM.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index a8d1eff..bdbda3f 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -11,4 +11,9 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
 
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+# documentation generation is slow
+XLIB_LIBSM_CONF_OPT += --disable-docs
+endif
+
 $(eval $(autotools-package))
