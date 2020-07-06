From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Jul 2020 01:41:49 +0200
Subject: [Buildroot] [PATCH 6/8] board/qemu/aarch64-virt/linux.config:
 enable ARM_SMMU_V3
In-Reply-To: <20200706234151.2940865-1-romain.naour@gmail.com>
References: <20200706234151.2940865-1-romain.naour@gmail.com>
Message-ID: <20200706234151.2940865-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
Support for implementations of the ARM System MMU architecture
version 3 providing translation support to a PCIe root complex.

ARM SMMU is supported since Qemu v3.0.0 [2].

ARM_SMMU_V3 can be enabled with: -M virt,iommu=smmuv3

dmesg:
arm-smmu-v3 9050000.smmuv3: ias 44-bit, oas 44-bit (features 0x00000305)
arm-smmu-v3 9050000.smmuv3: allocated 262144 entries for cmdq
arm-smmu-v3 9050000.smmuv3: allocated 131072 entries for evtq

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/iommu/Kconfig?h=v5.4.42#n390
[2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=527773eeef9f2225370f9c17c35074b2ed0ced92

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index c21994076a..88f4c43c9e 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -56,6 +56,7 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_MAILBOX=y
 CONFIG_PL320_MBOX=y
+CONFIG_ARM_SMMU_V3=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.25.4
