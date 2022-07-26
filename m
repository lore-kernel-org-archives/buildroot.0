Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A15C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3AAA4196A;
	Tue, 26 Jul 2022 17:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3AAA4196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZu-DfDMdO8r; Tue, 26 Jul 2022 17:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517D541997;
	Tue, 26 Jul 2022 17:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 517D541997
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22D951BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F08D584762
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F08D584762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMkJzHJR2EqP for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:31:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A28A84751
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A28A84751
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:31:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EBB620005;
 Tue, 26 Jul 2022 17:31:13 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:31:12 +0200
To: Marian Ulbricht <ulbricht@innoroute.de>
Message-ID: <20220726193112.5612411f@windsurf>
In-Reply-To: <20220724181250.31118-1-ulbricht@innoroute.de>
References: <20220724181250.31118-1-ulbricht@innoroute.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658856673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43NPbZUHMxLpXcVS1tNF7RCaWHgE7o1eEI3gwJiwupQ=;
 b=hd1ibAF2+V4odfQUkxcbR4zcFdMphWl8oJuSC5zfmfrPRKBn3fYrKzXgxtQ0cGwgBhx1NL
 LPf3531nzEva9K6P/4YL3S/icJAj21/nhkl7BMoxo3CgFJhZLfyk+WMQsYFV1u6HiglXd9
 kzwJDafwPfKe4MZok92RUzZfulbV/ycWibqkQM0pqUSifc0oAU7+9afIn6WwEFe01fvO9I
 +2UtFDCCdqZbTfjaoij2Zm7WD+mGsg7IUzjdqWvY+Nbln7ANegzKkcHH6NfgHWPraurx96
 WmBu/w2WDNOVGylwYscB6D6c16GRYQsNHqaTInRyK1eNURqLzU/agUvG6q4wLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hd1ibAF2
Subject: Re: [Buildroot] [PATCH 1/1 v2] add support for mws4 board
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marian,

First of all, thanks for your contribution. See below a number of
comments/questions about your patch.

On Sun, 24 Jul 2022 20:12:51 +0200
Marian Ulbricht <ulbricht@innoroute.de> wrote:

> mws4 is an arm based nuclear probe hardware used from
> German government to monitor nuclear activity.
> This patch adds all necessary files to build an image for this board.

Could you clarify why it would make sense for Buildroot to have a
defconfig for this platform? Contrary to what Yann Morin said, I have
some doubts on the relevance of a defconfig for this platform in
Buildroot. We normally have defconfigs for evaluation boards, for
development boards, hobbyists boards, etc. but not for "real products".

> changelog:
> v2:
>     * remove binary files from patch
>     * add board-readme

The changelog should go...

> Signed-off-by: Marian Ulbricht <ulbricht@innoroute.de>
> ---

... here, i.e after the "---" sign, so that "git am" doesn't pick up
the changelog in the final commit log.


> diff --git a/board/ultratronik/omap3_mws4/genimage.cfg b/board/ultratronik/omap3_mws4/genimage.cfg
> new file mode 100644
> index 0000000000..35817ea97e
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/genimage.cfg
> @@ -0,0 +1,48 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"uImage",
> +			"omap3-mws4.dtb",
> +			"u-boot.bin",
> +			"mlo",
> +			"u-boot-old.bin"

What is u-boot-old.bin, why do we need it?

> +		}
> +	}
> +	size = 16M
> +}
> +
> +
> +image flashdata.vfat {
> +	vfat {
> +		files = {
> +			"rootfs.ubi"
> +		}
> +	}
> +	size = 500M
> +}

Our defconfigs should be minimal, so this flashdata partition should
not be there.

> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +
> +

Too many empty new lines here.

> +	partition boot {
> +		partition-type = 0xc
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +		size = 500M
> +	}
> +	
> +	partition flashdata {
> +		partition-type = 0xc
> +		image = "flashdata.vfat"
> +	}
> +	
> +}
> +
> diff --git a/board/ultratronik/omap3_mws4/genimage.sh b/board/ultratronik/omap3_mws4/genimage.sh
> new file mode 100755
> index 0000000000..ec7c92d658
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/genimage.sh
> @@ -0,0 +1,5 @@
> +#!/bin/bash
> +wget https://github.com/InnoRoute/omap3_mws4/raw/main/mlo -O output/images/mlo
> +wget https://github.com/InnoRoute/omap3_mws4/raw/main/u-boot-old.bin -O output/images/u-boot-old.bin

This is not acceptable, we cannot have a post-image script download
stuff. Your defconfig is building U-Boot, so why do you need to
download MLO and u-boot-old.bin?

> +cp output/images/u-boot.img output/images/u-boot.bin

This seems weird. The normal boot process on OMAP3 expects MLO -> u-boot.img.

> +support/scripts/genimage.sh -c board/ultratronik/omap3_mws4/genimage.cfg
> diff --git a/board/ultratronik/omap3_mws4/kernel_defconfig.conf b/board/ultratronik/omap3_mws4/kernel_defconfig.conf
> new file mode 100644
> index 0000000000..98f2cd3b34
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/kernel_defconfig.conf

This file should be named linux.config

