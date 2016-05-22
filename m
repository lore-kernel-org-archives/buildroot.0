From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 14:26:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/tinc: needs libdl for OpenSSL
	support
Message-ID: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d5b/d5b2f905d8da79cebda1408ffceac6d4c99f9e7b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tinc/Config.in b/package/tinc/Config.in
index 5390ff3..1d8e2c4 100644
--- a/package/tinc/Config.in
+++ b/package/tinc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TINC
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	depends on !BR2_STATIC_LIBS # tinc requires libdl for OpenSSL
 	depends on BR2_USE_MMU # fork()
 	help
 	  tinc is a Virtual Private Network (VPN) daemon that uses
@@ -10,3 +11,6 @@ config BR2_PACKAGE_TINC
 	  between hosts on the Internet.
 
 	  http://www.tinc-vpn.org/
+
+comment "tinc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.8.1
