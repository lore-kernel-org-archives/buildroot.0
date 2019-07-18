From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:48:13 +0200
Subject: [Buildroot] [git commit] package/glib-networking: select openssl if
 gnutls is not enabled
Message-ID: <20190718204623.21AD68146E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7f418908c494e95bdafef773e62b868db741358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/385ab1e09f821facc3d97b7dda6bd8d4a2c98eb5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
