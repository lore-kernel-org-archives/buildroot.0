From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 May 2010 09:02:07 +0200
Subject: [Buildroot] [git commit master] less: depends on curses
Message-ID: <20100511070254.E7C3C8D479@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5b9384337a6600f36f2be94a9310c1642aee54ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The less package already selects BR2_PACKAGE_CURSES, but it fails to
depend on it in the makefile. Therefore, there are cases where less
gets built before curses, and the build fails:

checking for working terminal libraries... Cannot find terminal libraries - configure failed

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/less/less.mk |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 12702a4..7dd7a5d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: busybox, customize, hal, hostapd,
-	libxcb, mplayer, pciutils, xdriver_xf86-video-openchrome,
+	less, libxcb, mplayer, pciutils, xdriver_xf86-video-openchrome,
 	usb_modeswitch, usbutils, wpa_supplicant, xapp_bdftopcf,
 	xapp_mkfontdir, xfont_encodings, xlib_libX11, xlib_libXfont,
 	xlib_xtrans, xproto_fontcacheproto, xproto_fontsproto, xvkbd
diff --git a/package/less/less.mk b/package/less/less.mk
index 706a3e0..bae1cf6 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -6,6 +6,7 @@
 
 LESS_VERSION = 436
 LESS_SITE = http://www.greenwoodsoftware.com/less
+LESS_DEPENDENCIES = ncurses
 
 $(eval $(call AUTOTARGETS,package,less))
 
-- 
1.6.3.3
