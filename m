From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:45 +0200
Subject: [Buildroot] [PATCH 29/30] package/refpolicy: drop !BR2_arc
 dependency
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-30-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

policycoreutils no longer has the !BR2_arc dependency, so we can drop
it as well from refpolicy.

Note that in practice, we still can't enable refpolicy on ARC due to
BR2_PACKAGE_AUDIT_ARCH_SUPPORTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 2e4fbf323c..e775865317 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_REFPOLICY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # policycoreutils
 	depends on !BR2_STATIC_LIBS # policycoreutils
-	depends on !BR2_arc # policycoreutils
 	select BR2_PACKAGE_POLICYCOREUTILS
 	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
 	help
@@ -28,7 +27,6 @@ config BR2_PACKAGE_REFPOLICY
 	  https://github.com/TresysTechnology/refpolicy
 
 comment "refpolicy needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
2.21.0
