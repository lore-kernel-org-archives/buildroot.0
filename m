From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 19:31:27 +0100
Subject: [Buildroot] [PATCH v2] glibc: needs MMU
Message-ID: <1393871487-2739-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Like eglibc, glibc is only available to MMU-based architectures.

Re-order select/depends to be in-line with eglibc, just above.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes v1 -> v2:
  - make it really a glibc stuff, not a uClibc one  (Gustavo)
  - depends/select re-ordering
---
 toolchain/toolchain-buildroot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eb5ee46..07db50b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,8 +46,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64 || BR2_microblaze
-	select BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
-- 
1.8.3.2
