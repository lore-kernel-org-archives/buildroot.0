From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:29:37 +0200
Subject: [Buildroot] [git commit] package/kodi: if libudev is available,
	we don't need libusb
Message-ID: <20160717123353.AD2B081E0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9acee7c649dd2a2acd20ae100fb1cf9e13a6de50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a4cbab2..9a5baa8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -222,6 +222,9 @@ config BR2_PACKAGE_KODI_LIBTHEORA
 
 config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
+	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
+	# "if libudev is available, we don't need libusb"
+	depends on !BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
