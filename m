From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 May 2021 23:31:47 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: enable DES in
 openssl
Message-ID: <20210607144658.28A76814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2baf1dbfa1ac8b1f9b22fecc123d3e660c723dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hostapd/wpa_supplicant crypto backend assumes that openssl always
provides DES support. However DES support in openssl has become
optional since  commit a83d41867c8d ("package/libopenssl: add
option to enable some features").

Select openssl DES support in wpa_supplicant Kconfig to avoid
build failures.

Fixes:
http://autobuild.buildroot.net/results/00d46eb765f23a1f6e168338f2cc863ae348045d/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 67117c141b..bc9847c99f 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  WPA supplicant for secure wireless networks
 
