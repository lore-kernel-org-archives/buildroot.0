From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jul 2016 20:36:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: if libudev is available,
	we don't need libusb
In-Reply-To: <1468175780-18062-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468175780-18062-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468175780-18062-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3d3ecfd..6eff7c8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -216,6 +216,9 @@ config BR2_PACKAGE_KODI_LIBTHEORA
 
 config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
+	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
+	# "if libudev is available, we don't need libusb"
+	depends on !BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
-- 
2.8.1
