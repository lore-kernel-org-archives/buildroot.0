From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:36 +0200
Subject: [Buildroot] [PATCH 20/30] package/refpolicy: now available on
 !glibc configs
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-21-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that policycoreutils is available on !glibc configurations, we can
also make refpolicy available for such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 954dc3a093..2e4fbf323c 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
-	depends on BR2_TOOLCHAIN_USES_GLIBC # policycoreutils
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # policycoreutils
 	depends on !BR2_STATIC_LIBS # policycoreutils
 	depends on !BR2_arc # policycoreutils
@@ -28,11 +27,10 @@ config BR2_PACKAGE_REFPOLICY
 
 	  https://github.com/TresysTechnology/refpolicy
 
-comment "refpolicy needs a glibc toolchain w/ threads, dynamic library"
+comment "refpolicy needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_REFPOLICY
 
-- 
2.21.0
