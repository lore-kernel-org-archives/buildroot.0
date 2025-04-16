Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE616C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FACD4082E;
	Wed, 16 Apr 2025 20:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtvoAyBq6mOT; Wed, 16 Apr 2025 20:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39EEA4118F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39EEA4118F;
	Wed, 16 Apr 2025 20:11:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7668C159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6775C406B3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7azZG5xnhRJM for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8604F4034E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8604F4034E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72DAC852FA; Wed, 16 Apr 2025 20:11:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 22:11:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 716461af945e89af56eea4a3936c4a2adc7fdb4d
X-Git-Newrev: 9b467746ed19a5f95d94a04d561bdee0a45d05ea
X-Patchwork-Hint: ignore
Message-Id: <20250416201153.72DAC852FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi{zero2w,
 3}_64: update defconfig
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
Content-Type: multipart/mixed; boundary="===============9131731339240022989=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9131731339240022989==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9b467746ed19a5f95d94a04d561bdee0a45d05ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARM64 bcmrpi3_defconfig has been deleted since 6.12.20[1]. It was
introduced since 4.9.11[2]. It appears to be the 64-bit version of the
ARM bcm2709_defconfig used by Raspberry Pi 2 and Raspberry Pi 3.

The .github/workflows/kernel-build.yml was introduced in 5.15.81[3], and
it shows the ARM64 bcm2711_defconfig is used to build the kernel8.img of
the Raspberry Pi 4 (released in June 2019). The ARM64 bcmrpi3_defconfig
appears to be not used officially, even it was still maintained accross
the different bumps.

The raspberrypi-firmware[5] repository has introduced the kernel8.img
image with 4.19.69[6], and the Raspberry Pi 4 was released a little bit
earlier since 4.19.50 with the ARM64 kernel8.img[7] image (and the ARM
kernel7l.img[8]) (released in September 2019). That kernel8.img appears
to boot the Raspberry Pi 4 (using the ARM64 bcm2711_defconfig).

Raspberry Pi OS 64-bit boots the image kernel8.img on Raspberry 3. The
64-bit version was released in February 2022. It is not certain it takes
the kernel images from the raspberrypi-firmware repository. However, the
firmware boots the exact same image kernel8.img on a Raspberry Pi 3 and
on a Raspberry Pi 4.

Raspberry Pi OS 64-bit on Raspberry Pi 3:

	MESS:00:00:01.423488:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:01.428389:0: brfs: File read: 1361 bytes
	MESS:00:00:01.493416:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:01.498339:0: gpioman: gpioman_get_pin_num: pin LEDS_PWR_OK not defined
	MESS:00:00:02.009915:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
	MESS:00:00:02.016952:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
	MESS:00:00:02.024731:0: gpioman: gpioman_get_pin_num: pin LEDS_PWR_OK not defined
	MESS:00:00:02.031018:0: *** Restart logging
	MESS:00:00:02.034892:0: brfs: File read: 1361 bytes
	MESS:00:00:02.067531:0: gpioman: gpioman_get_pin_num: pin EMMC_ENABLE not defined
	MESS:00:00:02.083340:0: HDMI0: hdmi_pixel_encoding: 162000000
	MESS:00:00:03.164055:0: brfs: File read: /mfs/sd/initramfs8
	MESS:00:00:03.167936:0: Loaded 'initramfs8' to 0x0 size 0x110451e
	MESS:00:00:03.193834:0: initramfs loaded to 0x2defb000 (size 0x110451e)
	MESS:00:00:03.208482:0: dtb_file 'bcm2710-rpi-3-b.dtb'
	MESS:00:00:03.211926:0: brfs: File read: 17843486 bytes
	MESS:00:00:03.221150:0: brfs: File read: /mfs/sd/bcm2710-rpi-3-b.dtb
	MESS:00:00:03.225810:0: Loaded 'bcm2710-rpi-3-b.dtb' to 0x100 size 0x8783
	MESS:00:00:03.247884:0: brfs: File read: 34691 bytes
	MESS:00:00:03.264054:0: brfs: File read: /mfs/sd/overlays/overlay_map.dtb
	MESS:00:00:03.296063:0: brfs: File read: 5423 bytes
	MESS:00:00:03.302800:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:03.306807:0: dtparam: audio=on
	MESS:00:00:03.317529:0: brfs: File read: 1361 bytes
	MESS:00:00:03.341294:0: brfs: File read: /mfs/sd/overlays/vc4-kms-v3d.dtbo
	MESS:00:00:03.392937:0: Loaded overlay 'vc4-kms-v3d'
	MESS:00:00:03.500706:0: brfs: File read: 2760 bytes
	MESS:00:00:03.504586:0: brfs: File read: /mfs/sd/cmdline.txt
	MESS:00:00:03.509305:0: Read command line from file 'cmdline.txt':
	MESS:00:00:03.515172:0: 'console=serial0,115200 console=tty1 root=PARTUUID=28fec58e-02 rootfstype=ext4 fsck.repair=yes rootwait cfg80211.ieee80211_regdom=GB'
	MESS:00:00:03.658110:0: brfs: File read: 132 bytes
	MESS:00:00:04.203939:0: brfs: File read: /mfs/sd/kernel8.img
	MESS:00:00:04.207882:0: Loaded 'kernel8.img' to 0x200000 size 0x8dab16
	MESS:00:00:05.880351:0: Device tree loaded to 0x2def2300 (size 0x8c7c)
	MESS:00:00:05.886331:0: uart: Set PL011 baud rate to 103448.300000 Hz
	MESS:00:00:05.892855:0: uart: Baud rate change done...
	MESS:00:00:05.896271:0: uart: Baud rate

