From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 17 Jan 2016 18:33:04 +0100
Subject: [Buildroot] [PATCH v3] moarvm: disable for sparc64
Message-ID: <20160117173304.GA5921@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missing implementation of AO_fetch_compare_and_swap in
libatomic_ops library for sparcv9.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v2 -> v3:
   * comment dependency was wrong, fix by Baruch Siach
v1 -> v2:
   * added comment dependency suggested by Baruch Siach
     it was not possible to use a new dependency line.
---
 package/moarvm/Config.in |    3 +++
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
 
-- 
1.7.10.4
