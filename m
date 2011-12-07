From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 21:18:29 +0100
Subject: [Buildroot] [git commit] xdm: bump to 1.1.11
Message-ID: <20111207203228.798FB8F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdb40d8bac210a8457140f2521a045d425ca8e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Minor whitespace fix]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xdm/xapp_xdm.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 4dc0d02..ce38503 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.6
+XAPP_XDM_VERSION = 1.1.11
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
+XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx \
+		    --with-wtmp-file=/var/adm/wtmpx
 
 $(eval $(call AUTOTARGETS))
