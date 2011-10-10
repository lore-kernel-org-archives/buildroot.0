From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Oct 2011 11:21:59 +0200
Subject: [Buildroot] [PATCH 2/3] xdm: bump to 1.1.11
In-Reply-To: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
References: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1318238520-16580-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xdm/xapp_xdm.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 4dc0d02..81e2acd 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.6
+XAPP_XDM_VERSION = 1.1.11
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
+XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx --with-wtmp-file=/var/adm/wtmpx
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.1.1
