From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 17:23:01 +0100
Subject: [Buildroot] [git commit] xlib_libXau: add host-pkgconf to its
	dependencies
Message-ID: <20141203162333.8DC20800A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ebe95d237093918a07af312a77312b40047d2de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libXau needs pkg-config during the configure phase. Otherwise it
will fail with an error like this one:

checking for XAU... configure: error: in
`/br/output/build/xlib_libXau-1.0.8':
configure: error: The pkg-config script could not be found or is too
old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXau/xlib_libXau.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 720c62c..8ef48e4 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,7 +10,7 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
-XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
+XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
