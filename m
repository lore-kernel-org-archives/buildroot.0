Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B31C36014
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EBE960690;
	Mon, 31 Mar 2025 21:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NttFQbj6cqM; Mon, 31 Mar 2025 21:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 673D0607CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 673D0607CC;
	Mon, 31 Mar 2025 21:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D369CD8E
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8952607CC
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 21:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHsRU7dORkbR for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 21:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A3D660690
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3D660690
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A3D660690
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 21:11:52 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:a59d:d797:7d27:3ff9])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 568B32003C1;
 Mon, 31 Mar 2025 23:11:42 +0200 (CEST)
Date: Mon, 31 Mar 2025 23:11:41 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
 <20250331103956.tdwjd3xl7jaihse7@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331103956.tdwjd3xl7jaihse7@skbuf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743455510;
 bh=6B8oC0Msbs6+5/mm2OwhVdqjBhw9iF5LLdC7N53/e6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eszu70pS+slkgaOGDHHqtW9ttcqWvn1DbpgnKePaIwzmXXOkIQAHp/Ioacpasl59d
 AR/IWyLdmLgi2bJ2x98F3L9MqoT+ifFGwEk/Zzj5f3n5kYbyN7C+rM65EFYWKicUah
 /B+I8oy3xa8V6AzNw2ypeacZX60GgCZRNvaUW9KQuo2H9AGyDOfhCEeVeUyQniLYA2
 WjeTrx/9EM5NIMofRE4EAJzR5ba7wonQQogoB+v+E+wim8q9OfC4Ig/0g9Vrfm3KF/
 x3bbuVSQTKY4rbxLYT0oNK6Mo5igAuMjbuF9AeRvLnm0q4ymtyQMwJG6uR98WkM+ot
 ixYrlBMkw2cMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eszu70pS
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On Mon, Mar 31, 2025 at 01:39:56PM +0100, Vladimir Oltean wrote:
> Hi Vincent,
> 
> On Sat, Mar 29, 2025 at 03:09:30AM +0100, Vincent Jardin wrote:
> > > +++ b/board/freescale/lx2160ardb/genimage.cfg
> > > @@ -0,0 +1,47 @@
> > > +image sdcard.img {
> > 
> > Those offsets for a sdcard are valide, but when they are used for a SD
> > card, the documentation seems to recommend the usage with Block# while
> > the offset is rather for the Flash. 
> > 
> > https://github.com/NXP/flexbuild/blob/main/docs/memory_layout.txt
> > 
> > I believe that matters in order to keep it reasily readable/reviewable
> > from the documentation. Moreover, it matters for the ucode because:
> > #ifdef CONFIG_SD_BOOT
> > #define IN112525_FW_ADDR        0x980000
> > #else
> > #define IN112525_FW_ADDR        0x20980000
> > #endif
> > #define IN112525_FW_LENGTH      0x40000
> > 
> > which by the way seems to be a mistake from the NXP documentation:
> >  |Ethernet PHY firmware        | 256KB   | 0x00980000   | 0x04C00         |
> > 
> > printf "%x" $(( $(printf "%d" 0x04C00 ) * 512 ))
> > 0x980000
> 
> What's the problem and your recommendation? I don't understand.
> The genimage "offset" is in bytes, see https://github.com/pengutronix/genimage.

I should not do any review so late ;) right, there is no problem.

Your genimage are offset in bytes, which is valid, NXP documentation was
recommending offset in block count, but both are the same.

My confusions, no problem.

> > > +sha256  2751fcd3eb9080c34531f68ca2e1f571a60f4220853df53a5ebed9835abf8c13  atf-lf-6.12.3-1.0.0.tar.gz
> > 
> > Why not using the upstream ATF ? The more we use some vendor branches,
> > the less we get from the updates of the upstreams such as CVEs.
> 
> Answering here generally for all NXP components: the reason is pragmatic.
> The LX2160A-RDB is a board officially supported by the NXP BSP, any bug
> in these components is the direct responsibility of NXP to fix, and not
> mine as an individual integrator with limited free time. Additionally,
> the BSP provides the most feature-complete experience for this board.
> Upstreaming is desirable and is also in the best interest of NXP
> engineers, but development constraints are such that not all features
> are upstream.
> 
> This doesn't have to be the case for custom boards based on the LX2160A,
> and anybody is free to maintain software based on upstream, but for the
> RDB, I don't see why not.
> 
> I don't know if you are talking about any specific CVE for ATF, but the
> Linux Factory process does track upstream and periodically rebase. An
> argument can perhaps be made about the pace of updates, but the trees
> are not disconnected from upstream.

Just because I'd do support an upstream first instead of a NXP first.
The purpose of an upstream first is to make sure that any other boards,
including RDB, Silicom, etc... are all based on a same build
infrastructure instead of a respective "fork".

