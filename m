From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 20:30:42 +0100
Subject: [Buildroot] [git commit] xkeyboard-config: add missing dependency
	on host-gettext and sanitize
Message-ID: <20130327193219.2F7ED9B356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43a54d0846525817e1ee69b833047bd8d7a0642f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xkeyboard-config needs msgfmt so we need to pull host-gettext into the
dependencies.
And remove GMSGFMT path hardcoding otherwise host-gettext msgfmt won't
work. Fixes:
http://autobuild.buildroot.net/results/ec956056aba54ab7993cf58a74a93a3b900dee95/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 0e63a45..78ed1ee 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,8 +6,7 @@
 XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp xlib_libX11 xproto_xproto
-XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
+XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp xlib_libX11 xproto_xproto
 
 $(eval $(autotools-package))
 
