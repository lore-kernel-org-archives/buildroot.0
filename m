From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Oct 2019 23:14:47 +0200
Subject: [Buildroot] [git commit] package/selinux-python: now available on
 !glibc configs
Message-ID: <20191009221023.E2DC97FFFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bef65ef6b94884f204fea8c5a85cdca6a347a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW was not available on !glibc
due to its dependency on checkpolicy. Now that checkpolicy is
available on !glibc systems, we can drop that dependency.

Note that the Config.in comment was wrong: it did mention the glibc
dependency, but the corresponding "depends on" was not there.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/selinux-python/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index b9fab9aaa1..3b6eff88af 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -19,7 +19,6 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	depends on BR2_USE_MMU # sepolgen
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
 	depends on !BR2_STATIC_LIBS # sepolgen
-	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
 	depends on !BR2_arc # checkpolicy
 	select BR2_PACKAGE_CHECKPOLICY
 	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
@@ -33,7 +32,7 @@ config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
 	  audit2why - translates SELinux audit messages into a
 	  description of why the access was denied (audit2allow -w)
 
-comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
+comment "audit2allow needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_arc
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
