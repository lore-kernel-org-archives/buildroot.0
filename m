From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:42:28 +0200
Subject: [Buildroot] [git commit master 1/1] torsmo: fix build when help2man
	is available on host
Message-ID: <20101014184332.D968A8CA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d785694f5a978a8ed93a40e847b7f069e6add913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

help2man doesn't work when cross compiling, as it wants to run
./program --help, so ensure torsmo doesn't try to use it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/torsmo/torsmo.mk |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3cf4a0f..7edbda8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -42,7 +42,7 @@
 	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
 	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
 	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount, usbutils,
 	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
 	xapp_xbacklight,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index 03477d1..a9cbc5d 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -10,6 +10,8 @@ TORSMO_AUTORECONF = NO
 TORSMO_INSTALL_STAGING = NO
 TORSMO_INSTALL_TARGET = YES
 
+# help2man doesn't work when cross compiling
+TORSMO_CONF_ENV = HELP2MAN=''
 TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
 
 TORSMO_DEPENDENCIES = xserver_xorg-server
-- 
1.7.1
