From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:52:51 +0200
Subject: [Buildroot] [git commit branch/next] xlib_libX11: ensure target and
	host variant have the same patch hooks
Message-ID: <20130530195805.2F40D9A69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0e3147ee52b274ad887e59450d8a20427ea75f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the out-of-tree support, it is important that all
packages have the same patch hooks for the host variant and the target
variant (because the source tree will be shared between host and
target variants when doing out-of-tree build).

In the case of the xlib_libX11 package, the post-patch hook removes
some flags from the build of the makekeys utility, so that when
xlib_libX11 is built for the target, the build of makekeys for the
host works properly. This modification can be applied to the host
variant of xlib_libX11 without any problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 3b106cd..f801673 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -41,6 +41,7 @@ define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 endef
 
 XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
+HOST_XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
