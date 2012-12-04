From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Dec 2012 18:20:25 -0800
Subject: [Buildroot] [git commit] xlib_libXdmcp: only build documentation if
	explicitly requested
Message-ID: <20121204190926.D0F5699716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68cdb5e2d7b0e8211708012c31dd109e069c098d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 5a702e5..7177ae8 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -9,6 +9,8 @@ XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
+XLIB_LIBXDMCP_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-docs)
+HOST_XLIB_LIBXDMCP_CONF_OPT = --disable-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
