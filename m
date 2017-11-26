From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:37:17 +0100
Subject: [Buildroot] [git commit branch/2017.02.x]
 package/x11r7/xapp_xdriinfo: fix libgl dependency
Message-ID: <20171126213912.0AE27802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=843f396a2407e033fb7b946d56adfd165d5c0d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes
"mesa3d is in the dependency chain of xapp_xdriinfo that has added it
 to its _DEPENDENCIES variable without selecting it or depending on it
 from Config.in."
http://autobuild.buildroot.net/results/d8a/d8aeed2f64e21a277eb0bc5dc08d2339a14c682e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6d97e73257ffb9fddb8a57dc8d2933b79b86f4b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index bb00d3b..ffab517 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -9,6 +9,6 @@ XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
 XAPP_XDRIINFO_LICENSE_FILES = COPYING
-XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
+XAPP_XDRIINFO_DEPENDENCIES = libgl xlib_libX11 xproto_glproto
 
 $(eval $(autotools-package))
