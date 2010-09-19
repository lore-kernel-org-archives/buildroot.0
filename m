From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Sep 2010 23:22:24 +0200
Subject: [Buildroot] [git commit master 1/1] udev: don't hide if busybox is
	enabled
Message-ID: <20100919212409.5D4888B421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1df74fbcaccfe76493b9e769f9bf1c4ff25f1ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev is hidden by default (because of BR2_PACKAGE_BUSYBOX_SHOW_OTHERS),
but other packages (hal + usbmount) tries to select it, which gives
warnings if it isn't visible.

To fix this, simply make it always visible. To call mdev an equivalent
of udev is also stretching the truth anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES           |    2 +-
 package/Config.in |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index e6baf69..53923b0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,7 +23,7 @@
 	neon, netperf, ntfsprogs, openntpd, openssh, openvpn, oprofile,
 	pango, pcre, php, prboom, radvd, qt, samba, sdl_sound,
 	shared-mime-info, speex, sqlite, strace, taglib, tcpdump,
-	tiff, tn5250, udpcast, usbutils, which, xlib_libX11
+	tiff, tn5250, udev, udpcast, usbutils, which, xlib_libX11
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/Config.in b/package/Config.in
index 2209b55..f9a0405 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -186,10 +186,7 @@ source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-# mdev
 source "package/udev/Config.in"
-endif
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
-- 
1.7.1
