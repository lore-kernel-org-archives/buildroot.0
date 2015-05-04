From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 16:01:37 +0200
Subject: [Buildroot] [git commit] toolchain-external: mark musl based
	toolchains as experimental
Message-ID: <20150504140740.C7624819BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed34ff119adecfba460c13585da156d1368dd21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we do for the internal musl backend. We still see a large number of
build failures with musl, so warn users about it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 665a15b..6ea6838 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -814,7 +814,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	  glibc 2.18, gdb 7.7.50 and kernel headers 3.13.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.6 toolchain"
+	bool "Musl 1.1.6 toolchain (experimental)"
 	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
@@ -1102,7 +1102,7 @@ comment "(e)glibc only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
-	bool "musl"
+	bool "musl (experimental)"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	help
 	  Select this option if your external toolchain uses the
