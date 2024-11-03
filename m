Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF12D11187
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 17:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F2E810CE;
	Sun,  3 Nov 2024 17:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sX5FqY0bNcCD; Sun,  3 Nov 2024 17:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DF680CA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66DF680CA8;
	Sun,  3 Nov 2024 17:38:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E94723
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74BC740BCF
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTYIAFLHCTXz for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 17:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC14D40BB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC14D40BB7
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 17:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1FB38555C; Sun,  3 Nov 2024 17:38:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Nov 2024 18:33:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11ae90b0011abe3ad01d9953c7d41d444e689f5c
X-Git-Newrev: 771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4
X-Patchwork-Hint: ignore
Message-Id: <20241103173806.D1FB38555C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nvidia_bf3_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2454093666052274851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2454093666052274851==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a basic support for the Bluefied3 board from
Mellanox/NVIDIA:
  - https://www.nvidia.com/en-us/networking/products/data-processing-unit/

  Brief summary of the board features:
  - multicore ARM
      - 16 Core ARM Processor
  - DDR4: 16GB/32GB
  - 2x embedded CX7

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
[Julien:
- remove add-custom-hashes from the commit log
- add link for upstream kernel hashes
- check hash with pgp
- reflow the readme.txt
- regenerated defconfig with make savedefconfig]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 board/nvidia/bf3/linux.config                      | 163 +++++++++++++++++++++
 .../bf3/patches/linux-headers/linux-headers.hash   |   1 +
 board/nvidia/bf3/patches/linux/linux.hash          |   4 +
 board/nvidia/bf3/readme.txt                        |  70 +++++++++
 configs/nvidia_bf3_defconfig                       |  12 ++
 6 files changed, 252 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 327b2e64db..edf823b34b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3271,6 +3271,8 @@ N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
 N:	Vincent Jardin <vjardin@free.fr>
+F:	board/nvidia/bf3/
+F:	configs/nvidia_bf3_defconfig
 F:	package/dpdk/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/board/nvidia/bf3/linux.config b/board/nvidia/bf3/linux.config
