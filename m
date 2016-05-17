From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:53:12 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: musl support is no
	longer experimental
Message-ID: <20160517065436.0F2AF81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8e6f52f0c567d2d001da98968eb64cd807526e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Our musl support has now been around for quite some time, numerous
packages have been fixed (although admittedly not all). It's time to no
longer call our musl support "experimental": things are now expected to
be working with musl just like with the other two C libraries we
support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 toolchain/toolchain-external/Config.in  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index b046a61..2b0ebc1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -67,7 +67,7 @@ comment "(e)glibc only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
-	bool "musl (experimental)"
+	bool "musl"
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_microblaze || BR2_mips || BR2_mipsel || BR2_powerpc || \
 		BR2_sh || BR2_x86_64
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a037d67..0ba5d46 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -562,7 +562,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	  3.16.2.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.12 toolchain (experimental)"
+	bool "Musl 1.1.12 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI) || \
 		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
 		(BR2_armeb && BR2_ARM_EABI) || BR2_i386 || \
@@ -914,7 +914,7 @@ comment "(e)glibc only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
-	bool "musl (experimental)"
+	bool "musl"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	help
 	  Select this option if your external toolchain uses the
