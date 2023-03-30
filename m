Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00AC6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 17:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AD53402E5;
	Thu, 30 Mar 2023 17:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD53402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Dl-BmqUz8yF; Thu, 30 Mar 2023 17:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18167403E7;
	Thu, 30 Mar 2023 17:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18167403E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF611BF3C8
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 17:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 741D260D4F
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 17:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741D260D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEN6tzG3UMld for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 17:21:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4FD61676
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF4FD61676
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 17:21:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.135]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1qajXg1lw8-00tE7L; Thu, 30
 Mar 2023 19:21:24 +0200
Date: Thu, 30 Mar 2023 19:21:23 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
Message-ID: <20230330192123.2ea69676@gmx.net>
In-Reply-To: <1619D009AA8C9E469331A8EE22395AEC8C24E16F@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AEC8C24E05A@Exchange2013.PRIMES.local>
 <20230329173851.18816793@gmx.net>
 <1619D009AA8C9E469331A8EE22395AEC8C24E16F@Exchange2013.PRIMES.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:gQWIBzn2yysHMb6f4Cp6C5UiXaaPz2qF+ynswvbKN3KxDqseV7t
 kYKeI/CJw6HF75U4tCiKzyO+e4waiJKhpX0JAFJcxxqjimlDMkRC9S7wWJ8wzrwumqmf9UJ
 qaS5HjrB0roS1jaoPihD3YJ2EtXBTre/9knav4Sd7O/n4H77yXfwDkSgMS2c0CI8iEMTL7b
 o67dVhlWVCzz0LctF4amA==
UI-OutboundReport: notjunk:1;M01:P0:tGYxqcZcTZM=;rq94SvmVpOtoJrbx5riRsECKq4p
 FVkv0ck1KARWKy6aYti4IMTxY1rK5kP14kdPoo87qJK8CPf6KUYJ8NZmTPbBcuXcu4K2sGMVa
 bqnz7Gh4QoCnMLhGwOQ05VMdFjPlhWhhty4SovOjCtvB0Esbgw/uLcrAVPlj5b9dssU8OuaPU
 xFrPAJHO+Lel1/p6W9zMyFKvfdsZR9/Cv6YR7x/N7FUqVX+WHveUig++8mYNgtBHZnJytddqH
 3X5Eeldw8hP0jQ5+rsMm6cjyjgYwGdl48njQJkbrTUzcYSQs2WD3eCm5bNDq7Zf3+6ouVA7p5
 Wck2X1VBFxSi3PWlhH5O3JSc7wqrDjO/bnSaPxQiKmCLS+9ONetOHHt/LFTjIYiZXeFExiXNm
 UcgsvHwcdHjTlOZEyNxh/59Vv82iYJ4Wo9ArGPkZ1dfGyAq1pewzD9l36asHlhXC/SE+QzobV
 mKqgCBQZ/VUFuLlDrxlqqhiiT+TNS4b2Y1b4lALIjvd/Thvyj1B1IGhzPKXsAfRiKFUfpnMVG
 OWUGqoDklVpB9M+56RhmwV2w//7Zy10LnJIVbGF/rRMHGvl/GgPYAEU+iQ1lTcOi/PjCTAkAk
 PgPNX9Xbztu/znAEghWXmVh8BT/9gGTu9GEphOMU3Gt4v4CU3FlUy6CSh0W8YCYJ8OUkZBKqz
 505bEXEb7nJUan5Qrgr8VbTrTmYFFUGmCwM+gelAQ62pIntscog8FfsEmaMotqlTjdrcbKp1o
 nQEyPCuJZTzDirxr4hq2rrIUaMayPjXUsNABx/Q0DZ6Fle2rezGu7G/lKUJ0LMC3DDFxil+D8
 lW21K/AkCqUaLlqJpWPUCeMNlScY5CVJ1u2JW/n7Yf0mqfnWA8yQDD8Fx/nlM9FjOQNtElC7Y
 Uue/rNojlFMpjDjJ+QmE3p6inLSymaPKPUlKvMtF/p8FqIpnSn15J0+kuZ4iZo8DGue+cX4bz
 pCo/aQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680196884; i=ps.report@gmx.net;
 bh=6yBdBTLKiKIAsfPG2UvwVKR/YUtCmoBkSOSKop2m2Ig=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lMWHvh+LmkIjXemZRaoL6iQ+PGwgn75U+D+uaVuceMdBhSonb7wiyQ01d4QjJ7N0Y
 PyGk1pRVPaHi9sYwwEvUdYULeR4kpQIQy5TwqxBotuN/48WAn8fzbEcg0/ERfq1Rkd
 hwbPZZYoa2FqDLVzFsI9SMLGSRyS1ypJmjQDTdNTaxEHaYOl3AaNG5HqwuXfubCYLj
 ng7GjDi6NAo9YEDRbi2mq6sfIW+K8EXCsoZNah8qXIJBSMvfXY0A9luyGydW/Q07R5
 YX8/cyi3FC6PHdrmzCo7Pkyd+QBIft9MjTF0LLxVZnDNK1hoijha6atrHyOrEU442D
 BFvp50N9EyD0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lMWHvh+L
