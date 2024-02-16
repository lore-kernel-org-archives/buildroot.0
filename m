Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB3C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D3C6081A;
	Fri, 16 Feb 2024 20:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lO-FcV8MrpHH; Fri, 16 Feb 2024 20:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604F160853
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604F160853;
	Fri, 16 Feb 2024 20:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70811BF300
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D04344200B
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvU2V-Bg89fN for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 20:13:03 +0000 (UTC)
X-Greylist: delayed 387 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 Feb 2024 20:13:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4895B41FFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4895B41FFD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4895B41FFD
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 20:13:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GKD2bZ085447;
 Fri, 16 Feb 2024 14:13:02 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GKD2Up000308
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Feb 2024 14:13:02 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 14:13:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 14:13:01 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GKD1kq116703;
 Fri, 16 Feb 2024 14:13:01 -0600
Date: Fri, 16 Feb 2024 14:13:01 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240216201301.ftcjsjgepmcvd3pm@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <11856419bb18257086aaf4c5b45663cdae1292cc.camel@gmail.com>
 <63114771-4fb0-4b6f-bdac-e4363b4e9e52@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63114771-4fb0-4b6f-bdac-e4363b4e9e52@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708114382;
 bh=xzyT3sIq+MBTbChls5OyNyWKp025fxCF0ggeVDevL/w=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=AffCCJdGFvptTlON9Wv4HtymPJ45CXhfxTHI5v9L0v+i7oZfQE/rZXABRSklulJjz
 4Et1W3aBS033cgREuejGmYKshFSRDKk3lv5QIuTyYSBEhS8zVRfZSv/Lqgxug1nYQA
 MKHC3kWQqxISSUM8vVwygndVPMcLSgq7JPyJxaiE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=AffCCJdG
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 15, 2024 at 12:23:21PM +0100, Romain Naour wrote:
> Hi Alexander,
> =

> Le 15/02/2024 =E0 11:13, Alexander Sverdlin a =E9crit=A0:
> > Hi Romain,
> > =

> > On Tue, 2024-02-13 at 18:27 +0100, Romain Naour wrote:
> >>> This series aim to add the SK-TDA4VM board support based on TI K3 j72=
1e SoC.
> >>>
> >>> This series start by adding U-boot binman support already submitted i=
n the
> >>> preview series "Add support for AM62x-SK HS-FS devices" from Dario Bi=
nacchi
> >>> [1], with small improvements.
> >>> See the FOSDEM 2024 talk "Standardizing the generation and signing of=
 boot images" [2]
> >>>
> >>> With binman support, we can add the TI K3 j721e SoC support by
> >>> providing all required firmware generated by the build.
> >>>
> >>> Add the new ti_j721e_sk_defconfig file to build a basic SD card image=
 to
> >>> boot the board (serial debug and ethernet working).
> >>>
> >>> Thanks to binman support, we can remove the ti-k3-image-gen tool from
> >>> Buildroot. To do that, we have to update existing defconfig (am62, am=
64).
> >>>
> >>> Followup commits can improve TI K3 HS-FS devices based on binman inst=
ead
> >>> of legacy core-secdev-k3 tool.
> >>>
> >>> [1] http://lists.busybox.net/pipermail/buildroot/2023-December/681139=
.html
> >>> [2] https://fosdem.org/2024/events/attachments/fosdem-2024-3067-stand=
ardizing-the-generation-and-signing-of-boot-images/slides/22808/FOSDEM24_Sp=
eaker_Slides_y7FsIKM.pdf
> >>>
> >>> Best regards,
> >>> Romain
> > =

