From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 19:20:07 +0100
Subject: [Buildroot] [PATCH] glibc: needs MMU
Message-ID: <1393870807-20546-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Like eglibc, glibc is only available to MMU-based architectures.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eb5ee46..9f71a33 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -9,6 +9,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
 		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
-- 
1.8.3.2