> @@ -0,0 +1,793 @@
> +CONFIG_COMPILE_TEST=y
> +CONFIG_KERNEL_LZMA=y
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_AUDIT=y
> +CONFIG_NO_HZ=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_LOG_BUF_SHIFT=16
> +CONFIG_CGROUPS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_RT_GROUP_SCHED=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_USB_SERIAL_CH341=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_CGROUP_PERF=y
> +CONFIG_NAMESPACES=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_USB_EHCI_HCD_OMAP=y
> +CONFIG_USB_OHCI_HCD_OMAP3=y
> +CONFIG_USB_OMAP=y
> +CONFIG_USB_SERIAL_CONSOLE=y
> +CONFIG_NAND_BOOT=y
> +CONFIG_USB_OTG_FSM=y
> +CONFIG_MUSB_PIO_ONLY=y
> +CONFIG_EXPERT=y
> +CONFIG_SLAB=y
> +CONFIG_PROFILING=y
> +CONFIG_ARCH_MULTI_V6=y
> +# CONFIG_OMAP_32K_TIMER is not set
> +CONFIG_ARCH_OMAP2=y
> +CONFIG_ARCH_OMAP3=y
> +CONFIG_ARCH_OMAP4=y
> +CONFIG_SOC_OMAP5=y
> +CONFIG_SOC_AM33XX=y
> +CONFIG_SOC_AM43XX=y
> +CONFIG_SOC_DRA7XX=y
> +CONFIG_ARM_THUMBEE=y
> +CONFIG_ARM_ERRATA_411920=y
> +CONFIG_SMP=y
> +CONFIG_NR_CPUS=2
> +CONFIG_DEPRECATED_PARAM_STRUCT=y
> +CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyS2,115200"
> +CONFIG_KEXEC=y
> +CONFIG_CPU_FREQ=y
> +CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> +CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> +CONFIG_CPU_FREQ_GOV_USERSPACE=y
> +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> +CONFIG_CPUFREQ_DT=m
> +# CONFIG_ARM_OMAP2PLUS_CPUFREQ is not set
> +CONFIG_CPU_IDLE=y
> +CONFIG_ARM_CPUIDLE=y
> +CONFIG_KERNEL_MODE_NEON=y
> +CONFIG_ARM_CRYPTO=y
> +CONFIG_CRYPTO_SHA1_ARM_NEON=m
> +CONFIG_CRYPTO_SHA256_ARM=m
> +CONFIG_CRYPTO_SHA512_ARM=m
> +CONFIG_CRYPTO_AES_ARM=m
> +CONFIG_CRYPTO_AES_ARM_BS=m
> +CONFIG_CRYPTO_GHASH_ARM_CE=m
> +CONFIG_CRYPTO_CHACHA20_NEON=m
> +CONFIG_OPROFILE=y
> +CONFIG_KPROBES=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_FORCE_LOAD=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_MODULE_FORCE_UNLOAD=y
> +CONFIG_MODVERSIONS=y
> +CONFIG_MODULE_SRCVERSION_ALL=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_BINFMT_MISC=y
> +CONFIG_CMA=y
> +CONFIG_ZSMALLOC=m
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_TLS=y
> +CONFIG_TLS_DEVICE=y
> +CONFIG_XFRM_USER=y
> +CONFIG_NET_KEY=y
> +CONFIG_NET_KEY_MIGRATE=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IP_PNP_RARP=y
> +CONFIG_NETFILTER=y
> +CONFIG_NETFILTER_NETLINK_ACCT=y
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_LOG_NETDEV=m
> +CONFIG_NF_CONNTRACK_ZONES=y
> +CONFIG_NF_CONNTRACK_EVENTS=y
> +CONFIG_NF_CONNTRACK_TIMEOUT=y
> +CONFIG_NF_CONNTRACK_TIMESTAMP=y
> +CONFIG_NF_CONNTRACK_AMANDA=m
> +CONFIG_NF_CONNTRACK_FTP=m
> +CONFIG_NF_CONNTRACK_H323=m
> +CONFIG_NF_CONNTRACK_IRC=m
> +CONFIG_NF_CONNTRACK_NETBIOS_NS=m
> +CONFIG_NF_CONNTRACK_SNMP=m
> +CONFIG_NF_CONNTRACK_PPTP=m
> +CONFIG_NF_CONNTRACK_SANE=m
> +CONFIG_NF_CONNTRACK_SIP=m
> +CONFIG_NF_CONNTRACK_TFTP=m
> +CONFIG_NF_CT_NETLINK=m
> +CONFIG_NF_CT_NETLINK_TIMEOUT=m
> +CONFIG_NF_CT_NETLINK_HELPER=m
> +CONFIG_NETFILTER_NETLINK_GLUE_CT=y
> +CONFIG_NF_TABLES=m
> +CONFIG_NF_TABLES_SET=m
> +CONFIG_NF_TABLES_INET=y
> +CONFIG_NF_TABLES_NETDEV=y
> +CONFIG_NFT_NUMGEN=m
> +CONFIG_NFT_CT=m
> +CONFIG_NFT_COUNTER=m
> +CONFIG_NFT_CONNLIMIT=m
> +CONFIG_NFT_LOG=m
> +CONFIG_NFT_LIMIT=m
> +CONFIG_NFT_MASQ=m
> +CONFIG_NFT_REDIR=m
> +CONFIG_NFT_NAT=m
> +CONFIG_NFT_TUNNEL=m
> +CONFIG_NFT_OBJREF=m
> +CONFIG_NFT_QUEUE=m
> +CONFIG_NFT_QUOTA=m
> +CONFIG_NFT_REJECT=m
> +CONFIG_NFT_COMPAT=m
> +CONFIG_NFT_HASH=m
> +CONFIG_NFT_XFRM=m
> +CONFIG_NFT_SOCKET=m
> +CONFIG_NFT_OSF=m
> +CONFIG_NFT_TPROXY=m
> +CONFIG_NFT_SYNPROXY=m
> +CONFIG_NFT_DUP_NETDEV=m
> +CONFIG_NFT_FWD_NETDEV=m
> +CONFIG_NF_FLOW_TABLE_INET=m
> +CONFIG_NF_FLOW_TABLE=m
> +CONFIG_NETFILTER_XTABLES=y
> +CONFIG_NETFILTER_XT_SET=m
> +CONFIG_NETFILTER_XT_TARGET_AUDIT=m
> +CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
> +CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
> +CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
> +CONFIG_NETFILTER_XT_TARGET_DSCP=m
> +CONFIG_NETFILTER_XT_TARGET_HMARK=m
> +CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
> +CONFIG_NETFILTER_XT_TARGET_LED=m
> +CONFIG_NETFILTER_XT_TARGET_LOG=m
> +CONFIG_NETFILTER_XT_TARGET_MARK=m
> +CONFIG_NETFILTER_XT_TARGET_NFLOG=m
> +CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
> +CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
> +CONFIG_NETFILTER_XT_TARGET_TEE=m
> +CONFIG_NETFILTER_XT_TARGET_TPROXY=m
> +CONFIG_NETFILTER_XT_TARGET_TRACE=m
> +CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
> +CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> +CONFIG_NETFILTER_XT_MATCH_BPF=m
> +CONFIG_NETFILTER_XT_MATCH_CGROUP=m
> +CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
> +CONFIG_NETFILTER_XT_MATCH_COMMENT=m
> +CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
> +CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
> +CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> +CONFIG_NETFILTER_XT_MATCH_CPU=m
> +CONFIG_NETFILTER_XT_MATCH_DCCP=m
> +CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
> +CONFIG_NETFILTER_XT_MATCH_DSCP=m
> +CONFIG_NETFILTER_XT_MATCH_ESP=m
> +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_HELPER=m
> +CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
> +CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
> +CONFIG_NETFILTER_XT_MATCH_IPVS=m
> +CONFIG_NETFILTER_XT_MATCH_L2TP=m
> +CONFIG_NETFILTER_XT_MATCH_LENGTH=m
> +CONFIG_NETFILTER_XT_MATCH_LIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_MAC=m
> +CONFIG_NETFILTER_XT_MATCH_MARK=m
> +CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
> +CONFIG_NETFILTER_XT_MATCH_NFACCT=m
> +CONFIG_NETFILTER_XT_MATCH_OSF=m
> +CONFIG_NETFILTER_XT_MATCH_OWNER=m
> +CONFIG_NETFILTER_XT_MATCH_POLICY=m
> +CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
> +CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
> +CONFIG_NETFILTER_XT_MATCH_QUOTA=m
> +CONFIG_NETFILTER_XT_MATCH_RATEEST=m
> +CONFIG_NETFILTER_XT_MATCH_REALM=m
> +CONFIG_NETFILTER_XT_MATCH_RECENT=m
> +CONFIG_NETFILTER_XT_MATCH_SCTP=m
> +CONFIG_NETFILTER_XT_MATCH_SOCKET=m
> +CONFIG_NETFILTER_XT_MATCH_STATE=m
> +CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
> +CONFIG_NETFILTER_XT_MATCH_STRING=m
> +CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
> +CONFIG_NETFILTER_XT_MATCH_TIME=m
> +CONFIG_NETFILTER_XT_MATCH_U32=m
> +CONFIG_IP_SET=m
> +CONFIG_IP_SET_BITMAP_IP=m
> +CONFIG_IP_SET_BITMAP_IPMAC=m
> +CONFIG_IP_SET_BITMAP_PORT=m
> +CONFIG_IP_SET_HASH_IP=m
> +CONFIG_IP_SET_HASH_IPMARK=m
> +CONFIG_IP_SET_HASH_IPPORT=m
> +CONFIG_IP_SET_HASH_IPPORTIP=m
> +CONFIG_IP_SET_HASH_IPPORTNET=m
> +CONFIG_IP_SET_HASH_IPMAC=m
> +CONFIG_IP_SET_HASH_MAC=m
> +CONFIG_IP_SET_HASH_NETPORTNET=m
> +CONFIG_IP_SET_HASH_NET=m
> +CONFIG_IP_SET_HASH_NETNET=m
> +CONFIG_IP_SET_HASH_NETPORT=m
> +CONFIG_IP_SET_HASH_NETIFACE=m
> +CONFIG_IP_SET_LIST_SET=m
> +CONFIG_IP_VS=m
> +CONFIG_NFT_DUP_IPV4=m
> +CONFIG_NFT_FIB_IPV4=m
> +CONFIG_NF_TABLES_ARP=y
> +CONFIG_NF_FLOW_TABLE_IPV4=m
> +CONFIG_NF_LOG_ARP=m
> +CONFIG_IP_NF_IPTABLES=m
> +CONFIG_IP_NF_MATCH_AH=m
> +CONFIG_IP_NF_MATCH_ECN=m
> +CONFIG_IP_NF_MATCH_RPFILTER=m
> +CONFIG_IP_NF_MATCH_TTL=m
> +CONFIG_IP_NF_FILTER=m
> +CONFIG_IP_NF_TARGET_REJECT=m
> +CONFIG_IP_NF_MANGLE=m
> +CONFIG_IP_NF_TARGET_ECN=m
> +CONFIG_IP_NF_TARGET_TTL=m
> +CONFIG_IP_NF_RAW=m
> +CONFIG_IP_NF_SECURITY=m
> +CONFIG_IP_NF_ARPTABLES=m
> +CONFIG_IP_NF_ARPFILTER=m
> +CONFIG_IP_NF_ARP_MANGLE=m
> +CONFIG_NF_TABLES_BRIDGE=m
> +CONFIG_NFT_BRIDGE_META=m
> +CONFIG_NFT_BRIDGE_REJECT=m
> +CONFIG_NF_LOG_BRIDGE=m
> +CONFIG_NF_CONNTRACK_BRIDGE=m
> +CONFIG_BRIDGE_NF_EBTABLES=m
> +CONFIG_BRIDGE=m
> +CONFIG_BRIDGE_VLAN_FILTERING=y
> +CONFIG_VLAN_8021Q=m
> +CONFIG_PHONET=m
> +CONFIG_NET_SCHED=y
> +CONFIG_NET_SCH_INGRESS=m
> +CONFIG_NET_CLS_U32=m
> +CONFIG_NET_CLS_FLOWER=m
> +CONFIG_NET_CLS_MATCHALL=m
> +CONFIG_NET_CLS_ACT=y
> +CONFIG_NET_ACT_POLICE=m
> +CONFIG_NET_ACT_GACT=m
> +CONFIG_NET_SWITCHDEV=y
> +CONFIG_CAN=m
> +CONFIG_CAN_C_CAN=m
> +CONFIG_CAN_C_CAN_PLATFORM=m
> +CONFIG_BT=m
> +CONFIG_BT_RFCOMM=m
> +CONFIG_BT_RFCOMM_TTY=y
> +CONFIG_BT_BNEP=m
> +CONFIG_BT_BNEP_MC_FILTER=y
> +CONFIG_BT_BNEP_PROTO_FILTER=y
> +CONFIG_BT_HIDP=m
> +CONFIG_BT_HCIBTUSB=m
> +CONFIG_BT_HCIBTSDIO=m
> +CONFIG_BT_HCIUART=m
> +CONFIG_BT_HCIUART_NOKIA=m
> +CONFIG_BT_HCIUART_BCSP=y
> +CONFIG_BT_HCIUART_LL=y
> +CONFIG_BT_HCIUART_3WIRE=y
> +CONFIG_BT_HCIUART_BCM=y
> +CONFIG_BT_HCIBCM203X=m
> +CONFIG_BT_HCIBPA10X=m
> +CONFIG_BT_HCIBFUSB=m
> +CONFIG_BT_HCIVHCI=m
> +CONFIG_BT_MRVL=m
> +CONFIG_BT_MRVL_SDIO=m
> +CONFIG_AF_RXRPC=m
> +CONFIG_RXKAD=y
> +CONFIG_CFG80211=m
> +CONFIG_MAC80211=m
> +CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_HOTPLUG_PCI_PCIE=y
> +CONFIG_PCI_MSI=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_PCI_DRA7XX_EP=y
> +CONFIG_PCI_ENDPOINT=y
> +CONFIG_PCI_ENDPOINT_CONFIGFS=y
> +CONFIG_PCI_EPF_TEST=m
> +CONFIG_UEVENT_HELPER=y
> +CONFIG_UEVENT_HELPER_PATH="/sbin/mdev"
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_DMA_FENCE_TRACE=y
> +CONFIG_OMAP_OCP2SCP=y
> +CONFIG_SIMPLE_PM_BUS=y
> +CONFIG_CONNECTOR=y
> +CONFIG_MTD=y
> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_NFTL=y
> +CONFIG_NFTL_RW=y
> +CONFIG_MTD_OOPS=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_CFI_ADV_OPTIONS=y
> +CONFIG_MTD_CFI_GEOMETRY=y
> +CONFIG_MTD_CFI_INTELEXT=y
> +CONFIG_MTD_PHYSMAP=y
> +CONFIG_MTD_PHYSMAP_OF=y
> +CONFIG_MTD_BLOCK2MTD=y
> +CONFIG_MTD_ONENAND=y
> +CONFIG_MTD_ONENAND_VERIFY_WRITE=y
> +CONFIG_MTD_ONENAND_OMAP2=y
> +CONFIG_MTD_RAW_NAND=y
> +CONFIG_MTD_NAND_ECC_SW_BCH=y
> +CONFIG_MTD_NAND_OMAP2=y
> +CONFIG_MTD_NAND_OMAP_BCH=y
> +CONFIG_MTD_SPI_NOR=m
> +CONFIG_MTD_UBI=y
> +CONFIG_UBIFS_FS_ADVANCED_COMPR=y
> +CONFIG_UBIFS_ATIME_SUPPORT=y
> +CONFIG_CRAMFS_MTD=y
> +CONFIG_CRYPTO_CRYPTD=m
> +CONFIG_CRYPTO_CBC=m
> +CONFIG_CRYPTO_MD5=m
> +CONFIG_CRYPTO_SHA512=m
> +CONFIG_CRYPTO_MD5=m
> +CONFIG_PARPORT=y
> +CONFIG_PARPORT_AX88796=y
> +CONFIG_ZRAM=m
> +CONFIG_ZRAM_WRITEBACK=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=16384
> +CONFIG_SENSORS_TSL2550=m
> +CONFIG_SRAM=y
> +CONFIG_PCI_ENDPOINT_TEST=m
> +CONFIG_EEPROM_AT24=m
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_CHR_DEV_SG=m
> +CONFIG_CHR_DEV_SCH=m
> +CONFIG_SCSI_CONSTANTS=y
> +CONFIG_SCSI_SCAN_ASYNC=y
> +CONFIG_SCSI_DH=y
> +CONFIG_SCSI_DH_RDAC=m
> +CONFIG_SCSI_DH_HP_SW=m
> +CONFIG_SCSI_DH_EMC=m
> +CONFIG_SCSI_DH_ALUA=m
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_AHCI_DM816=m
> +CONFIG_NETDEVICES=y
> +# CONFIG_NET_VENDOR_ARC is not set
> +# CONFIG_NET_VENDOR_BROADCOM is not set
> +# CONFIG_NET_VENDOR_CIRRUS is not set
> +CONFIG_AX88796DT=y
> +CONFIG_DM9000=y
> +# CONFIG_NET_VENDOR_FARADAY is not set
> +# CONFIG_NET_VENDOR_HISILICON is not set
> +# CONFIG_NET_VENDOR_INTEL is not set
> +# CONFIG_NET_VENDOR_MARVELL is not set
> +CONFIG_KS8851=y
> +CONFIG_KS8851_MLL=y
> +# CONFIG_NET_VENDOR_MICROCHIP is not set
> +CONFIG_NS83820=y
> +CONFIG_AX88796=y
> +CONFIG_AX88796_93CX6=y
> +CONFIG_NE2K_PCI=y
> +# CONFIG_NET_VENDOR_QUALCOMM is not set
> +# CONFIG_NET_VENDOR_SAMSUNG is not set
> +# CONFIG_NET_VENDOR_SEEQ is not set
> +CONFIG_SMC91X=y
> +CONFIG_SMSC911X=y
> +# CONFIG_NET_VENDOR_STMICRO is not set
> +CONFIG_TI_DAVINCI_EMAC=y
> +CONFIG_TI_CPSW=y
> +CONFIG_TI_CPTS=y
> +# CONFIG_NET_VENDOR_VIA is not set
> +# CONFIG_NET_VENDOR_WIZNET is not set
> +CONFIG_AX88796B_PHY=y
> +CONFIG_AT803X_PHY=y
> +CONFIG_DP83848_PHY=y
> +CONFIG_DP83867_PHY=y
> +CONFIG_MICREL_PHY=y
> +CONFIG_SMSC_PHY=y
> +CONFIG_PPP=m
> +CONFIG_PPP_BSDCOMP=m
> +CONFIG_PPP_DEFLATE=m
> +CONFIG_PPP_FILTER=y
> +CONFIG_PPP_MPPE=m
> +CONFIG_PPP_MULTILINK=y
> +CONFIG_PPPOE=m
> +CONFIG_PPP_ASYNC=m
> +CONFIG_PPP_SYNC_TTY=m
> +CONFIG_USB_USBNET=m
> +CONFIG_USB_NET_SMSC75XX=m
> +CONFIG_USB_NET_SMSC95XX=m
> +CONFIG_USB_ALI_M5632=y
> +CONFIG_USB_AN2720=y
> +CONFIG_USB_EPSON2888=y
> +CONFIG_USB_KC2190=y
> +CONFIG_USB_NET_QMI_WWAN=m
> +CONFIG_USB_CDC_PHONET=m
> +CONFIG_LIBERTAS=m
> +CONFIG_LIBERTAS_USB=m
> +CONFIG_LIBERTAS_SDIO=m
> +CONFIG_MWIFIEX=m
> +CONFIG_MWIFIEX_SDIO=m
> +CONFIG_MWIFIEX_USB=m
> +CONFIG_WL12XX=m
> +CONFIG_WL18XX=m
> +CONFIG_WLCORE_SPI=m
> +CONFIG_WLCORE_SDIO=m
> +CONFIG_INPUT_MATRIXKMAP=y
> +CONFIG_INPUT_MOUSEDEV=m
> +CONFIG_INPUT_JOYDEV=m
> +CONFIG_INPUT_EVDEV=m
> +CONFIG_KEYBOARD_ATKBD=m
> +CONFIG_KEYBOARD_GPIO=m
> +CONFIG_KEYBOARD_MATRIX=m
> +CONFIG_KEYBOARD_OMAP4=m
> +# CONFIG_INPUT_MOUSE is not set
> +CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_ADS7846=m
> +CONFIG_TOUCHSCREEN_ATMEL_MXT=m
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=m
> +CONFIG_TOUCHSCREEN_TI_AM335X_TSC=m
> +CONFIG_TOUCHSCREEN_PIXCIR=m
> +CONFIG_TOUCHSCREEN_TSC2004=m
> +CONFIG_TOUCHSCREEN_TSC2005=m
> +CONFIG_TOUCHSCREEN_TSC2007=m
> +CONFIG_INPUT_MISC=y
> +CONFIG_INPUT_CPCAP_PWRBUTTON=m
> +CONFIG_INPUT_TPS65218_PWRBUTTON=m
> +CONFIG_INPUT_TWL4030_PWRBUTTON=y
> +CONFIG_INPUT_TWL4030_VIBRA=y
> +CONFIG_INPUT_UINPUT=m
> +CONFIG_INPUT_PALMAS_PWRBUTTON=m
> +CONFIG_INPUT_PWM_VIBRA=m
> +CONFIG_SERIO=m
> +# CONFIG_LEGACY_PTYS is not set
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_NR_UARTS=32
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=6
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_MANY_PORTS=y
> +CONFIG_SERIAL_8250_SHARE_IRQ=y
> +CONFIG_SERIAL_8250_DETECT_IRQ=y
> +CONFIG_SERIAL_8250_RSA=y
> +CONFIG_SERIAL_8250_OMAP=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_OMAP=y
> +CONFIG_SERIAL_OMAP_CONSOLE=y
> +CONFIG_SERIAL_DEV_BUS=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MUX=y
> +CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> +CONFIG_I2C_MUX_GPIO=y
> +CONFIG_I2C_MUX_GPMUX=y
> +CONFIG_SPI=y
> +CONFIG_SPI_OMAP24XX=y
> +CONFIG_SPI_TI_QSPI=m
> +CONFIG_PINCTRL_SINGLE=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_HTC_EGPIO=y
> +CONFIG_GPIO_LP873X=m
> +CONFIG_GPIO_LP87565=y
> +CONFIG_GPIO_PALMAS=y
> +CONFIG_GPIO_TPS65218=m
> +CONFIG_GPIO_TPS65910=y
> +CONFIG_GPIO_TQMX86=m
> +CONFIG_GPIO_TWL4030=y
> +CONFIG_GPIO_TWL6040=m
> +CONFIG_GPIO_MOCKUP=y
> +CONFIG_W1=m
> +CONFIG_W1_MASTER_GPIO=m
> +CONFIG_HDQ_MASTER_OMAP=m
> +CONFIG_W1_SLAVE_DS250X=m
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_GPIO=y
> +CONFIG_POWER_SUPPLY=y
> +CONFIG_BATTERY_TWL4030_MADC=m
> +CONFIG_CHARGER_TWL4030=m
> +CONFIG_SENSORS_GPIO_FAN=m
> +CONFIG_SENSORS_LM75=m
> +CONFIG_SENSORS_TMP102=m
> +CONFIG_THERMAL_GOV_FAIR_SHARE=y
> +CONFIG_THERMAL_GOV_USER_SPACE=y
> +CONFIG_CPU_THERMAL=y
> +CONFIG_TI_THERMAL=y
> +CONFIG_OMAP4_THERMAL=y
> +CONFIG_OMAP5_THERMAL=y
> +CONFIG_DRA752_THERMAL=y
> +CONFIG_WATCHDOG=y
> +CONFIG_WATCHDOG_CORE=y
> +CONFIG_WATCHDOG_SYSFS=y
> +CONFIG_GPIO_WATCHDOG=m
> +# CONFIG_SIRFSOC_WATCHDOG is not set
> +CONFIG_MFD_CPCAP=y
> +# CONFIG_ABX500_CORE is not set
> +CONFIG_MFD_TI_AM335X_TSCADC=m
> +CONFIG_MFD_TI_LMU=m
> +CONFIG_MFD_PALMAS=y
> +CONFIG_MFD_TPS65217=y
> +CONFIG_MFD_TI_LP873X=y
> +CONFIG_MFD_TI_LP87565=y
> +CONFIG_MFD_TPS65218=y
> +CONFIG_MFD_TPS65910=y
> +CONFIG_TWL6040_CORE=y
> +CONFIG_REGULATOR_CPCAP=y
> +CONFIG_REGULATOR_GPIO=y
> +CONFIG_REGULATOR_LM363X=m
> +CONFIG_REGULATOR_LP872X=y
> +CONFIG_REGULATOR_LP873X=y
> +CONFIG_REGULATOR_LP87565=y
> +CONFIG_REGULATOR_PALMAS=y
> +CONFIG_REGULATOR_PBIAS=y
> +CONFIG_REGULATOR_TI_ABB=y
> +CONFIG_REGULATOR_TPS62360=m
> +CONFIG_REGULATOR_TPS65023=y
> +CONFIG_REGULATOR_TPS6507X=y
> +CONFIG_REGULATOR_TPS65217=y
> +CONFIG_REGULATOR_TPS65218=y
> +CONFIG_REGULATOR_TPS65910=y
> +CONFIG_REGULATOR_TWL4030=y
> +CONFIG_RC_CORE=m
> +CONFIG_LIRC=y
> +CONFIG_RC_DEVICES=y
> +CONFIG_IR_SPI=m
> +CONFIG_IR_RX51=m
> +CONFIG_IR_GPIO_TX=m
> +CONFIG_IR_PWM_TX=m
> +CONFIG_MEDIA_SUPPORT=m
> +CONFIG_DRM=m
> +CONFIG_DRM_OMAP=m
> +CONFIG_OMAP5_DSS_HDMI=y
> +CONFIG_OMAP2_DSS_SDI=y
> +CONFIG_OMAP2_DSS_DSI=y
> +CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> +CONFIG_DRM_TILCDC=m
> +CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_PANEL_LG_LB035Q02=m
> +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
> +CONFIG_DRM_TI_TFP410=m
> +CONFIG_FB=y
> +CONFIG_FIRMWARE_EDID=y
> +CONFIG_FB_MODE_HELPERS=y
> +CONFIG_FB_TILEBLITTING=y
> +CONFIG_LCD_CLASS_DEVICE=y
> +CONFIG_LCD_PLATFORM=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> +CONFIG_BACKLIGHT_PWM=m
> +CONFIG_BACKLIGHT_PANDORA=m
> +CONFIG_BACKLIGHT_GPIO=m
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> +CONFIG_LOGO=y
> +CONFIG_SOUND=m
> +CONFIG_SND=m
> +CONFIG_SND_OSSEMUL=y
> +CONFIG_SND_MIXER_OSS=m
> +CONFIG_SND_PCM_OSS=m
> +CONFIG_SND_VERBOSE_PRINTK=y
> +CONFIG_SND_USB_AUDIO=m
> +CONFIG_SND_SOC=m
> +CONFIG_SND_SOC_DAVINCI_MCASP=m
> +CONFIG_SND_SOC_NOKIA_RX51=m
> +CONFIG_SND_SOC_OMAP3_PANDORA=m
> +CONFIG_SND_SOC_OMAP3_TWL4030=m
> +CONFIG_SND_SOC_OMAP_ABE_TWL6040=m
> +CONFIG_SND_SOC_OMAP_HDMI=m
> +CONFIG_SND_SOC_CPCAP=m
> +CONFIG_SND_SOC_TLV320AIC23_I2C=m
> +CONFIG_SND_SIMPLE_CARD=m
> +CONFIG_SND_AUDIO_GRAPH_CARD=m
> +CONFIG_HID_GENERIC=m
> +CONFIG_USB_HIDDEV=y
> +CONFIG_USB_KBD=m
> +CONFIG_USB_MOUSE=m
> +CONFIG_USB_LED_TRIG=y
> +CONFIG_USB_ULPI_BUS=m
> +CONFIG_USB_CONN_GPIO=m
> +CONFIG_USB=m
> +# CONFIG_USB_PCI is not set
> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> +CONFIG_USB_DYNAMIC_MINORS=y
> +CONFIG_USB_OTG=y
> +CONFIG_USB_OTG_FSM=m
> +CONFIG_USB_LEDS_TRIGGER_USBPORT=m
> +CONFIG_USB_MON=m
> +CONFIG_USB_EHCI_HCD=m
> +CONFIG_USB_EHCI_FSL=m
> +CONFIG_USB_EHCI_HCD_NPCM7XX=m
> +# CONFIG_USB_EHCI_HCD_OMAP is not set
> +CONFIG_USB_OXU210HP_HCD=m
> +CONFIG_USB_ISP116X_HCD=m
> +CONFIG_USB_ISP1362_HCD=m
> +CONFIG_USB_FOTG210_HCD=m
> +CONFIG_USB_MAX3421_HCD=m
> +CONFIG_USB_OHCI_HCD=m
> +# CONFIG_USB_OHCI_HCD_OMAP3 is not set
> +CONFIG_USB_SL811_HCD=m
> +CONFIG_USB_SL811_HCD_ISO=y
> +CONFIG_USB_R8A66597_HCD=m
> +CONFIG_USB_RENESAS_USBHS_HCD=m
> +CONFIG_USB_RENESAS_USBHS=m
> +CONFIG_USB_TMC=m
> +CONFIG_USB_STORAGE=m
> +CONFIG_USB_UAS=m
> +CONFIG_USB_MUSB_HDRC=m
> +CONFIG_USB_MUSB_HOST=y
> +CONFIG_USB_MUSB_TUSB6010=m
> +CONFIG_USB_MUSB_OMAP2PLUS=m
> +CONFIG_USB_MUSB_AM35X=m
> +CONFIG_USB_MUSB_DSPS=m
> +CONFIG_USB_MUSB_UX500=m
> +CONFIG_USB_INVENTRA_DMA=y
> +CONFIG_USB_TI_CPPI41_DMA=y
> +CONFIG_USB_TUSB_OMAP_DMA=y
> +CONFIG_USB_USS720=m
> +CONFIG_USB_SERIAL=m
> +CONFIG_USB_SERIAL_GENERIC=y
> +CONFIG_USB_SERIAL_SIMPLE=m
> +CONFIG_USB_SERIAL_CP210X=m
> +CONFIG_USB_SERIAL_FTDI_SIO=m
> +CONFIG_USB_SERIAL_PL2303=m
> +CONFIG_USB_SERIAL_OPTION=m
> +CONFIG_USB_LD=m
> +CONFIG_USB_TEST=m
> +CONFIG_USB_EZUSB_FX2=m
> +CONFIG_USB_HUB_USB251XB=m
> +CONFIG_USB_HSIC_USB3503=m
> +CONFIG_USB_HSIC_USB4604=m
> +CONFIG_NOP_USB_XCEIV=m
> +CONFIG_TWL6030_USB=m
> +CONFIG_USB_GPIO_VBUS=m
> +CONFIG_USB_ISP1301=m
> +CONFIG_USB_ULPI=y
> +CONFIG_USB_GADGET=m
> +CONFIG_USB_CONFIGFS=m
> +CONFIG_USB_CONFIGFS_SERIAL=y
> +CONFIG_USB_CONFIGFS_ACM=y
> +CONFIG_USB_CONFIGFS_OBEX=y
> +CONFIG_USB_CONFIGFS_NCM=y
> +CONFIG_USB_CONFIGFS_ECM=y
> +CONFIG_USB_CONFIGFS_ECM_SUBSET=y
> +CONFIG_USB_CONFIGFS_RNDIS=y
> +CONFIG_USB_CONFIGFS_EEM=y
> +CONFIG_USB_CONFIGFS_PHONET=y
> +CONFIG_USB_CONFIGFS_MASS_STORAGE=y
> +CONFIG_USB_CONFIGFS_F_LB_SS=y
> +CONFIG_USB_CONFIGFS_F_FS=y
> +CONFIG_USB_CONFIGFS_F_UAC1=y
> +CONFIG_USB_CONFIGFS_F_UAC2=y
> +CONFIG_USB_CONFIGFS_F_MIDI=y
> +CONFIG_USB_CONFIGFS_F_HID=y
> +CONFIG_USB_ZERO=m
> +CONFIG_USB_G_NOKIA=m
> +CONFIG_MMC=y
> +CONFIG_SDIO_UART=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_OMAP=y
> +CONFIG_MMC_OMAP_HS=y
> +CONFIG_MMC_TIFM_SD=y
> +CONFIG_MMC_SPI=y
> +CONFIG_MMC_SDHCI_OMAP=y
> +CONFIG_MMC_SDHCI_AM654=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=m
> +CONFIG_LEDS_CPCAP=m
> +CONFIG_LEDS_LM3532=m
> +CONFIG_LEDS_GPIO=m
> +CONFIG_LEDS_PCA963X=m
> +CONFIG_LEDS_PWM=m
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_TIMER=m
> +CONFIG_LEDS_TRIGGER_ONESHOT=m
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=m
> +CONFIG_LEDS_TRIGGER_BACKLIGHT=m
> +CONFIG_LEDS_TRIGGER_CPU=y
> +CONFIG_LEDS_TRIGGER_GPIO=m
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_DS1307=m
> +CONFIG_RTC_DRV_PCF8523=m
> +CONFIG_RTC_DRV_PCF8563=m
> +CONFIG_RTC_DRV_M41T80=m
> +CONFIG_RTC_DRV_TWL92330=y
> +CONFIG_RTC_DRV_PALMAS=m
> +CONFIG_RTC_DRV_OMAP=m
> +CONFIG_RTC_DRV_CPCAP=m
> +CONFIG_DMADEVICES=y
> +CONFIG_TI_CPPI41=y
> +CONFIG_COMMON_CLK_CDCE706=y
> +CONFIG_COMMON_CLK_CDCE925=y
> +CONFIG_CLK_TWL6040=m
> +CONFIG_COMMON_CLK_PALMAS=m
> +CONFIG_OMAP_IOMMU=y
> +CONFIG_REMOTEPROC=y
> +CONFIG_OMAP_REMOTEPROC=m
> +CONFIG_WKUP_M3_RPROC=m
> +CONFIG_SOC_TI=y
> +CONFIG_AMX3_PM=m
> +CONFIG_WKUP_M3_IPC=m
> +CONFIG_EXTCON_PALMAS=m
> +CONFIG_EXTCON_USB_GPIO=m
> +CONFIG_TI_EMIF=m
> +CONFIG_TI_EMIF_SRAM=m
> +CONFIG_IIO=m
> +CONFIG_IIO_SW_DEVICE=m
> +CONFIG_IIO_SW_TRIGGER=m
> +CONFIG_IIO_ST_ACCEL_3AXIS=m
> +CONFIG_CPCAP_ADC=m
> +CONFIG_INA2XX_ADC=m
> +CONFIG_TI_AM335X_ADC=m
> +CONFIG_TWL4030_MADC=m
> +CONFIG_SENSORS_ISL29028=m
> +CONFIG_BMP280=m
> +CONFIG_PWM=y
> +CONFIG_PWM_OMAP_DMTIMER=m
> +CONFIG_PWM_TIECAP=m
> +CONFIG_PWM_TIEHRPWM=m
> +CONFIG_PWM_TWL=y
> +CONFIG_PWM_TWL_LED=y
> +CONFIG_PHY_CPCAP_USB=m
> +CONFIG_PHY_MAPPHONE_MDM6600=m
> +CONFIG_PHY_ATH79_USB=m
> +CONFIG_PHY_DM816X_USB=m
> +CONFIG_OMAP_USB2=y
> +CONFIG_TI_PIPE3=y
> +CONFIG_TWL4030_USB=m
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT4_FS_SECURITY=y
> +CONFIG_FANOTIFY=y
> +CONFIG_QUOTA=y
> +CONFIG_QFMT_V2=y
> +CONFIG_AUTOFS4_FS=m
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_UBIFS_FS=y
> +CONFIG_CRAMFS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3_ACL=y
> +CONFIG_NFS_V4=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_SECURITY=y
> +CONFIG_CRYPTO_MICHAEL_MIC=y
> +CONFIG_CRYPTO_DEV_OMAP=m
> +CONFIG_CRYPTO_DEV_OMAP_SHAM=m
> +CONFIG_CRYPTO_DEV_OMAP_AES=m
> +CONFIG_CRYPTO_DEV_OMAP_DES=m
> +CONFIG_CRC_CCITT=y
> +CONFIG_CRC_T10DIF=y
> +CONFIG_LIBCRC32C=y
> +CONFIG_DMA_CMA=y
> +CONFIG_FONTS=y
> +CONFIG_FONT_8x8=y
> +CONFIG_FONT_8x16=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_BOOT_PRINTK_DELAY=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_SCHEDSTATS=y
> +CONFIG_MEMTEST=y
> +CONFIG_EARLY_PRINTK=y

