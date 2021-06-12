From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:32:03 +0200
Subject: [Buildroot] [git commit] package/openvpn: requires DES support in
 openssl
Message-ID: <20210612120122.835B18B3E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0603d853b78c3029cad4150389f8786b5f3e7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/a371f455d9550cb1593b5e349278082001245178

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openvpn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 3f4a617fb7..cd8b1db996 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