> > I have mixed feelings after testing the patchset on SK-AM62B...
> > It doesn't quite boot, refer to the boot log [1].
> > Seems that U-Boot env is missing, maybe I'm missing some installation
> > step, but I do not see it mentioned in the documetation (for instance
> > of original commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig").
> > =

> > I'm not sure if this is a result of U-Boot update or if the current
> > master is broken as well. I'll be retesting it today and will get back =
to
> > you.
> =

> It seems you are testing on a HS-FS device "AM62X SR1.0 HS-FS" while I on=
ly
> runtime tested this series on a SK-TDA4VM (GP: general pupose).
> =

> Also the ti_am62x_sk_defconfig is expecting a GP SoC so you may have to
> customize the image generated in a post-build script?
> =

> Maybe you have to replace the tiboot3.bin binary included by genimage wit=
h the
> one for the HS-FS variant ?
> =

> for j721e:
>     285449 13 f=E9vr. 17:27 tiboot3.bin
>     285449 13 f=E9vr. 17:27 tiboot3-j721e-gp-evm.bin
>     286224 13 f=E9vr. 17:27 tiboot3-j721e_sr1_1-hs-evm.bin
>     286224 13 f=E9vr. 17:27 tiboot3-j721e_sr2-hs-fs-evm.bin
> =

> for am62x:
>     tiboot3.bin << should be the gp variant by default
>     tiboot3-am62x-gp-evm.bin
>     tiboot3-am62x-hs-fs-evm.bin
> =

> Also, did you have the ti-k3-core-secdev package locally, it seems it's r=
equired
> for HS-FS SoC but the package is currently missing:
> =

> http://lists.busybox.net/pipermail/buildroot/2024-February/685383.html
> =

> Is ti-k3-core-secdev really required fllowing the switch to binman?
> (binman should sign all firmware binaries itself).

We should see that we can remove/obsolete the ti-k3-core-secdev package
alongside the ti-k3-image-gen package, those are no longer needed since
we started using binman for the building the initial boot stage.

--
Andreas Dannenberg
Texas Instruments Inc

> =

> > =

> > Fortunately this patchset is actually about building the images differe=
ntly
> > and this part actually went smoothly, which is good.
> =

> Thank you for testing, it help a lot!
> =

> Maybe something is missing in this series to handle HS-FS device properly.
> =

> > =

> >>> Dario Binacchi (5):
> >>> =A0 package/python-attrs: add host variant
> >>> =A0 package/python-rpds-py: add host variant
> >>> =A0 package/python-referencing: add host variant
> >>> =A0 package/python-jsonschema-specifications: add host variant
> >>> =A0 package/python-jsonschema: add host variant
> >>>
> >>> Romain Naour (16):
> >>> =A0 DEVELOPERS: add Romain Naour for am574x_idk_defconfig
> >>> =A0 configs/ti_am62x_sk_defconfig: fix optee-os plateform
> >>> =A0 configs/ti_am64x_sk_defconfig: fix optee-os plateform
> >>> =A0 boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
> >>> =A0 boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN o=
ption
> >>> =A0 boot/ti-k3-r5-loader: install tiboot3.bin and sysfw.itb to
> >>> =A0=A0=A0 BINARIES_DIR
> >>> =A0 boot/ti-k3-boot-firmware: introduce
> >>> =A0=A0=A0 BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX,AM62X,AM64X,AM65=
X}
> >>> =A0 boot/uboot: use DM firmware name defined by ti-k3-boot-firmware
> >>> =A0=A0=A0 package
> >>> =A0 boot/ti-k3-boot-firmware: add BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_=
J721E
> >>> =A0 boot/uboot: replace ti-k3-image-gen options by ti-k3-firmware opt=
ions
> >>> =A0 boot/uboot: enable TI K3 Device Manager (DM) for j721e
> >>> =A0 boot/ti-k3-boot-firmware: bump to version 09.02.00.004
> >>> =A0 configs/ti_j721e_sk_defconfig: new defconfig
> >>> =A0 configs/ti_am62x_sk_defconfig: update to uboot 2024.01 to use bin=
man
> >>> =A0=A0=A0 tool
> >>> =A0 configs/ti_am64x_sk_defconfig: update to uboot 2024.01 to use bin=
man
> >>> =A0=A0=A0 tool
> >>> =A0 boot/ti-k3-image-gen: remove package
> >>>
> >>> =A0Config.in.legacy=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 7 ++
> >>> =A0DEVELOPERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 6 +-
> >>> =A0board/ti/j721e-sk/genimage.cfg=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 28 +++++++
> >>> =A0board/ti/j721e-sk/post-build.sh=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 16 ++++
> >>> =A0board/ti/j721e-sk/readme.txt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 34 ++++++++
> >>> =A0boot/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 -
> >>> =A0boot/ti-k3-boot-firmware/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 39 ++++++++++
> >>> =A0.../ti-k3-boot-firmware.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 2 +-
> >>> =A0.../ti-k3-boot-firmware.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 16 ++--
> >>> =A0boot/ti-k3-image-gen/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 77 -------------------
> >>> =A0boot/ti-k3-image-gen/ti-k3-image-gen.hash=A0=A0=A0=A0 |=A0 3 -
> >>> =A0boot/ti-k3-image-gen/ti-k3-image-gen.mk=A0=A0=A0=A0=A0=A0 | 54 ---=
----------
> >>> =A0boot/ti-k3-r5-loader/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 8 ++
> >>> =A0boot/ti-k3-r5-loader/ti-k3-r5-loader.mk=A0=A0=A0=A0=A0=A0 | 23 +++=
+++
> >>> =A0boot/uboot/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 27 ++++---
> >>> =A0boot/uboot/uboot.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 10 ++-
> >>> =A0configs/ti_am62x_sk_defconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 14 ++--
> >>> =A0configs/ti_am64x_sk_defconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 14 ++--
> >>> =A0...62x_sk_defconfig =3D> ti_j721e_sk_defconfig} | 34 ++++----
> >>> =A0package/python-attrs/python-attrs.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 6 ++
> >>> =A0.../python-jsonschema-specifications.mk=A0=A0=A0=A0=A0=A0 | 10 +++
> >>> =A0.../python-jsonschema/python-jsonschema.mk=A0=A0=A0 | 14 ++++
> >>> =A0.../python-referencing/python-referencing.mk=A0 | 11 +++
> >>> =A0package/python-rpds-py/python-rpds-py.mk=A0=A0=A0=A0=A0 |=A0 1 +
> >>> =A024 files changed, 275 insertions(+), 180 deletions(-)
> >>> =A0create mode 100644 board/ti/j721e-sk/genimage.cfg
> >>> =A0create mode 100755 board/ti/j721e-sk/post-build.sh
> >>> =A0create mode 100644 board/ti/j721e-sk/readme.txt
> >>> =A0delete mode 100644 boot/ti-k3-image-gen/Config.in
> >>> =A0delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
> >>> =A0delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
> >>> =A0copy configs/{ti_am62x_sk_defconfig =3D> ti_j721e_sk_defconfig} (5=
4%)
> >>>
> >>> --
> >>> 2.43.0
> >>>
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot@buildroot.org
> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
> > =

