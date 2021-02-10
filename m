From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 11:25:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/xenomai: smp
 support needs at least armv6
Message-ID: <20210210183739.5AFC681E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=536f7a84a37601bccd477af7b1affe1c215f225f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
index b655733528..e39a550416 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -110,6 +110,8 @@ endchoice
 config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 	bool "Enable SMP support"
 	default y
+	# SMP not supported below armv6
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	help
 	  This option enables SMP support in Xenomai userspace.
 
