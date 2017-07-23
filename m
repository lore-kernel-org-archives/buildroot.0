From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Jul 2017 22:08:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libressl: needs MMU
Message-ID: <20170723200844.13004-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/074/07429d3016c900894fa0ca19b7dad0a928e32e3f/
http://autobuild.buildroot.net/results/1c1/1c1325d1a7a7aa98172d2d93d30322165af62348/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libressl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 0a1c9e273..d13b2068c 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL
+	depends on BR2_USE_MMU # fork()
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
-- 
2.11.0
