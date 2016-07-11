From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:09:00 +0200
Subject: [Buildroot] [PATCH v5 6/8] package/kodi: if libudev is available,
	we don't need libusb
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: initial version in this patch series, no changes

 package/kodi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5e7aa67..25378da 100644
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
-- 
2.8.1
