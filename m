Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D8C4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 20:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF8BB40354;
	Thu, 17 Nov 2022 20:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF8BB40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwM-DKm2g9Ws; Thu, 17 Nov 2022 20:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6BE4012F;
	Thu, 17 Nov 2022 20:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6BE4012F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 598F71BF39D
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408EE41910
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 20:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408EE41910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCLCJYvxd2ef for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 20:27:49 +0000 (UTC)
X-Greylist: delayed 01:10:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B5F4190F
Received: from 4.mo548.mail-out.ovh.net (4.mo548.mail-out.ovh.net
 [188.165.42.229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88B5F4190F
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 20:27:49 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CC0A320905;
 Thu, 17 Nov 2022 18:00:04 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 19:00:04 +0100
X-OVh-ClientIp: 82.64.250.170
Message-ID: <10716f6f-5738-5dbb-d0e7-6711331835d1@kaod.org>
Date: Thu, 17 Nov 2022 19:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, <buildroot@buildroot.org>
References: <20220904095237.1401885-1-laurent@vivier.eu>
 <20220904095237.1401885-3-laurent@vivier.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220904095237.1401885-3-laurent@vivier.eu>
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2c7a155e-d1d5-45e2-a0c4-2f9038a0b02d
X-Ovh-Tracer-Id: 8548957996063099811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhgruhhrvghnthesvhhivhhivghrrdgvuhdpsghuihhlughrohhothessghuihhlughrohhothdrohhrghdphhhuthhhsehtuhigfhgrmhhilhihrdhorhhgpdhrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdpthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00350d65d60-3be0-4194-bd38-80a961bea3bb,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH v5 2/2] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Laurent,

On 9/4/22 11:52, Laurent Vivier wrote:
> Build a 5.19 (first version with the m68k virt machine) kernel
> for "qemu-system-m68k -M virt" machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   DEVELOPERS                                 |  2 +
>   board/qemu/m68k-virt/config.linux          | 89 ++++++++++++++++++++++

Why not use the linux virt_defconfig ?

>   board/qemu/m68k-virt/readme.txt            |  5 ++
>   configs/qemu_m68k_virt_petitboot_defconfig | 25 ++++++
>   4 files changed, 121 insertions(+)
>   create mode 100644 board/qemu/m68k-virt/config.linux
>   create mode 100644 board/qemu/m68k-virt/readme.txt
>   create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 45fa4c7e0686..fb500c706543 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1744,6 +1744,8 @@ F:	package/open-lldp/
>   
>   N:	Laurent Vivier <laurent@vivier.eu>
>   F:	package/petitboot/
> +F:	board/qemu/m68k-virt/
> +F:	configs/qemu_m68k_virt_petitboot_defconfig
>   
>   N:	Lee Jones <lee.jones@linaro.org>
>   F:	boot/afboot-stm32/
> diff --git a/board/qemu/m68k-virt/config.linux b/board/qemu/m68k-virt/config.linux
> new file mode 100644
> index 000000000000..88edb9b1eb3f
> --- /dev/null
> +++ b/board/qemu/m68k-virt/config.linux
> @@ -0,0 +1,89 @@
> +CONFIG_LOCALVERSION="-virt"
> +CONFIG_SYSVIPC=y
> +CONFIG_CGROUPS=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_RDMA=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_KEXEC=y
> +CONFIG_BOOTINFO_PROC=y
> +CONFIG_VIRT=y
> +CONFIG_PROC_HARDWARE=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_AMIGA_PARTITION=y
> +CONFIG_ATARI_PARTITION=y
> +CONFIG_MAC_PARTITION=y
> +CONFIG_BSD_DISKLABEL=y
> +CONFIG_MINIX_SUBPARTITION=y
> +CONFIG_SOLARIS_X86_PARTITION=y
> +CONFIG_UNIXWARE_DISKLABEL=y
> +CONFIG_LDM_PARTITION=y
> +CONFIG_LDM_DEBUG=y
> +CONFIG_SUN_PARTITION=y
> +CONFIG_SYSV68_PARTITION=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_CGROUP_NET_PRIO=y
> +CONFIG_CGROUP_NET_CLASSID=y
> +CONFIG_NET_9P=y
> +CONFIG_NET_9P_VIRTIO=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_SCSI_VIRTIO=y
> +CONFIG_MD=y
> +CONFIG_MD_LINEAR=y
> +CONFIG_MD_MULTIPATH=y
> +CONFIG_MD_FAULTY=y
> +CONFIG_BLK_DEV_DM=y
> +CONFIG_DM_UNSTRIPED=y
> +CONFIG_DM_CRYPT=y
> +CONFIG_DM_SNAPSHOT=y
> +CONFIG_DM_THIN_PROVISIONING=y
> +CONFIG_DM_CACHE=y
> +CONFIG_DM_WRITECACHE=y
> +CONFIG_DM_EBS=y
> +CONFIG_DM_ERA=y
> +CONFIG_DM_CLONE=y
> +CONFIG_DM_MIRROR=y
> +CONFIG_DM_RAID=y
> +CONFIG_DM_ZERO=y
> +CONFIG_NETDEVICES=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_INPUT_MOUSEDEV=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_FB=y
> +CONFIG_SOUND=y
> +CONFIG_SND=y
> +CONFIG_SND_VIRTIO=y
> +CONFIG_VIRT_DRIVERS=y
> +CONFIG_VIRTIO_INPUT=y
> +CONFIG_EXT4_FS=y
> +CONFIG_AUTOFS_FS=y
> +CONFIG_ISO9660_FS=y
> +CONFIG_JOLIET=y
> +CONFIG_ZISOFS=y
> +CONFIG_UDF_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_9P_FS=y
> +CONFIG_9P_FS_POSIX_ACL=y
> +CONFIG_9P_FS_SECURITY=y
> +CONFIG_EARLY_PRINTK=y
> diff --git a/board/qemu/m68k-virt/readme.txt b/board/qemu/m68k-virt/readme.txt
> new file mode 100644
> index 000000000000..30803d403a4c
> --- /dev/null
> +++ b/board/qemu/m68k-virt/readme.txt
> @@ -0,0 +1,5 @@
> +Run the emulation with:
> +
> + qemu-system-m68k -M virt -kernel output/images/vmlinux -initrd output/images/rootfs.cpio.xz -append "console=ttyGF0" --nographic # /qemu_m68k_virt_petitboot_defconfig
> +
> +The petiboot menu will appear in the terminal where QEMU has been started.
> diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
> new file mode 100644
> index 000000000000..4f289fb7a667
> --- /dev/null
> +++ b/configs/qemu_m68k_virt_petitboot_defconfig
> @@ -0,0 +1,25 @@
> +BR2_m68k=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_CCACHE=y
> +BR2_RELRO_NONE=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyGF0"
> +BR2_ROOTFS_OVERLAY="package/petitboot/fs-overlay"

You could add :

BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-virt/config.linux"
> +BR2_LINUX_KERNEL_XZ=y
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KEXEC=y
> +BR2_PACKAGE_KEXEC_ZLIB=y
> +BR2_PACKAGE_ETHTOOL=y
> +BR2_PACKAGE_NET_TOOLS=y
> +BR2_PACKAGE_NETCAT=y
> +BR2_PACKAGE_RSYNC=y
> +BR2_PACKAGE_PETITBOOT=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +BR2_TARGET_ROOTFS_CPIO_XZ=y

and  :

# host-qemu for gitlab testing
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y


Thanks,

C.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
