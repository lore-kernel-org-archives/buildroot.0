From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 26 May 2021 22:56:35 +0300
Subject: [Buildroot] [PATCH/next 2/2] package/hostapd: enable DES in openssl
In-Reply-To: <20210526195635.127744-1-geomatsi@gmail.com>
References: <20210526195635.127744-1-geomatsi@gmail.com>
Message-ID: <20210526195635.127744-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hostapd/wpa_supplicant crypto backend assumes that openssl always
provides DES support. However DES support in openssl has become
optional since  commit a83d41867c8d ("package/libopenssl: add
option to enable some features").

Select openssl DES support in hostapd Kconfig to avoid
build failures.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/hostapd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 1ac7f6cd5a..9d5e8692a2 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  User space daemon for wireless access points.
 
-- 
2.31.1
