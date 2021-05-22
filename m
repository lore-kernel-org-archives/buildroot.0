From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:32:49 +0200
Subject: [Buildroot] [git commit branch/next] package/wpa_supplicant: enable
 MD4 in openssl
Message-ID: <20210522200345.0E68E88F1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2889b5d1a22a20fde816fd807dc88a01adfb9675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Hostapd/wpa_supplicant crypto backend assumes that openssl always
provides MD4 support. However MD4 support in openssl has become
optional since  commit a83d41867c8d ("package/libopenssl: add
option to enable some features").

Select openssl MD4 support in wpa_supplicant Kconfig to avoid
build failures.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 27ad22430a..67117c141b 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  WPA supplicant for secure wireless networks
 
