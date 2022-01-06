Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881DFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0619840133;
	Thu,  6 Jan 2022 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQJR9YAOzPFc; Thu,  6 Jan 2022 14:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C7A640A16;
	Thu,  6 Jan 2022 14:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE9C1BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 162BA40A16
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0q6CXtODP14 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:43:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B25D640133
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 14:43:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h23so5264410wrc.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91CUFQf4pJq6eCb5hRv90cr3dVUIktWeT4SkgATWYAY=;
 b=f3QN2wRF+2rqG8R1JhknMIylfnX1Oia8xIqoa1iDLvLqO0z+rFvblybloxd/O1l95r
 QvSekqsmf8cnrxlaNzdv1BlTQwe0u0Px5N3Z3PwdKL+kcGebLmjKwZD0huMCkj1tAfa/
 yVGVk+ls8L36ZcBE1wK/Tj9PbEQCLwPTzO5152UuMW9P4jzaW4oHBsDt04CrprxlzQPX
 o8FbuEYivlVcPNKdrBXR4EfSvCjm+hOaiyubIRUSbvl12gXrYMQlnRFAbiXz4eWzCl2k
 xb9fG4CGPeZa04wDCT01HWqZB0kxLmpVXJFh3LGa2u6f/F8WFNJCcMvl3UtkdlFao0s1
 XPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91CUFQf4pJq6eCb5hRv90cr3dVUIktWeT4SkgATWYAY=;
 b=uAuNPTmnz1TOHjOE4YHOES4rcHVrzTD4V4bqW3NShXpal7RPUwjJ8+8/O5PnSzSheX
 Ge5mTKgdc9Q5JJg3D4Otpjr4YCbWmnRWZ7NLpl/NeFQIUzDZgOXs1Q6+eo0GOPAVwUQ/
 AmAvLDa89XfKIy+tPDSpt7h0R1gpNjttC5rwJbamdFsP1R+wBZYBaARVk85HtPhfFpW5
 FE9IpilA9VXJmCAeQZzXTu3Mqf2kJRFOMX+ze3ZgPEmUa0FmojzHCbKtdAeNJs+6VjZi
 mqvzjITLFvJKrD9NVRpyILZlqyCEshTnIlEe01U1g1OMfRBMrB86QkSjqzFkQlNt/j/B
 bBxQ==
X-Gm-Message-State: AOAM531xRXjS4N2/RgkczPntNzJcoZWZjDojcfKQHxPJvQtgHynAPeig
 C5sXJlJL83+hdgEaJdq8jFTnFnOIxSRQ3Q==
X-Google-Smtp-Source: ABdhPJwPR5X5Cxv8bBtP+nr6ZCC3LsGcJdTmqCPBVwSm1cobp4afVztA4sZPCf20IciIVELfabclBg==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr20597760wri.576.1641480184698; 
 Thu, 06 Jan 2022 06:43:04 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id u20sm6267592wml.45.2022.01.06.06.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 06:43:04 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 15:43:01 +0100
Message-Id: <20220106144301.1022644-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv6] board/mender: add a mender board example
 configuration.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, Adam Duskett <Aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <Aduskett@gmail.com>

Buildroot currently has all of the needed packages to use Mender as the primary
update system. However, there isn't any documentation or examples now that
provide a starting point for users. This lack of documentation makes setting up
a Mender based update system difficult and time-consuming.

Provided in this patch series is a mender_x86_64_efi_defconfig of which sets up
an x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
QEMU environment. The system partition schema comprises of two equally sized
root partitions and a data partition that mounts to /var/lib/mender as a
persistent data store partition.

There is a board/mender/readme.txt provided, which gives users documentation on
how to flash the built image or boot the image using QEMU as well.

The post-build and post-image-efi scripts also have four options:
-a --artifact-name:
  - The name of the artifact, this is added to /etc/mender/artifact_info
-o --data-part-size:
  - The data partition size.
-d --device-type
  - The device-type used by mender to catagorize registered devices.
-g --generate-mender-image
  - Set to true to generate a mender image after a build.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
[Romain: rebase on master (01.2022)
  - update genimage-efi.cfg to use GPT partition table and genimage-15 syntax
  - bump the kernel to 5.15.13
  - Add host-libelf kernel dependency
  - Use BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI after commit 82d1e8c628cc
    (boot/grub2: use none platform when building for host)
  - Add regexp grub mandatory module for mender-grubenv
  - remove startup.nsh from genimage-efi.cfg after commit 3efb5e31fc05
    (board, boot, package: remove usage of startup.nsh in EFI partition)]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes: v5 -> v6:
  - rebase on master (01.2022)
  - update genimage-efi.cfg to use GPT partition table and genimage-15 syntax
  - bump the kernel to 5.15.13
  - Add host-libelf kernel dependency
  - Use BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI after commit 82d1e8c628cc
    (boot/grub2: use none platform when building for host)
  - Add regexp grub mandatory module for mender-grubenv
  - remove startup.nsh from genimage-efi.cfg after commit 3efb5e31fc05
    (board, boot, package: remove usage of startup.nsh in EFI partition)

