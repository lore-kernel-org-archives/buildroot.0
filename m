From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:16:46 +0100
Subject: [Buildroot] [git commit branch/next] toolchain/buildroot: add
 comment for glibc NaN-2008 headers requirement
Message-ID: <20171129210940.8A2E980794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab3058e096f4f4d53d8071fe5b248b234cc437b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 4a5140ecf (toolchain/buildroot: glibc requires kernel headers >=
4.5 with NaN-2008) added a restriction on kernel headers for glibc when
the architecture is using naN-2008.

However, such a restriction is usually associated to a comment explaining
the restriction, so the user knows what is happening.

That comment was forgotten in 4a5140ecf. Add it now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cbe2038..c624350 100644
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
