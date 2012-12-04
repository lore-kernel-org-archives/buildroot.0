From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Dec 2012 18:35:28 -0800
Subject: [Buildroot] [git commit] xproto_xcmiscproto: only build specs if
	explicitly requested
Message-ID: <20121204190927.871CD99716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=440750207d594c932c23196d265847fef5a3426a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 8168b5c..027ef4f 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -8,7 +8,8 @@ XPROTO_XCMISCPROTO_VERSION = 1.2.1
 XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
 XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
-XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
+XPROTO_XCMISCPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
+HOST_XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