new file mode 100644
index 0000000000..5dce565481
--- /dev/null
+++ b/board/nvidia/bf3/linux.config
@@ -0,0 +1,163 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_COMPAT=y
+CONFIG_ACPI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BINFMT_MISC=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=y
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VIRTIO_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_RAS=y
+CONFIG_EDAC=y
+CONFIG_EDAC_LEGACY_SYSFS=y
+CONFIG_EDAC_BLUEFIELD=y
+CONFIG_I2C=y
+CONFIG_MELLANOX_PLATFORM=y
+CONFIG_REGMAP_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_GPIO_MLXBF2=y
+CONFIG_GPIO_MLXBF3=y
+CONFIG_GPIO_MLXBF=y
+CONFIG_I2C_MLXBF=y
+CONFIG_I2C_MLXCPLD=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_MUX_MLXCPLD=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_MLXCPLD=y
+CONFIG_LEDS_MLXREG=y
+CONFIG_NET_SWITCHDEV=y
+CONFIG_MLX5_BRIDGE=y
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_TC_SKB_EXT=y
+CONFIG_CONFIG_NET_CLS_ACT=y
+CONFIG_MLX5_CLS_ACT=y
+CONFIG_DCB=y
+CONFIG_MLX5_CORE_EN_DCB=y
+CONFIG_MLX5_CORE_EN=y
+CONFIG_MLX5_CORE=y
+CONFIG_MLX5_DPLL=y
+CONFIG_MLX5_EN_ARFS=y
+CONFIG_INET_ESP=y
+CONFIG_INET6_ESP=y
+CONFIG_XFRM_OFFLOAD=y
+CONFIG_INET_ESP_OFFLOAD=y
+CONFIG_INET6_ESP_OFFLOAD=y
+CONFIG_MLX5_EN_IPSEC=y
+CONFIG_MLX5_EN_RXNFC=y
+CONFIG_TLS_DEVICE=y
+CONFIG_TLS=y
+CONFIG_MLX5_EN_TLS=y
+CONFIG_MLX5_ESWITCH=y
+CONFIG_MLX5_FPGA_IPSEC=y
+CONFIG_MLX5_FPGA_TLS=y
+CONFIG_MLX5_FPGA=y
+CONFIG_MLX5_IPSEC=y
+CONFIG_MACSEC=y
+CONFIG_MLX5_MACSEC=y
+CONFIG_MLX5_MPFS=y
+CONFIG_MLX5_SF_MANAGER=y
+CONFIG_MLX5_SF=y
+CONFIG_MLX5_SW_STEERING=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_INGRESS=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_TABLES=y
+CONFIG_NF_FLOW_TABLE=y
+CONFIG_NET_ACT_CT=y
+CONFIG_MLX5_TC_CT=y
+CONFIG_MLX5_TC_SAMPLE=y
+CONFIG_MLX5_TLS=y
+CONFIG_VDPA=y
+CONFIG_VHOST_IOTLB=y
+CONFIG_MLX5_VDPA_NET=y
+CONFIG_MLX5_VDPA_STEERING_DEBUG=y
+CONFIG_MLX5_VDPA=y
+CONFIG_IOMMUFD=y
+CONFIG_IOMMU_SUPPORT=y
+CONFIG_VFIO=y
+CONFIG_MLX5_VFIO_PCI=y
+CONFIG_MLXBF_BOOTCTL=y
+CONFIG_MLXBF_GIGE=y
+CONFIG_MLXBF_PMC=y
+CONFIG_MLXBF_TMFIFO=y
+CONFIG_MLXFW=y
+CONFIG_MLXREG_HOTPLUG=y
+CONFIG_MLXREG_IO=y
+CONFIG_WATCHDOG=y
+CONFIG_MLX_WDT=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_BLUEFIELD=y
+CONFIG_NET_VENDOR_MELLANOX=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MLXBF3=y
+CONFIG_POWER_MLXBF=y
+CONFIG_SENSORS_MLXREG_FAN=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_RD_GZIP=y
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
diff --git a/board/nvidia/bf3/patches/linux-headers/linux-headers.hash b/board/nvidia/bf3/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/nvidia/bf3/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/nvidia/bf3/patches/linux/linux.hash b/board/nvidia/bf3/patches/linux/linux.hash
new file mode 100644
index 0000000000..d2272b2110
--- /dev/null
+++ b/board/nvidia/bf3/patches/linux/linux.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+# After checking with pgp with using key
+# B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
+sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
diff --git a/board/nvidia/bf3/readme.txt b/board/nvidia/bf3/readme.txt
new file mode 100644
index 0000000000..7e072d21e2
--- /dev/null
+++ b/board/nvidia/bf3/readme.txt
@@ -0,0 +1,70 @@
+*****************
+BlueField 3 Board
+*****************
+
+The BlueField 3 board is provided "as-is" without official support
+from NVIDIA.
+
+For a detailed description of this board, please refer to the official
+website:
+https://www.nvidia.com/en-us/networking/products/data-processing-unit/
+
+
+Missing Kernel Modules
+======================
+
+Please note that the following kernel modules are unavailable as they
+are not included in the Linux upstream repository:
+  - CONFIG_MLXBF_PTM (module: mlxbf-ptm)
+  - CONFIG_MLXBF_PKA (module: mlxbf-pka)
+
+For further details on these kernel modules and their usage, please
+refer to the NVIDIA documentation:
+https://docs.nvidia.com/networking/display/bluefielddpuosv470/installing+popular+linux+distributions+on+bluefield
+
+
+Boot loader
+===========
+
+NVIDIA does not provide information for rebuilding the ARM BL1, BL2,
+BL3, UEFI, or other components in the boot stages. Therefore, we
+assume the BF3 board is already running the pre-built Ubuntu image
+provided in the BFB installation format.
+
+Since there are no available details on the BF3's BFB format or the
+ARM Trusted Firmware (ATF) needed to rebuild BL1, BL2, BL3, UEFI, or
+GRUB, these components are assumed to remain unmodified.
+
+
+Grub Configuration and Image Loading
+====================================
+
+The board's image is loaded from the BF3's GRUB, with the following
+GRUB settings, assuming the console is set to `hvc0` to provide access
+thru `/dev/rshimN/console` from the root CPU since the root CPU's
+rshim exposes a virtio console over the PCIe bus to the BR3 board.
+
+To update GRUB settings, boot using the built-in BF3 Ubuntu image.
+
+Extract of /etc/default/grub:
+
+    GRUB_DEFAULT=0
+    GRUB_TIMEOUT_STYLE=menu
+    GRUB_TIMEOUT=-1
+    GRUB_RECORDFAIL_TIMEOUT=5
+    GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
+    GRUB_CMDLINE_LINUX_DEFAULT=""
+    GRUB_CMDLINE_LINUX="console=hvc0 earlyprintk=hvc0 earlycon=hvc0 loglevel=7 fixrtc net.ifnames=0 biosdevname=0 iommu.passthrough=1"
+
+
+Uploading Buildroot Images
+--------------------------
+
+After configuring GRUB, you can upload your Buildroot images to the
+BF3’s GRUB boot folder:
+
+    scp build_folder/images/Image BF3:/boot/vmlinuz-buildroot-xyz
+
+Finally, run `update-grub` on the BF3 board to apply the updated GRUB settings.
+
+Enjoy!
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
new file mode 100644
index 0000000000..3f958c0062
--- /dev/null
+++ b/configs/nvidia_bf3_defconfig
@@ -0,0 +1,12 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set

--===============2454093666052274851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2454093666052274851==--
