From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 20:27:43 +0100
Subject: [Buildroot] [git commit] moarvm: disable for sparc64
Message-ID: <20160118194633.7EEA380124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c94db4773340c837b84f6ad2e8b517f12c13c1a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missing implementation of AO_fetch_compare_and_swap in
libatomic_ops library for sparcv9.

Fixes:
http://autobuild.buildroot.net/results/268e328e2d9ea951c0728ab6031d32e2b460d015/
http://autobuild.buildroot.net/results/84847a9201244fce3e05e5e4e201f2e1848238de/

[Peter: add autobuilder references]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 95f3752..dcd353f 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MOARVM
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
+	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
+	depends on !BR2_sparc64
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
@@ -16,4 +18,5 @@ comment "moarvm needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on !BR2_sparc64
 
