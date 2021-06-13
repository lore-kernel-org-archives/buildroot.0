From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:02:44 +0200
Subject: [Buildroot] [git commit] package/libvncserver: requires DES support
 in openssl
Message-ID: <20210613193436.426947FA97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24ec03592d7530cd88dfc268f5c30ba3231eaa0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/3dd9a97e7faa99bab12d7acb069e8414e17f67e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