Subject: Re: [Buildroot] generating a kernel with camera support (video 4
 linux)
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gerd,

On Thu, 30 Mar 2023 15:47:14 +0000, Gerd Kautzmann <G.Kautzmann@PRIMES.de> wrote:

> Thank you Peter for your fast reply
>
> > Add 'dtparam=i2c=on' and 'dtoverlay=imx219' to the config.txt file on the first partition, reboot and (dependent on your configuration) load the module
> > via 'modprobe imx219' (or re-build your buildroot image with '/dev management' set to Dynamic mdev or eudev which will enable the udev autoload
> > magic of the kernel modules)...
>
> I tried:
>
> dtparam=i2c=on
> dtoverlay=imx219
>
> and typed:
> >modprobe -v imx219
> (no confirmation or error message)
>
> > modprobe -l | grep imx219
> kernel/drivers/media/i2c/imx219.ko
> (with or without modprobe -v imx219)
>
> I tried some variations I found online:
> dtparam=i2c=on
> dtoverlay=imx219,media-controller=0
> camera_auto_detect=1
>
> No success
>
> I built a new image with
>
> system configuration -> /dev management -> [*] Dynamic using devtmpfs + mdev
>
> didn't help either.
>
> I tested the camera and some of your settings with a standard raspberry image, at least I know this camera could be detected from the raspberry with v4l2-ctl and I got /dev/video0 .
>
> So there seems to be a very basic error in the configuration I made, here ist he configuration I used:
>
> -------------------
>
> make clean
> make raspberrypi4_defconfig
> make menuconfig
>
> Target 			-> [*] ARM (little endian)
> Target Architecture	-> [*] cortex-A72		// attention RaspPi 4 specific!
> Target ABI 		-> [*] EABIhf			// hard float
> Floating Point Strat-> [*] NEON/VFPvi4			// attention RaspPi 4 specific!
> ARM instruction set	-> [*] ARM			// Thumb2 may be more compact but not compatible
>
> Toolchain type		-> [*] buildroot toolchain 	// default Buildroot toolchain
> c library		-> [*] glibc			// uClibc is more compact, glibc is larger but maybe more compatibel
> Kernel headers		-> Same as kernel being built	// should be tested for compatibility later
> Custom kernel headers	-> (5.10.x)			// default
> Enable C++ support	-> [*]
>
> Filesystem images	-> [*] ext2/3/4 root filesystem
> 					`-> [*] ext4		// default
>
> Filesystem images	-> [*] tar the root filesystem
> 					`-> [*] no compression
>
> Networking Applications	->	[*] dropbear	// for ssh client & server
> System config. root pw	->	(PiManiaZX81)		// needed for root login via ssh
>
>
> target packages -> hardware handling -> firmware -> [*] rpi-firmware
> 							`-> [*] rpi 4 (extended)
>
> target packages -> hardware handling -> [*] rpi-userland
>
>
> target packages -> libraries -> graphics [*] opencv4
> 					`-> [*] v4l support
> 					      [*] imgcodecs
> 					      [*] imgproc
>
>
> target packages -> libraries -> hardware handling [*] libgpiod
> target packages -> libraries -> hardware handling [*] lib4l
> 						`-> [*] v4l-utils
> target packages -> libraries -> multimedia [*] libcamera
> 						`-> [*] libcamera v4l compatibility layer
>
> -------------------
> system configuration -> /dev management -> [*] Dynamic using devtmpfs + mdev
> -------------------
>
> The drivers for the camera imx219 are also included with this setting but maybe there is something missing or interfering with v4l ....
>
> Any ideas?

