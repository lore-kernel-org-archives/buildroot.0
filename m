From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:53:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/xenomai: smp
 support needs at least armv6
Message-ID: <20210210183732.0B6C783980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff0509f5f6f72351d70df0271762d7fdc4a39e89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

There are no autobuilder failures for this issue, but the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_COBALT=y

See:
https://gitlab.denx.de/Xenomai/xenomai/-/blob/v3.1/lib/cobalt/arch/arm/include/asm/xenomai/features.h#L56

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998 at free.fr: fix the condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cb380c2e1155a295919aec122788d046b34e45f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 0cb0b343de..634288b62b 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -84,6 +84,8 @@ endchoice
 config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 	bool "Enable SMP support"
 	default y
+	# SMP not supported below armv6
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	help
 	  This option enables SMP support in Xenomai userspace.
 