Could you strip it down? It seems like a *lot* of features are not
really relevant.

> diff --git a/board/ultratronik/omap3_mws4/kernel_patches/mws4.patch b/board/ultratronik/omap3_mws4/kernel_patches/mws4.patch
> new file mode 100644
> index 0000000000..9d8bc1e175
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/kernel_patches/mws4.patch

Has this been submitted to the upstream Linux kernel? We prefer to not
have to carry this patch forever in Buildroot.


> +diff --git a/drivers/net/ethernet/asix/ax88796_dt.c b/drivers/net/ethernet/asix/ax88796_dt.c
> +new file mode 100644
> +index 000000000000..048c8aa1feda
> +--- /dev/null
> ++++ b/drivers/net/ethernet/asix/ax88796_dt.c
> +@@ -0,0 +1,193 @@
> ++// devicetree driver for ax88796 platform device
> ++// ulbricht@innoroute.de 2021

This needs to be submitted to the upstream Linux kernel. You will get
lots of feedback explaining that this driver is not correct, I'm afraid.

> ++// GPLv3

GPLv3 is incompatible with the GPLv2-only license of the Linux kernel
unfortunately.


> diff --git a/board/ultratronik/omap3_mws4/overlay-base/etc/network/interfaces b/board/ultratronik/omap3_mws4/overlay-base/etc/network/interfaces
> new file mode 100644
> index 0000000000..ddd3defe73
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/overlay-base/etc/network/interfaces
> @@ -0,0 +1,8 @@
> +# Configure Loopback
> +auto lo
> +iface lo inet loopback
> +
> +auto eth0
> +allow-hotplug eth0
> +iface eth0 inet dhcp

