From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu, 24 Jun 2021 09:08:13 -0500
Subject: [Buildroot] [PATCH] package/resiprocate: enable DES in openssl
Message-ID: <20210624140813.206308-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryan.barnett@collins.com>

resiprocate security backend assumes that if openssl is enabled that
it provides DES support. However DES support in openssl has become
optional since  commit a83d418 ("package/libopenssl: add option to
enable some features").

Select openssl DES support in wpa_supplicant Kconfig to avoid build
failures.

Fixes:
http://autobuild.buildroot.net/results/f7def0d5706f9e6ab97accc4eaa5f512a11bcb4c

Signed-off-by: Ryan Barnett <ryan.barnett@collins.com>
---
 package/resiprocate/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index 509c11ffda..7561b7c86c 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_RESIPROCATE
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  reSIProcate is a framework that aims to fully implement the
 	  SIP protocol in first class C++. It is intended for use in
-- 
2.25.1
