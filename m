From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:01:04 +0200
Subject: [Buildroot] [PATCH 6/6] xlib_libX11: ensure target and host variant
	have the same patch hooks
In-Reply-To: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369695664-5670-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 2d68f9e..5d0607b 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -43,6 +43,7 @@ define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 endef
 
 XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
+HOST_XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
