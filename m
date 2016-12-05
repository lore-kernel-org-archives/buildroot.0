From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:07:11 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: specify ABI for ARM64
Message-ID: <20161205221749.9CFD67FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e8cb2ee759780c38e06aa8e83d98bb1f2943cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's currently only one widely supported ABI for ARM64, called lp64,
so we define BR2_GCC_TARGET_ABI to the appropriate value.

Note that there is another ABI for ARM64 being worked on, ilp32, but its
support is not fully upstream in the kernel, so we're not adding support
for it for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 1a3c36d..c98efcd 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -513,6 +513,7 @@ config BR2_GCC_TARGET_CPU
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
+	default "lp64"		if BR2_aarch64 || BR2_aarch64_be
 
 config BR2_GCC_TARGET_FPU
 	depends on BR2_arm || BR2_armeb
