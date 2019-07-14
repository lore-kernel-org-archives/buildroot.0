From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Jul 2019 00:51:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: select openssl if
 gnutls is not enabled
Message-ID: <20190714225100.2957-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/385ab1e09f821facc3d97b7dda6bd8d4a2c98eb5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index ec2962392c..004f82222c 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
 
-- 
2.20.1
