From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:29:43 +0100
Subject: [Buildroot] [git commit master] x11vnc: needs X11 support
Message-ID: <20091123143318.33D69777D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4cc4e572e27ae3278003f7d93e7e36c556aa1620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/x11vnc/Config.in |    1 +
 package/x11vnc/x11vnc.mk |    2 ++
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 625e764..ab178b5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -31,7 +31,7 @@
 	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
 	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot, udpcast,
-	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
 	xdata_xcursor-themes, xboard, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 4472e8e..5571c8a 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
+	depends on BR2_PACKAGE_XORG7
 	help
 	  VNC server for X11 display
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 0c9877e..4def7d4 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -15,4 +15,6 @@ X11VNC_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
         --includedir=/usr/include \
 		--without-avahi
 
+X11VNC_DEPENDENCIES = xserver_xorg-server
+
 $(eval $(call AUTOTARGETS,package,x11vnc))
-- 
1.6.3.3