> > 1. Boot log:
> > =

> > U-Boot SPL 2024.01 (Feb 15 2024 - 01:42:12 +0100)
> > SYSFW ABI: 3.1 (firmware rev 0x0009 '9.1.8--v09.01.08 (Kool Koala)')
> > SPL initial stack usage: 13400 bytes
> > Trying to boot from MMC2
> > Authentication passed
> > Authentication passed
> > Authentication passed
> > Authentication passed
> > Authentication passed
> > Starting ATF on ARM64 core...
> > =

> > NOTICE:  BL31: v2.10.0  (release):v2.10
> > NOTICE:  BL31: Built : 01:28:38, Feb 15 2024
> > I/TC: =

> > I/TC: OP-TEE version: Unknown_4.0 (gcc version 12.3.0 (Buildroot 2023.1=
1-1198-g18ff6d2643)) #1 Thu Feb 15 00:28:27 UTC 2024 aarch64
> > I/TC: WARNING: This OP-TEE configuration might be insecure!
> > I/TC: WARNING: Please check https://optee.readthedocs.io/en/latest/arch=
itecture/porting_guidelines.html
> > I/TC: Primary CPU initializing
> > I/TC: SYSFW ABI: 3.1 (firmware rev 0x0009 '9.1.8--v09.01.08 (Kool Koala=
)')
> > I/TC: HUK Initialized
> > I/TC: Activated SA2UL device
> > I/TC: Enabled firewalls for SA2UL TRNG device
> > I/TC: SA2UL TRNG initialized
> > I/TC: SA2UL Drivers initialized
> > I/TC: Primary CPU switching to normal world boot
> > =

> > U-Boot SPL 2024.01 (Feb 15 2024 - 01:43:17 +0100)
> > SYSFW ABI: 3.1 (firmware rev 0x0009 '9.1.8--v09.01.08 (Kool Koala)')
> > SPL initial stack usage: 1872 bytes
> > Trying to boot from MMC2
> > Authentication passed
> > Authentication passed
> > =

> > =

> > U-Boot 2024.01 (Feb 15 2024 - 01:43:17 +0100)
> > =

> > SoC:   AM62X SR1.0 HS-FS
> > Model: Texas Instruments AM625 SK
> > DRAM:  2 GiB
> > Core:  56 devices, 23 uclasses, devicetree: separate
> > MMC:   mmc@fa10000: 0, mmc@fa00000: 1
> > Loading Environment from nowhere... OK
> > In:    serial@2800000
> > Out:   serial@2800000
> > Err:   serial@2800000
> > Net:   eth0: ethernet@8000000port@1
> > Hit any key to stop autoboot:  0 =

> > switch to partitions #0, OK
> > mmc1 is current device
> > SD/MMC found on device 1
> > Failed to load 'uEnv.txt'
> =

> Can you access to the mmc1 content manually ?
> I had to create a symlink due to "dtb" subdirectory expected by u-boot
> u-boot is looking at /boot/dtb/ti for devicetree.
> =

> Best regards,
> Romain
> =

> =

> > Scanning for bootflows in all bootdevs
> > Seq  Method       State   Uclass    Part  Name                      Fil=
ename
> > ---  -----------  ------  --------  ----  ------------------------  ---=
-------------
> > Scanning global bootmeth 'efi_mgr':
> > No EFI system partition
> > No EFI system partition
> > Failed to persist EFI variables
> > Scanning bootdev 'mmc@fa00000.bootdev':
> > Scanning bootdev 'mmc@fa10000.bootdev':
> > Unknown uclass 'usb' in label
> > link up on port 1, speed 100, full duplex
> > BOOTP broadcast 1
> > BOOTP broadcast 2
> > BOOTP broadcast 3
> > BOOTP broadcast 4
> > BOOTP broadcast 5
> > BOOTP broadcast 6
> > BOOTP broadcast 7
> > BOOTP broadcast 8
> > BOOTP broadcast 9
> > BOOTP broadcast 10
> > BOOTP broadcast 11
> > BOOTP broadcast 12
> > BOOTP broadcast 13
> > BOOTP broadcast 14
> > BOOTP broadcast 15
> > BOOTP broadcast 16
> > BOOTP broadcast 17
> > =

> > Retry time exceeded; starting again
> > =

> > =

> > =

> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
