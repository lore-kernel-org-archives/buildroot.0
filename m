Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB62BC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 13:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44B63605B1;
	Thu,  2 Mar 2023 13:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44B63605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8w98Ti-BVN7; Thu,  2 Mar 2023 13:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5F660AC3;
	Thu,  2 Mar 2023 13:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E5F660AC3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD9AD1BF290
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4CAA80C31
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 13:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CAA80C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxOAYHFcUQJi for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 13:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70EDD80BFA
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70EDD80BFA
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 13:12:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62DED1FB;
 Thu,  2 Mar 2023 05:13:32 -0800 (PST)
Received: from debian (X72Y076X74.nice.arm.com [10.34.129.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551113F587;
 Thu,  2 Mar 2023 05:12:48 -0800 (PST)
Date: Thu, 2 Mar 2023 14:12:45 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <ZACgzebwfOVNcfdC@debian>
Mail-Followup-To: Niklas Cassel <niklas.cassel@wdc.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Dick Olsson <hi@senzilla.io>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
References: <20230301155810.3222459-1-niklas.cassel@wdc.com>
 <20230301155810.3222459-4-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301155810.3222459-4-niklas.cassel@wdc.com>
Subject: Re: [Buildroot] [PATCH 3/3] board/qemu/aarch64-sbsa: drop unused
 kernel config file
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 01, 2023 at 04:58:10PM +0100, Niklas Cassel wrote:
> The config file board/qemu/aarch64-sbsa/linux.config has
> never been in use by configs/qemu_aarch64_sbsa_defconfig,
> neither via BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, nor via
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.
> 
> Thus the config file is and has always been unused.

Hi Niklas,

This fragment seems to be used by edk2 python unit test
`support/testing/tests/boot/test_edk2.py'.
I missed that during my testing of the defconfigs.

Best regards,
Vincent.

> Remove it such that no one might get the silly idea that
> it is actually used for something.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  board/qemu/aarch64-sbsa/linux.config | 68 ----------------------------
>  1 file changed, 68 deletions(-)
>  delete mode 100644 board/qemu/aarch64-sbsa/linux.config
> 
> diff --git a/board/qemu/aarch64-sbsa/linux.config b/board/qemu/aarch64-sbsa/linux.config
> deleted file mode 100644
> index a60cce02ec..0000000000
> --- a/board/qemu/aarch64-sbsa/linux.config
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -CONFIG_SYSVIPC=y
> -CONFIG_POSIX_MQUEUE=y
> -CONFIG_NO_HZ_IDLE=y
> -CONFIG_HIGH_RES_TIMERS=y
> -CONFIG_TASKSTATS=y
> -CONFIG_SCHED_AUTOGROUP=y
> -CONFIG_PROFILING=y
> -CONFIG_ARCH_VEXPRESS=y
> -CONFIG_COMPAT=y
> -CONFIG_FW_CFG_SYSFS=y
> -CONFIG_FW_CFG_SYSFS_CMDLINE=y
> -CONFIG_ACPI=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -CONFIG_BLK_DEV_BSGLIB=y
> -CONFIG_BINFMT_MISC=y
> -CONFIG_TRANSPARENT_HUGEPAGE=y
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_PACKET_DIAG=y
> -CONFIG_UNIX=y
> -CONFIG_NET_KEY=y
> -CONFIG_INET=y
> -CONFIG_IP_MULTICAST=y
> -CONFIG_IP_ADVANCED_ROUTER=y
> -CONFIG_BRIDGE=m
> -CONFIG_NET_SCHED=y
> -CONFIG_VSOCKETS=y
> -CONFIG_PCI=y
> -CONFIG_PCI_HOST_GENERIC=y
> -CONFIG_DEVTMPFS=y
> -CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_VIRTIO_BLK=y
> -CONFIG_BLK_DEV_SD=y
> -CONFIG_CHR_DEV_SG=y
> -CONFIG_SCSI_CONSTANTS=y
> -CONFIG_SCSI_LOGGING=y
> -CONFIG_SCSI_SCAN_ASYNC=y
> -CONFIG_SCSI_VIRTIO=y
> -CONFIG_ATA=y
> -CONFIG_SATA_AHCI_PLATFORM=y
> -CONFIG_NETDEVICES=y
> -CONFIG_DUMMY=y
> -CONFIG_MACVLAN=y
> -CONFIG_VIRTIO_NET=y
> -CONFIG_NLMON=y
> -CONFIG_SERIAL_AMBA_PL011=y
> -CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> -CONFIG_VIRTIO_CONSOLE=y
> -CONFIG_HW_RANDOM=y
> -CONFIG_HW_RANDOM_VIRTIO=y
> -CONFIG_TCG_TPM=y
> -CONFIG_TCG_TIS=y
> -CONFIG_DRM=y
> -CONFIG_DRM_VIRTIO_GPU=y
> -CONFIG_RTC_CLASS=y
> -CONFIG_RTC_DRV_PL031=y
> -CONFIG_VIRTIO_PCI=y
> -CONFIG_VIRTIO_MMIO=y
> -CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> -CONFIG_MAILBOX=y
> -CONFIG_PL320_MBOX=y
> -CONFIG_ARM_SMMU_V3=y
> -CONFIG_EXT4_FS=y
> -CONFIG_FUSE_FS=y
> -CONFIG_VIRTIO_FS=y
> -CONFIG_TMPFS=y
> -CONFIG_TMPFS_POSIX_ACL=y
> -- 
> 2.39.2
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
