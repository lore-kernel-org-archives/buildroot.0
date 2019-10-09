From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:13:45 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: drop !BR2_arc
 dependency
Message-ID: <20191009221024.9B1557FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=682714b1e5789ac3c4cb0965e280596a299191a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsemanage no longer has the !BR2_arc dependency, so we can drop it
as well from policycoreutils. In practice, we still can't select
policycoreutils on ARC due to BR2_PACKAGE_AUDIT_ARCH_SUPPORTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/policycoreutils/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 73e86d0bfb..81900b4e41 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -1,5 +1,4 @@
 comment "policycoreutils needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
@@ -8,7 +7,6 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
 	depends on !BR2_STATIC_LIBS #libsemanage
-	depends on !BR2_arc # libsemanage
 	select BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_LIBCAP_NG
 	help
