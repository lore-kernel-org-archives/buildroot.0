From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 14:11:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: requires DES support in
 openssl
Message-ID: <20210612121140.64414-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/a371f455d9550cb1593b5e349278082001245178

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvpn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 3f4a617fb7..81c09c84c2 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
-- 
2.30.2
