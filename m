From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Nov 2017 16:19:02 +0100
Subject: [Buildroot] [PATCH next] toolchain/buildroot: add comment for glibc
 NaN-2008 headers requirement
Message-ID: <20171125151902.502-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4a5140ecf (toolchain/buildroot: glibc requires kernel headers >=
4.5 with NaN-2008) added a restriction on kernel hjeaders for glibc when
the architecture is using naN-2008.

However, such a restriction is usually associated to a comment explaining
the restiction, so the user knows what is happening.

That comment was forgotten in 4a5140ecf. Add it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-buildroot/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cbe2038a77..c624350cac 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -72,6 +72,11 @@ comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
 	depends on BR2_powerpc64le
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
+# Support for MIPS NAN2008 needs headers >= 4.5
+comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
+	depends on BR2_MIPS_NAN_2008
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
-- 
2.11.0
