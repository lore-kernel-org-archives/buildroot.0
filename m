From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:35 +0200
Subject: [Buildroot] [PATCH 19/30] package/policycoreutils: now available on
 !glibc configs
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-20-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that libsemanage is available on non-glibc configurations, we can
also allow the selection of policycoreutils for such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 0d69fb51a5..73e86d0bfb 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,8 +1,7 @@
-comment "policycoreutils needs a glibc toolchain w/ threads, dynamic library"
+comment "policycoreutils needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
@@ -10,7 +9,6 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
 	depends on !BR2_STATIC_LIBS #libsemanage
 	depends on !BR2_arc # libsemanage
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
 	help
-- 
2.21.0
