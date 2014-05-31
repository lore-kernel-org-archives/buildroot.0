From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 31 May 2014 10:45:56 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for internal
	musl toolchain
Message-ID: <20140531084556.GA17277@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The assumption musl libc does not support microblaze little endian
mode is wrong.
See http://git.musl-libc.org/cgit/musl/tree/configure
line number 447-448.

Tested with qemu.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 840668c..7623790 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -81,7 +81,7 @@ comment "(e)glibc only available with shared lib support"
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblazebe || \
-		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
1.7.10.4
