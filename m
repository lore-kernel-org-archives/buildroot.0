From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] sysstat: bump to 9.1.5
Message-ID: <20101105092847.E300C8DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b588179405200dac7b12a4e0fc36ced5916e2449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    4 ++--
 package/sysstat/sysstat.mk |    6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index fac7738..ac4cf60 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,8 +44,8 @@
 	portmap, pppd, pptp-linux, prboom, radvd, rdesktop, readline,
 	rp-pppoe, ruby, qt, quagga, samba, sawman, sdl_mixer, sdl_sound,
 	setserial, shared-mime-info, speex, sqlite, squashfs,
-	startup-notification, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
+	startup-notification, strace, sylpheed, sysstat, taglib,
+	tcpdump, thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
 	usbutils, vsftpd, vtun, which, wpa_supplicant, xapp_twm,
 	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 324580e..7294b86 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.0.5
+SYSSTAT_VERSION = 9.1.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
 SYSSTAT_AUTORECONF = NO
@@ -12,9 +12,7 @@ SYSSTAT_LIBTOOL_PATCH = NO
 SYSSTAT_INSTALL_STAGING = NO
 SYSSTAT_INSTALL_TARGET = YES
 
-# Should be --disable-man-group, it might be a little mistake in the
-# configure.in script.
-SYSSTAT_CONF_OPT = --enable-man-group
+SYSSTAT_CONF_OPT = --disable-man-group
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
-- 
1.7.1
