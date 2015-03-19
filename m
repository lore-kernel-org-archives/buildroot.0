From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Mar 2015 10:29:15 -0300
Subject: [Buildroot] [PATCH 2/2] toolchain: enable musl for aarch64
In-Reply-To: <1426771755-21261-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426771755-21261-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426771755-21261-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl 1.1.7 brings in experimental aarch64 support so enable it.
Tested via qemu_aarch64_virt_defconfig.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index d4e3bcc..fcbce66 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -83,8 +83,9 @@ comment "(e)glibc only available with shared lib support"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl (experimental)"
-	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_microblaze || \
-		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
+		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
+		BR2_x86_64
 	depends on !BR2_powerpc_SPE # not supported, build breaks
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
-- 
2.0.5
