From: Sam Bobroff <sbobroff@linux.ibm.com>
Date: Wed, 16 May 2018 16:29:09 +1000
Subject: [Buildroot] [PATCH 1/1] rustc: enable on powerpc64le architecture
Message-ID: <abf9f60bdc49092eeebebd1be616cc29f6dd54e7.1526452144.git.sbobroff@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rust supports powerpc64le to the same level as powerpc64, so allow it.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
Hi Buildroot,

I've tested this on a powerpc64le Power8 machine using the pre-built toolchain
(it is available for this arch), and it works fine. Also, thanks to Eric Le
Bihan for the inital work!

Cheers,
Sam.

 package/rustc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 1c79eededc..84a8e0f90b 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 \
 	        && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
-	default y if BR2_powerpc || BR2_powerpc64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
-- 
2.16.1.74.g9b0b1f47b
