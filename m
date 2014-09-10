From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 17:16:04 -0300
Subject: [Buildroot] [PATCH] toolchain/musl: disable for PowerPC SPE
Message-ID: <1410380164-17479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not supported and the build breaks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eef9f9c..53d86dd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -84,6 +84,7 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
1.8.5.5
