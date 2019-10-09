From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:10:18 +0200
Subject: [Buildroot] [git commit] package/refpolicy: now available on !glibc
 configs
Message-ID: <20191009221024.39BE2800A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5db3cef0ed7d7ab305811d9b58ab59b6d554ff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that policycoreutils is available on !glibc configurations, we can
also make refpolicy available for such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
