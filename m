From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2015 23:58:49 +0200
Subject: [Buildroot] [git commit] ofono: needs dynamic library support
Message-ID: <20150607221446.758D480824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86cd99aa958e12e82c83da34d77b81f7c0bdd4d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only package selection ofono, connman, requires dynamic library already.

Fixes:
http://autobuild.buildroot.net/results/c5b/c5bb44c192c076b42538f805062a465318051df4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index eb1856f..f709b04 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,7 +16,7 @@ config BR2_PACKAGE_OFONO
 
 	  http://ofono.org/
 
-comment "ofono needs a toolchain w/ wchar, threads"
+comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
