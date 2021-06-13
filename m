From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jun 2021 11:46:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: requires DES support
 in openssl
Message-ID: <20210613094625.878788-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/3dd9a97e7faa99bab12d7acb069e8414e17f67e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvncserver/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 2d5bf8a182..6189b379d2 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBVNCSERVER
 	depends on !BR2_nios2
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  libvncserver is a VNC server/client library.
 
-- 
2.30.2