Raspberry Pi OS 64-bit on Raspberry Pi 4:

	MESS:00:00:04.721959:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:04.725196:0: brfs: File read: 1361 bytes
	MESS:00:00:04.750539:0: HDMI0:EDID error reading EDID block 0 attempt 0
	MESS:00:00:04.755048:0: HDMI0:EDID giving up on reading EDID block 0
	MESS:00:00:04.771935:0: HDMI1:EDID error reading EDID block 0 attempt 0
	MESS:00:00:04.776437:0: HDMI1:EDID giving up on reading EDID block 0
	MESS:00:00:04.783084:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:05.589127:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
	MESS:00:00:05.594675:0: gpioman: gpioman_get_pin_num: pin DISPLAY_DSI_PORT not defined
	MESS:00:00:05.603705:0: *** Restart logging
	MESS:00:00:05.605484:0: brfs: File read: 1361 bytes
	MESS:00:00:05.615585:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
	MESS:00:00:05.620610:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
	MESS:00:00:05.631233:0: hdmi: HDMI0:EDID error reading EDID block 0 attempt 0
	MESS:00:00:05.636263:0: hdmi: HDMI0:EDID giving up on reading EDID block 0
	MESS:00:00:05.641861:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
	MESS:00:00:05.655652:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
	MESS:00:00:05.660683:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
	MESS:00:00:05.671304:0: hdmi: HDMI1:EDID error reading EDID block 0 attempt 0
	MESS:00:00:05.676328:0: hdmi: HDMI1:EDID giving up on reading EDID block 0
	MESS:00:00:05.681926:0: hdmi: HDMI:hdmi_get_state is deprecated, use hdmi_get_display_state instead
	MESS:00:00:05.690690:0: HDMI0: hdmi_pixel_encoding: 300000000
	MESS:00:00:05.696162:0: HDMI1: hdmi_pixel_encoding: 300000000
	MESS:00:00:07.208184:0: brfs: File read: /mfs/sd/initramfs8
	MESS:00:00:07.210644:0: Loaded 'initramfs8' to 0x0 size 0x110451e
	MESS:00:00:07.230307:0: initramfs loaded to 0x2defb000 (size 0x110451e)
	MESS:00:00:07.243252:0: dtb_file 'bcm2711-rpi-4-b.dtb'
	MESS:00:00:07.245284:0: brfs: File read: 17843486 bytes
	MESS:00:00:07.256366:0: brfs: File read: /mfs/sd/bcm2711-rpi-4-b.dtb
	MESS:00:00:07.259609:0: Loaded 'bcm2711-rpi-4-b.dtb' to 0x100 size 0xdb30
	MESS:00:00:07.279767:0: brfs: File read: 56112 bytes
	MESS:00:00:07.296967:0: brfs: File read: /mfs/sd/overlays/overlay_map.dtb
	MESS:00:00:07.324428:0: brfs: File read: 5423 bytes
	MESS:00:00:07.328614:0: brfs: File read: /mfs/sd/config.txt
	MESS:00:00:07.331591:0: dtparam: audio=on
	MESS:00:00:07.340485:0: brfs: File read: 1361 bytes
	MESS:00:00:07.363861:0: brfs: File read: /mfs/sd/overlays/vc4-kms-v3d-pi4.dtbo
	MESS:00:00:07.431733:0: Loaded overlay 'vc4-kms-v3d-pi4'
	MESS:00:00:07.603996:0: brfs: File read: 3913 bytes
	MESS:00:00:07.606532:0: brfs: File read: /mfs/sd/cmdline.txt
	MESS:00:00:07.611170:0: Read command line from file 'cmdline.txt':
	MESS:00:00:07.617044:0: 'console=serial0,115200 console=tty1 root=PARTUUID=28fec58e-02 rootfstype=ext4 fsck.repair=yes rootwait cfg80211.ieee80211_regdom=GB'
	MESS:00:00:07.756492:0: brfs: File read: 132 bytes
	MESS:00:00:08.544420:0: brfs: File read: /mfs/sd/kernel8.img
	MESS:00:00:08.546973:0: Loaded 'kernel8.img' to 0x200000 size 0x8dab16
	MESS:00:00:09.864045:0: Device tree loaded to 0x2deed000 (size 0xdfb8)
	MESS:00:00:09.869518:0: uart: Set PL011 baud rate to 103448.300000 Hz
	MESS:00:00:09.876542:0: uart: Baud rate change done...

