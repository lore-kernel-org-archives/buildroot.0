From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 17:39:44 +0200
Subject: [Buildroot] [git commit] moarvm: disable for sparc
Message-ID: <20160531154337.E62EA81EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebb15bbd413d53651da1a908f752b026013d8b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable for the same reason as sparc64.
Fixes following autobuild failure:
http://autobuild.buildroot.net/results/0c3e8931b2d157764ed18c2a97f26c8e77ea426e/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 82e4509..3e0a104 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_MOARVM
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
-	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
-	depends on !BR2_sparc64
+	# needs AO_fetch_compare_and_swap, not implemented for sparcv8/sparcv9
+	depends on !BR2_sparc64 && !BR2_sparc
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
@@ -19,5 +19,5 @@ comment "moarvm needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-	depends on !BR2_sparc64
+	depends on !BR2_sparc64 && !BR2_sparc
 
