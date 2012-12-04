From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Dec 2012 18:34:04 -0800
Subject: [Buildroot] [git commit] xproto_xextproto: only build specs if
	explicitly requested
Message-ID: <20121204190927.3EE808050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73bf02320e91380e7f10c7501e35b6b669797564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 19c7968..8114f78 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -8,7 +8,8 @@ XPROTO_XEXTPROTO_VERSION = 7.2.0
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
-XPROTO_XEXTPROTO_INSTALL_TARGET = NO
+XPROTO_XEXTPROTO_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-specs)
+HOST_XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
