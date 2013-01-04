From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 00:30:39 +0100
Subject: [Buildroot] [git commit] Revert "xlib_libXft: fix xft-config"
Message-ID: <20130104233142.E2DA59A629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b7a34d43f50e8b027288f2a7553e5a8af31b095
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1a1009931f8f126087c0c4c013af63ca2037014a.

Fixes http://autobuild.buildroot.net/results/e8c00cf5ec1e3829cd9013710bb1961d9c226c34

xlib_libXft hasn't provided an xft-config script since 2010.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXft/xlib_libXft.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 01ba323..eab75ef 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -11,12 +11,4 @@ XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
-define XLIB_LIBXFT_STAGING_XLIB_LIBXFT_CONFIG_FIXUP
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		$(STAGING_DIR)/usr/bin/xft-config
-endef
-
-XLIB_LIBXFT_POST_INSTALL_STAGING_HOOKS += XLIB_LIBXFT_STAGING_XLIB_LIBXFT_CONFIG_FIXUP
-
 $(eval $(autotools-package))
