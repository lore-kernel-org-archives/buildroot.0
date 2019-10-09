From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:13:15 +0200
Subject: [Buildroot] [git commit] package/libsemanage: drop !BR2_arc
 dependency
Message-ID: <20191009221024.92F6B7FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12f43c3af80be905598dc0bc83f5304014d360c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libselinux is available on ARC, we can drop the !BR2_arc
dependency from libsemanage.

Note that in practice, libsemanage is still not available on ARC,
because BR2_PACKAGE_AUDIT_ARCH_SUPPORTS does not include the ARC
architecture. But still, it makes sense to drop that !BR2_arc which
was inherited from libselinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsemanage/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index e51b711cae..3c7050ee51 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_arc
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_BZIP2
@@ -19,6 +18,5 @@ config BR2_PACKAGE_LIBSEMANAGE
 	  http://selinuxproject.org/page/Main_Page
 
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