Then, yes CVE is a topic because it means that only 1 mainstream of SBOM
has to be handled.

Of course, I do understand NXP willingness to control theirs, but here
it is about Buildroot, not NXP's Flexbuild. I'd like to read the views
of Buildroot's maintainers since I am a novice with Buildroot.

> > Does it really make sense to follow NXP's documentation ?
> 
> I don't understand this question?

I meant: use lf instead of mainstreams.

> > > +++ b/board/freescale/lx2160ardb/readme.txt
> > > @@ -0,0 +1,124 @@
> > > +The components from NXP are:
> > > +  - rcw, lf-6.12.3-1.0.0
> > > +  - atf (fork), lf-6.12.3-1.0.0
> > > +  - uboot (fork), lf-6.12.3-1.0.0
> > > +  - cadence-dp-firmware (blob), lf-6.12.3-1.0.0
> > 
> > Which cadence blob is used ? From the output/images, you do not have any
> > references.
> 
> It is a mistake, I took the README from the LS1028A-RDB and adapted it,
> there is no Cadence DisplayPort firmware, this line should be removed.

ok, thanks

> > > +++ b/board/freescale/lx2160ardb/uboot-env.txt
> > > @@ -0,0 +1,77 @@
> > > +BOARD=lx2160ardb
> > > +arch=arm
> > > +baudrate=115200
> > > +board=lx2160a
> > > +board_name=lx2160a
> > > +boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; env exists secureboot && load ${devtype} ${devnum}:${distro_bootpart} ${scripthdraddr} ${prefix}${boot_script_hdr} && esbc_validate ${scripthdraddr};source ${scriptaddr}
> > > +boot_efi_binary=load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} efi/boot/bootaa64.efi; if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r};else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi
> > > +boot_efi_bootmgr=if fdt addr -q ${fdt_addr_r}; then bootefi bootmgr ${fdt_addr_r};else bootefi bootmgr;fi
> > > +boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}${boot_syslinux_conf}
> > > +boot_net_usb_start=usb start
> > > +boot_pci_enum=pci enum
> > > +boot_prefixes=/ /boot/
> > > +boot_script_dhcp=boot.scr.uimg
> > > +boot_script_hdr=hdr_lx2160ardb_bs.out
> > > +boot_scripts=lx2160ardb_boot.scr
> > > +boot_syslinux_conf=extlinux/extlinux.conf
> > > +boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
> > > +bootargs=console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf
> > > +bootcmd=run distro_bootcmd
> > > +bootcmd_dhcp=devtype=dhcp; run boot_net_usb_start; run boot_pci_enum; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi;setenv efi_fdtfile ${fdtfile}; setenv efi_old_vci ${bootp_vci};setenv efi_old_arch ${bootp_arch};setenv bootp_vci PXEClient:Arch:00011:UNDI:003000;setenv bootp_arch 0xb;if dhcp ${kernel_addr_r}; then tftpboot ${fdt_addr_r} dtb/${efi_fdtfile};if fdt addr -q ${fdt_addr_r}; then bootefi ${kernel_addr_r} ${fdt_addr_r}; else bootefi ${kernel_addr_r} ${fdtcontroladdr};fi;fi;setenv bootp_vci ${efi_old_vci};setenv bootp_arch ${efi_old_arch};setenv efi_fdtfile;setenv efi_old_arch;setenv efi_old_vci;
> > > +bootcmd_mmc0=devnum=0; run mmc_boot
> > > +bootcmd_mmc1=devnum=1; run mmc_boot
> > > +bootcmd_scsi0=devnum=0; run scsi_boot
> > > +bootcmd_usb0=devnum=0; run usb_boot
> > > +bootdelay=10
> > > +console=ttyAMA0,38400n8
> > 
> > Is it on will ? Shouldn't it be 115200 ?
> 
> This is from "env default -a". It seems unused - bootargs sets a
> different (and correct) "console" variable.

OK, it was confusing.

> > It is a quite complex uboot env. Are they really needed ? Can't you
> > minimize it since with Buildroot we should start from the small version
> > ?, moreover a small env would better match the specific use case of running
> > with the SD card you described ?
> 
> The idea is, as explained in configs/lx2160ardb_defconfig, that this is:
> # Obtained from "env default -a" plus a custom mcinitcmd
> Perhaps this is not the most maintainable way, but I wanted to patch the
> existing default environment, and the only way I saw how to do that was
> to copy it in its entirety.

OK, I feel that small if beautiful: same, let's check the feedbacks of
some Buildroot's maintainers.

Thanks Vladimir. Except this minor comment on Cadence DP, I hope that most of
your serie can be merged asap.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
