From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 21:00:01 +0100
Subject: [Buildroot] [git commit master 1/1] tslib: needs libtool patch
Message-ID: <20101105200657.CB7968DAB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a3a88a31552460c1e2aac6a746480eef98d07dfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it fails with 'cannot install to a directory not ending in
/usr/lib/ts'.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 ++--
 package/tslib/tslib.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 393244a..45ed7cb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -48,8 +48,8 @@
 	rdesktop, readline, rp-pppoe, ruby, qt, quagga, samba, sawman,
 	sdl_mixer, sdl_sound, sed, setserial, shared-mime-info, slang,
 	speex, sqlite, squashfs, startup-notification, strace, sylpheed,
-	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
-	udpcast, usbmount, usbutils, vsftpd, vtun, which,
+	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, tslib,
+	udev, udpcast, usbmount, usbutils, vsftpd, vtun, which,
 	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
 	xapp_xinit, xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index edde0b6..798499e 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -7,7 +7,7 @@ TSLIB_VERSION:=1.0
 TSLIB_SOURCE:=tslib-$(TSLIB_VERSION).tar.bz2
 TSLIB_SITE:=http://download.berlios.de/tslib
 TSLIB_AUTORECONF = YES
-TSLIB_LIBTOOL_PATCH = NO
+TSLIB_LIBTOOL_PATCH = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_TARGET = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.7.1