Considering all of this, the now disappeared ARM64 bcmrpi3_defconfig may
have never been used to release official 64-bit kernels, and the ARM64
bcm2711_defconfig is used by Raspberry Pi 3 and Raspberry Pi 4.

Thus, it is safe to reuse the ARM64 bcm2711_defconfig for the both
raspberrypi3_64_defconfig and raspberrypizero2w_64_defconfig.

This updates the defconfig for the two BCM2710/BCM2837 64-bit hardwares
(i.e. Raspberry Pi 3 and Raspberry Pi Zero 2 W) to reuse the downstream
ARM64 bcm2711_deconfig (i.e. the one used by Raspberry Pi 4).

Hardware                  ARM 32-bit        ARM 64-bit
-------------------------------------------------------------
Raspberry Pi 1/Zero/ZeroW bcmrpi_defconfig  N/A
Raspberry Pi 2            bcm2709_defconfig N/A
Raspberry Pi 3/3+/Zero2W  bcm2709_defconfig bcm2711_defconfig
Raspberry Pi 4/400/CM4-IO bcm2711_defconfig bcm2711_defconfig
Raspberry Pi 5            N/A               bcm2712_defconfig

[1]: https://github.com/raspberrypi/linux/commit/7713244d3baee3493108fb98edd82f5b2042ce48
[2]: https://github.com/raspberrypi/linux/commit/3682d6279419c30a72c7100ef68938e4f1a05bfb
[3]: https://github.com/raspberrypi/linux/commit/200e40ee35e0c22a34bdf5609d1a023f6a764986
[4]: https://www.raspberrypi.com/documentation/computers/config_txt.html#kernel
[5]: https://github.com/raspberrypi/firmware/commit/d21cd6bbab22bba1615df15354015bc50b085ddc
[6]: https://github.com/raspberrypi/linux/commit/935eb6f9a31971ef5537ac5d1b62148f8bcbad2f
[7]: https://github.com/raspberrypi/linux/commit/cdb78ce891f6c6367a69c0a46b5779a58164bd4b
[8]: https://github.com/raspberrypi/linux/commit/e879019c1947beceea2b37fd58656daa8ece9d4e

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/raspberrypi3_64_defconfig      | 2 +-
 configs/raspberrypizero2w_64_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 9e301d8d96..9efc5e07e6 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
index dcb8472671..3f4031a7ec 100644
--- a/configs/raspberrypizero2w_64_defconfig
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

--===============9131731339240022989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9131731339240022989==--