Just tested with the following defconfig (buildrooot-git-master):

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="000000"
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X=y
BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_OPENCV4=y
BR2_PACKAGE_OPENCV4_LIB_IMGCODECS=y
BR2_PACKAGE_OPENCV4_WITH_V4L=y
BR2_PACKAGE_LIBGPIOD=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y
BR2_PACKAGE_LIBCAMERA=y
BR2_PACKAGE_LIBCAMERA_V4L2=y
BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI=y
BR2_PACKAGE_DROPBEAR=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


And on the RPi:

	$ mount /dev/mmcblk0p1 /mnt/
	$ cat /mnt/config.txt
# Please note that this is only a sample, we recommend you to change it to fit
# your needs.
# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
# See http://buildroot.org/manual.html#rootfs-custom
# and http://elinux.org/RPiconfig for a description of config.txt syntax

start_file=start4.elf
fixup_file=fixup4.dat

kernel=zImage

# To use an external initramfs file
#initramfs rootfs.cpio.gz

# Disable overscan assuming the display supports displaying the full resolution
# If the text shown on the screen disappears off the edge, comment this out
disable_overscan=1

# How much memory in MB to assign to the GPU on Pi models having
# 256, 512 or 1024 MB total memory
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100

# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
dtoverlay=miniuart-bt

# enable autoprobing of Bluetooth driver without need of hciattach/btattach
dtoverlay=krnbt=on

dtoverlay=imx219


	$ lsmod | grep imx219
imx219                 20480  1
v4l2_fwnode            24576  2 imx219,bcm2835_unicam
videodev              253952  9 bcm2835_isp,bcm2835_codec,v4l2_mem2mem,bcm2835_v4l2,imx219,bcm2835_unicam,v4l2_fwnode,videobuf2_v4l2,videobuf2_common
mc                     45056  8 bcm2835_isp,bcm2835_codec,v4l2_mem2mem,imx219,bcm2835_unicam,videobuf2_v4l2,videobuf2_common,videodev


	$ v4l2-ctl --all
Driver Info:
	Driver name      : unicam
	Card type        : unicam
	Bus info         : platform:fe801000.csi
	Driver version   : 5.10.92
	Capabilities     : 0xa5a00001
		Video Capture
		Metadata Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x25200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : unicam
	Model            : unicam
	Serial           :
	Bus info         : platform:fe801000.csi
	Media version    : 5.10.92
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.92
Interface Info:
	ID               : 0x03000006
	Type             : V4L Video
Entity Info:
	ID               : 0x00000004 (4)
	Name             : unicam-image
	Function         : V4L2 I/O
	Flags            : default
	Pad 0x01000005   : 0: Sink
	  Link 0x02000008: from remote pad 0x1000002 of entity 'imx219 10-0010' (Camera Sensor): Data, Enabled, Immutable
Priority: 2
Video input : 0 (unicam-image: ok)
Format Video Capture:
	Width/Height      : 640/480
	Pixel Format      : 'YUYV' (YUYV 4:2:2)
	Field             : None
	Bytes per Line    : 1280
	Size Image        : 614400
	Colorspace        : sRGB
	Transfer Function : sRGB
	YCbCr/HSV Encoding: ITU-R 601
	Quantization      : Limited Range
	Flags             :


Camera detected...

Regards,
Peter


> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
