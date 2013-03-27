From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Mar 2013 13:32:33 -0300
Subject: [Buildroot] [PATCH 2/2] xkeyboard-config: add missing dependency on
	host-gettext and sanitize
In-Reply-To: <1364401953-21809-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364401953-21809-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364401953-21809-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xkeyboard-config needs msgfmt so we need to pull host-gettext into the
dependencies.
And remove GMSGFMT path hardcoding otherwise host-gettext msgfmt won't
work. Fixes:
http://autobuild.buildroot.net/results/ec956056aba54ab7993cf58a74a93a3b900dee95/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
 
-- 
1.8.1.5
