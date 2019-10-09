From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:14:05 +0200
Subject: [Buildroot] [git commit] package/refpolicy: drop !BR2_arc dependency
Message-ID: <20191009221024.A25BA8182A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=844ea7c42ce800f24aa4a6e00f175ae4fd06e852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

policycoreutils no longer has the !BR2_arc dependency, so we can drop
it as well from refpolicy.

Note that in practice, we still can't enable refpolicy on ARC due to
BR2_PACKAGE_AUDIT_ARCH_SUPPORTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
