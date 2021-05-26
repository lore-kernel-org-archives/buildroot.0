From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 26 May 2021 22:56:34 +0300
Subject: [Buildroot] [PATCH/next 1/2] package/wpa_supplicant: enable DES in
 openssl
In-Reply-To: <20210526195635.127744-1-geomatsi@gmail.com>
References: <20210526195635.127744-1-geomatsi@gmail.com>
Message-ID: <20210526195635.127744-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hostapd/wpa_supplicant crypto backend assumes that openssl always
provides DES support. However DES support in openssl has become
optional since  commit a83d41867c8d ("package/libopenssl: add
option to enable some features").

Select openssl DES support in wpa_supplicant Kconfig to avoid
build failures.

Fixes:
http://autobuild.buildroot.net/results/00d46eb765f23a1f6e168338f2cc863ae348045d/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
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
 
-- 
2.31.1
