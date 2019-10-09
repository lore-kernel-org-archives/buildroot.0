From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:11:56 +0200
Subject: [Buildroot] [git commit] package/selinux-python: re-enable
 audit2allow on ARC
Message-ID: <20191009221024.6A92C7FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=257fa5bf3112b5115cb377b1433f3122c2dd3c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

checkpolicy is now available on ARC, so we can re-enable building
audit2allow on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/selinux-python/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 3b6eff88af..2013bd6445 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	depends on BR2_USE_MMU # sepolgen
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
 	depends on !BR2_STATIC_LIBS # sepolgen
-	depends on !BR2_arc # checkpolicy
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 	select BR2_PACKAGE_SEMODULE_UTILS
@@ -34,7 +33,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 
 comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 
