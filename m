From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 30 Nov 2017 07:00:28 +0100
Subject: [Buildroot] [PATCH 3/3] musl: enable or1k architecture
Message-ID: <20171130060027.GA25417@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Linux kernel >= 4.13.x musl or1k can be used
with Qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-buildroot/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c624350cac..9668f8d41a 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -79,10 +79,10 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	  || BR2_arm     || BR2_armeb     || BR2_i386 || \
-		   BR2_microblaze || BR2_mips    || BR2_mipsel    || BR2_mips64 || \
-		   BR2_mips64el   || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		   BR2_sh         || BR2_x86_64
+	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
+		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
+		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
+		   BR2_powerpc64le || BR2_sh    || BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
-- 
2.11.0
