From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 21:51:02 +0200
Subject: [Buildroot] [git commit] xvisor: add
	BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
Message-ID: <20160925195904.39C5D818ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a7491b8fc6aba900fbaab94295ebf3d12ce209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To prepare the addition of a Config.in comment for xvisor, and avoid the
repetition of the architecture dependencies, this commits adds a new
BR2_PACKAGE_XVISOR_ARCH_SUPPORTS hidden option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvisor/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index f450f6f..c7a3b49 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -1,8 +1,13 @@
-menuconfig BR2_PACKAGE_XVISOR
-	bool "xvisor"
+config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
+	bool
+	default y
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
 	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
+
+menuconfig BR2_PACKAGE_XVISOR
+	bool "xvisor"
+	depends on BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	help
 	  Xvisor is an open-source type-1 hypervisor, which aims at providing
 	  a monolithic, light-weight, portable, and flexible virtualization