Not needed, Buildroot option BR2_SYSTEM_DHCP="eth0" allows to achieve
the same.

> diff --git a/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/GPIO_init.sh b/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/GPIO_init.sh
> new file mode 100755
> index 0000000000..303d73fb75
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/GPIO_init.sh

We generally don't want this sort of product-specific script in
Buildroot.

> diff --git a/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/flash_ubi.sh b/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/flash_ubi.sh
> new file mode 100755
> index 0000000000..79f5e0af72
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/overlay-base/usr/mws4/flash_ubi.sh

Same comment.

> @@ -0,0 +1,6 @@
> +#!/bin/bash
> +mkdir /mnt/flash
> +mount /dev/mmcblk0p3 /mnt/flash/
> +flash_erase /dev/mtd5 0 0
> +nandwrite -p /dev/mtd5 /mnt/flash/rootfs.ubi
> +echo "done"
> diff --git a/board/ultratronik/omap3_mws4/patches/uboot/uboot-2022.04-mws4.patch b/board/ultratronik/omap3_mws4/patches/uboot/uboot-2022.04-mws4.patch
> new file mode 100644
> index 0000000000..d2b55ebd0e
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/patches/uboot/uboot-2022.04-mws4.patch

Has this been submitted to upstream U-Boot? Just like for the Linux
kernel, we very much prefer not to keep such large board-specific
patches in Buildroot.