Changes v4 -> v5:
  - Fix the patch format

Changes v3 -> v4 (Mikael Bourhis-Cloarec):
  - Add fix: missing "=y" for SSP option in defconfig
  - Add fix: mounting point of '/dev/vda1' in 'overlay/etc/fstab'

Changes v2 -> v3:
  - Bump kernel version to 5.5.7
  - Move the board files form board/mender to board/mender/x86_64
  - Add the four arguments to the post-build and post-image scripts.
  - Update genimage-efi.cfg to ensure that all partitions line up properly.
  - Update the readme.txt file to reflect the script argument changes.

Changes v1 -> v2:
  - Remove uneeded entries in board/mender/overlays/etc/fstab

  - Rename post-image-efi-gpt.sh to post-image-efi.sh

  - Rename pre-image.sh to post-build.sh to keep with standard naming conventions.

  - Check if /var/lib/mender is a symlink, and if so; remove it and create a
    directory in its place. This change prevents the mender init script from
    doing the same thing and preventing the data partition from mounting
    correctly on the initial boot.

  - Make creating a mender artifact optional after the build.

  - Add more documentation in board/mender/readme.txt.
  - Add genimage-efi.cfg [Thomas]

  - Use genimage.sh instead of the old-style found in
    board/pc/post-image-efi-gpt.sh (Thomas)
---
 board/mender/x86_64/genimage-efi.cfg          | 44 ++++++++++
 board/mender/x86_64/linux.config              | 64 ++++++++++++++
 board/mender/x86_64/mender_grubenv_defines    | 25 ++++++
 board/mender/x86_64/overlay/etc/fstab         |  7 ++
 .../x86_64/overlay/etc/mender/mender.conf     | 11 +++
 board/mender/x86_64/post-build.sh             | 54 ++++++++++++
 board/mender/x86_64/post-image-efi.sh         | 84 +++++++++++++++++++
 board/mender/x86_64/readme.txt                | 67 +++++++++++++++
 configs/mender_x86_64_efi_defconfig           | 81 ++++++++++++++++++
 9 files changed, 437 insertions(+)
 create mode 100644 board/mender/x86_64/genimage-efi.cfg
 create mode 100644 board/mender/x86_64/linux.config
 create mode 100644 board/mender/x86_64/mender_grubenv_defines
 create mode 100644 board/mender/x86_64/overlay/etc/fstab
 create mode 100644 board/mender/x86_64/overlay/etc/mender/mender.conf
 create mode 100755 board/mender/x86_64/post-build.sh
 create mode 100755 board/mender/x86_64/post-image-efi.sh
 create mode 100644 board/mender/x86_64/readme.txt
 create mode 100644 configs/mender_x86_64_efi_defconfig

diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
new file mode 100644
index 0000000000..73102d5c30
--- /dev/null
+++ b/board/mender/x86_64/genimage-efi.cfg
@@ -0,0 +1,44 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file bzImage {
+			image = "bzImage"
+		}
+	}
+
+	size = 16777216
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32768
+		size = 16777216
+		image = "efi-part.vfat"
+		bootable = true
+	}
+
+	partition roota {
+		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		offset = 16809984
+		image = "rootfs.ext2"
+	}
+
+	partition rootb {
+		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		offset = 151027712
+		image = "rootfs.ext2"
+	}
+
+	partition data {
+		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		offset = 285245440
+		image = "data-part.ext4"
+	}
+}
diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
new file mode 100644
index 0000000000..f17fc18edb
--- /dev/null
+++ b/board/mender/x86_64/linux.config
@@ -0,0 +1,64 @@
+CONFIG_SYSVIPC=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_EFI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_ATH9K=m
+CONFIG_ATH9K_HTC=m
+CONFIG_CARL9170=m
+CONFIG_ATH10K=m
+CONFIG_RT2X00=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+# CONFIG_RTL_CARDS is not set
+CONFIG_RTL8XXXU=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB_VESA=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/mender/x86_64/mender_grubenv_defines b/board/mender/x86_64/mender_grubenv_defines
new file mode 100644
index 0000000000..77f68fe6b2
--- /dev/null
+++ b/board/mender/x86_64/mender_grubenv_defines
@@ -0,0 +1,25 @@
+################################################################################
+# Mandatory
+################################################################################
+# Warning: This file is an example and should be customized to fit your needs!
+
+# Partition index of root filesystem A
+mender_rootfsa_part=2
+
+# Partition index of root filesystem B
+mender_rootfsb_part=3
+
+# Device file corresponding to the root filesystem partitions, without index.
+mender_kernel_root_base=/dev/vda
+
+# Name of the storage device containing root filesystem partitions in GRUB
+# format.
+mender_grub_storage_device=hd0
+
+# Type of kernel (bzImage or zImage)
+kernel_imagetype=bzImage
+
+# Type of initrd image.
+# Note: An initrd image is not strictly necessary, and the system will boot and
+#       update without a initrd image.
+# initrd_imagetype=initrd.img
diff --git a/board/mender/x86_64/overlay/etc/fstab b/board/mender/x86_64/overlay/etc/fstab
new file mode 100644
index 0000000000..45a7ba0260
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/fstab
@@ -0,0 +1,7 @@
+# <file system>     <mount pt>      <type>      <options>                               <dump>  <pass>
+/dev/root           /               ext4        rw,noauto                                   0    1
+/dev/vda1           /boot           vfat        defaults                                    0    0
+/dev/vda4           /var/lib/mender ext4        rw,relatime                                 0    0
+proc                /proc           proc        defaults                                    0    0
+devpts              /dev/pts        devpts      defaults,gid=5,mode=620,ptmxmode=0666       0    0
+sysfs               /sys            sysfs       defaults                                    0    0
diff --git a/board/mender/x86_64/overlay/etc/mender/mender.conf b/board/mender/x86_64/overlay/etc/mender/mender.conf
new file mode 100644
index 0000000000..5f423fb2cb
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/mender/mender.conf
@@ -0,0 +1,11 @@
+{
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "/dev/vda2",
+  "RootfsPartB": "/dev/vda3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy",
+  "DeviceTypeFile": "/etc/mender/device_type"
+}
diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
new file mode 100755
index 0000000000..e93a3cb1c2
--- /dev/null
+++ b/board/mender/x86_64/post-build.sh
@@ -0,0 +1,54 @@
+#!/usr/bin/env bash
+set -e
+DEVICE_TYPE="buildroot-x86_64"
+ARTIFACT_NAME="1.0"
+
+function parse_args(){
+    local o O opts
+    o='a:o:d:g:'
+    O='artifact-name:,data-part-size:,device-type:,generate-mender-image:'
+    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
+    eval set -- "${opts}"
+    while [ ${#} -gt 0 ]; do
+        case "${1}" in
+        (-o|--data-part-size)
+            DATA_PART_SIZE="${2}"; shift 2
+            ;;
+        (-d|--device-type)
+            DEVICE_TYPE="${2}"; shift 2
+            ;;
+        (-g|--generate-mender-image)
+            GENERATE_MENDER_IMAGE="${2}"; shift 2
+            ;;
+        (-a|--artifact-name)
+            ARTIFACT_NAME="${2}"; shift 2
+            ;;
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+}
+
+  # Create a persistent directory to mount the data partition at.
+function mender_fixup(){
+  cd ${TARGET_DIR}
+  if [[ -L var/lib/mender ]]; then
+    rm var/lib/mender
+    mkdir -p var/lib/mender
+  fi
+
+  # The common paradigm is to have the persistent data volume at /data for mender.
+  if [[ ! -L data ]]; then
+      ln -s var/lib/mender data
+  fi
+}
+
+function main(){
+  parse_args "${@}"
+  mender_fixup
+  echo "device_type=${DEVICE_TYPE}" > ${TARGET_DIR}/etc/mender/device_type
+  echo "artifact_name=${ARTIFACT_NAME}" > ${TARGET_DIR}/etc/mender/artifact_info
+}
+
+main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
new file mode 100755
index 0000000000..2d3e36e614
--- /dev/null
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -0,0 +1,84 @@
+#!/usr/bin/env bash
+set -e
+BOARD_DIR="$(realpath $(dirname $0))"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-efi.cfg"
+DATA_PART_SIZE="32M"
+DEVICE_TYPE="buildroot-x86_64"
+GENERATE_MENDER_IMAGE="false"
+ARTIFACT_NAME="1.0"
+
+
+# Parse arguments.
+function parse_args(){
+    local o O opts
+    o='a:o:d:g:'
+    O='artifact-name:,data-part-size:,device-type:,generate-mender-image:'
+    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
+    eval set -- "${opts}"
+    while [ ${#} -gt 0 ]; do
+        case "${1}" in
+        (-o|--data-part-size)
+            DATA_PART_SIZE="${2}"; shift 2
+            ;;
+        (-d|--device-type)
+            DEVICE_TYPE="${2}"; shift 2
+            ;;
+        (-g|--generate-mender-image)
+            GENERATE_MENDER_IMAGE="${2}"; shift 2
+            ;;
+        (-a|--artifact-name)
+            ARTIFACT_NAME="${2}"; shift 2
+            ;;
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+}
+
+# Create the data partition
+function make_data_partition(){
+    rm -rf ${BINARIES_DIR}/data-part.ext4
+    rm -rf ${BINARIES_DIR}/data-part
+    mkdir -p ${BINARIES_DIR}/data-part
+
+    ${HOST_DIR}/sbin/mkfs.ext4 \
+    -d ${BINARIES_DIR}/data-part \
+    -r 1 \
+    -N 0 \
+    -m 5 \
+    -L "data" \
+    -O ^64bit ${BINARIES_DIR}/data-part.ext4 "${DATA_PART_SIZE}"
+    ${HOST_DIR}/sbin/e2fsck -y ${BINARIES_DIR}/data-part.ext4
+}
+
+
+# Create a mender image.
+function generate_mender_image(){
+  if [[ ${GENERATE_MENDER_IMAGE} == "true" ]]; then
+    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+    ${HOST_DIR}/bin/mender-artifact \
+      --compression lzma \
+      write rootfs-image \
+      -t ${DEVICE_TYPE} \
+      -n ${BR2_VERSION} \
+      -f ${BINARIES_DIR}/rootfs.ext2 \
+      -o ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender
+  fi
+}
+
+
+function generate_image(){
+    sh support/scripts/genimage.sh -c ${BOARD_DIR}/genimage-efi.cfg
+}
+
+# Main function.
+function main(){
+  parse_args "${@}"
+  make_data_partition
+  generate_image
+  generate_mender_image
+  exit $?
+
+}
+main "${@}"
diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
new file mode 100644
index 0000000000..c006215e6f
--- /dev/null
+++ b/board/mender/x86_64/readme.txt
@@ -0,0 +1,67 @@
+Mender UEFI PC sample config
+=====================
+
+1. Build
+
+  $ make mender_x86_64_efi_defconfig
+
+  Add any additional packages required and build:
+
+  $ make
+
+2. Write the Pendrive
+
+  The build process will create a Pendrive image called disk.img in
+  output/images.
+
+  Write the image to a pendrive:
+
+  $ dd if=output/images/disk.img of=/dev/${pendrive}; sync
+
+  Once the process is complete, insert it into the target PC and boot.
+
+  Remember that if said PC has another boot device you might need to
+  select this alternative for it to boot.
+
+  You might need to disable Secure Boot from the setup as well.
+
+3. Enjoy
+
+Emulation in qemu
+========================
+
+Run the emulation with:
+
+qemu-system-x86_64 \
+    -M pc \
+    -bios </path/to/OVMF_CODE.fd> \
+    -drive file=output/images/disk.img,if=virtio,format=raw \
+    -net nic,model=virtio \
+    -net user
+
+Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
+firmware image for qemu. It may be provided by your distribution as an
+edk2 or OVMF package, in a path such as /usr/share/edk2/ovmf/OVMF_CODE.fd.
+
+Optional arguments:
+ - -enable-kvm to speed up qemu. This requires a loaded kvm module on the host
+    system.
+ - Add -smp N to emulate an SMP system with N CPUs.
+
+The login prompt will appear in the serial window.
+
+Tested with QEMU 4.1.1 on Fedora 31
+
+Creating a mender-artifact
+========================
+In menuconfig -> System configuration, edit the field
+"Extra arguments passed to custom scripts"
+And change --generate-mender-image=false to --generate-mender-image=true
+
+You may wish to change --artifact-name=1.0 to a name that best suits your
+particular needs, as this option changes the mender artifact name.
+
+Using mender
+========================
+Please read the mender documentation at:
+https://docs.mender.io/2.2/getting-started
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
new file mode 100644
index 0000000000..aba1c38c7f
--- /dev/null
+++ b/configs/mender_x86_64_efi_defconfig
@@ -0,0 +1,81 @@
+# Architecture
+BR2_x86_64=y
+
+# Toolchain, required for eudev (to autoload drivers)
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+# Required for sysvinit
+BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+# Required as vda4 doesn't mount on first boot with busybox
+BR2_INIT_SYSV=y
+
+# Required tools to create bootable media
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+# Add mandatory modules from MENDER_GRUBENV_MANDATORY_MODULES
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp"
+BR2_TARGET_GRUB2_INSTALL_TOOLS=y
+
+# Required tools to create a mender image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --generate-mender-image=false --artifact-name=1.0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+
+# Firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+
+# Packages
+#
+# Use connman so that networking setup is simpler, via connmanctl tool
+# acpid is for seamless power button support
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_MENDER=y
+BR2_PACKAGE_MENDER_GRUBENV=y
+BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
