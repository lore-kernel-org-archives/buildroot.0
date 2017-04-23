From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 23 Apr 2017 09:11:04 +0200
Subject: [Buildroot] [PATCH] lvm2: allow build since uclibc 1.0.24
Message-ID: <20170423071104.GA28568@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng 1.0.24 allows to use long double wrappers for
every architecture.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/lvm2/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index b28b197..c1287dd 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LVM2
 	depends on !BR2_STATIC_LIBS # It fails to build statically
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # missing floorl(), nearbyintl()
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
@@ -39,7 +38,7 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a glibc toolchain w/ threads, dynamic library"
+comment "lvm2 needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_UCLIBC
+		|| BR2_TOOLCHAIN_USES_MUSL
-- 
2.1.4