> diff --git a/board/ultratronik/omap3_mws4/readme.txt b/board/ultratronik/omap3_mws4/readme.txt
> new file mode 100644
> index 0000000000..10a2da5352
> --- /dev/null
> +++ b/board/ultratronik/omap3_mws4/readme.txt

Please take example on other readme.txt files in the Buildroot tree on
how to write your readme.txt.

> +## Boot instructions
> +* the system is always able to boot from sd-card, if SD-boot jumper is set and uboot uses its default envoronment (reset with ```env default -a; saveenv```) 

typo: environment

> +* note: if booting from flash(no jumper set), the bootloader can't access the SD-card
> +* the boot-jumper just effects the location, the bootloader is loaded from, the kernel location is selected by the boot commands below

effects -> affects

> +* todo for successfull nand-boot: upgrade bootloader, load kernel in flash, load root-fs in flash (follow the insctructions below)
> +### Upgrade bootloader
> +* To boot from nand-flash, the bootload needs an update to load the new kernel
> +* mount first partition of sdcard
> +* rename u-boot.bin -> u-boot-new.bin
> +* rename u-boot-old.bin -> u-boot.bin

Why this dance between u-boot-new and u-boot-old? One is for NAND flash
booting, and the other for SD card booting?

I'd say we normally try to support only one case: either SD or NAND,
and not a frankenstein config that tries to support both.


