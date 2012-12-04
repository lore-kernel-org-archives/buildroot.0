From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Dec 2012 18:28:21 -0800
Subject: [Buildroot] [git commit] xlib_xtrans: only build documentation if
	explicitly requested
Message-ID: <20121204190927.054BA8050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e5a4b26a272e6a31584b5933e38b05f816a0c7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 8582985..d47a0ed 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -8,6 +8,8 @@ XLIB_XTRANS_VERSION = 1.2.6
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
+XLIB_XTRANS_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-docs)
+HOST_XLIB_XTRANS_CONF_OPT = --disable-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
