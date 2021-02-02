From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  2 Feb 2021 21:56:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/xenomai: smp support needs at least
 armv6
Message-ID: <20210202205614.59303-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are no autobuilder failures for this issue, but the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_COBALT=y

See:
https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L56

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b655733528..b1b02373c3 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -110,6 +110,8 @@ endchoice
 config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 	bool "Enable SMP support"
 	default y
+	# SMP not supported below armv6
+	depends on !BR2_ARM_CPU_ARMV4 || !BR2_ARM_CPU_ARMV5
 	help
 	  This option enables SMP support in Xenomai userspace.
 
-- 
2.29.2