> diff --git a/configs/mws4_defconfig b/configs/mws4_defconfig
> new file mode 100644
> index 0000000000..4e560ff95a
> --- /dev/null
> +++ b/configs/mws4_defconfig
> @@ -0,0 +1,142 @@
> +BR2_arm=y
> +BR2_cortex_a8=y
> +BR2_GLOBAL_PATCH_DIR="board/ultratronik/omap3_mws4/patches"
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Please keep the default C library.

> +BR2_KERNEL_HEADERS_5_4=y

Please use the option "headers same as kernel".

Overall, your defconfig should be minimal: no extra packages other than
Busybox, Linux and U-Boot.

> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES=y
> +BR2_ROOTFS_MERGED_USR=y
> +BR2_SYSTEM_BIN_SH_BASH=y
> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> +BR2_TARGET_TZ_INFO=y
> +BR2_ROOTFS_OVERLAY="board/ultratronik/omap3_mws4/overlay-base"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ultratronik/omap3_mws4/genimage.sh"
> +BR2_LINUX_KERNEL=y
> +# BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +# BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git@github.com:InnoRoute/linux-1.git"
> +# BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dev"
> +BR2_LINUX_KERNEL_DEFCONFIG="omap3_mws4"
> +# BR2_LINUX_KERNEL_LATEST_VERSION is not set
> +# BR2_LINUX_KERNEL_LATEST_CIP_VERSION is not set
> +# BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION is not set
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
> +# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
> +# BR2_LINUX_KERNEL_CUSTOM_HG is not set
> +# BR2_LINUX_KERNEL_CUSTOM_SVN is not set

Many of these "is not set" are useless. Did you use "make
savedefconfig" to generate the defconfig?

> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.4-rc8"
> +BR2_LINUX_KERNEL_VERSION="v5.4-rc8"
> +BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/board/ultratronik/omap3_mws4/kernel_patches"

Not needed if you use BR2_GLOBAL_PATCH_DIR.


> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap3_mws4"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y

You need to specify an explicit and fixed version of U-Boot.

That's it for this review!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
