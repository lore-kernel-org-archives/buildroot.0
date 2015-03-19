From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Mar 2015 21:49:37 +0100
Subject: [Buildroot] [git commit] toolchain: enable musl for aarch64
Message-ID: <20150319205125.057A6818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e404d5294f7fa503fc62ff0eec2a647402434fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl 1.1.7 brings in experimental aarch64 support so enable it.
Tested via qemu_aarch64_virt_defconfig.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
