From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 20:30:38 +0100
Subject: [Buildroot] [git commit] xkeyboard-config: needs libX11 and
	xproto_xproto
Message-ID: <20130327193219.02E449B356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a590595c700370eef5c024d7e264bf26f29db2fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build failure i've found while debugging another one :)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xkeyboard-config/Config.in           |    2 ++
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index 8e27dac..640bb1d 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
 	select BR2_PACKAGE_XAPP_XKBCOMP
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  keyboard configuration database for X
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index bd3314c..0e63a45 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,7 +6,7 @@
 XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
+XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp xlib_libX11 xproto_xproto
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
 $(eval $(autotools-package))
