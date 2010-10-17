From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Oct 2010 23:32:37 +0200
Subject: [Buildroot] [git commit master 1/1] startup-notification: ensure
	cross-X11 headers/libs are used
Message-ID: <20101017213452.D13BB8D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bafe263a4165f67b7614d480648fb5e815f86fc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And not the host ones.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    9 +++++----
 .../startup-notification/startup-notification.mk   |    3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index b8a4180..21fffde 100644
--- a/CHANGES
+++ b/CHANGES
@@ -41,10 +41,11 @@
 	openssh, openvpn, oprofile, pango, patch, pcre, php,
 	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
 	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
-	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount, usbutils,
-	vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
+	speex, sqlite, squashfs, startup-notification, strace,
+	sylpheed, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
+	udpcast, usbmount, usbutils, vsftpd, vtun, which,
+	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
+	xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index ec4a895..ad669ac 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -12,6 +12,9 @@ STARTUP_NOTIFICATION_INSTALL_TARGET = YES
 STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
 
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
+STARTUP_NOTIFICATION_CONF_OPT = --with-x \
+	--x-includes="$(STAGING_DIR)/usr/include/X11" \
+	--x-libraries="$(STAGING_DIR)/usr/lib"
 
 $(eval $(call AUTOTARGETS,package,startup-notification))
 
-- 
1.7.1
