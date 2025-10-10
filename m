Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D87CAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 09:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E7F340E83;
	Fri, 10 Oct 2025 09:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChxjS-d5VN5G; Fri, 10 Oct 2025 09:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B9040EBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B9040EBA;
	Fri, 10 Oct 2025 09:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B32A119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B6C60586
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LulWWHpAF6e for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 09:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.61.186.89;
 helo=ibeerc.linenoise.info; envelope-from=alvaro@linenoise.info;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82E6C60087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E6C60087
Received: from ibeerc.linenoise.info (ibeerc.linenoise.info [130.61.186.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82E6C60087
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:27:59 +0000 (UTC)
Received: from [192.168.2.3] (unknown [109.227.153.227])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ibeerc.linenoise.info (Postfix) with ESMTPSA id E2C7122DAF
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:27:56 +0200 (CEST)
Message-ID: <38181077175d0eae28f1909bf445bcbfb474f18e.camel@linenoise.info>
From: =?ISO-8859-1?Q?=C1lvaro?= "G. M." <alvaro@linenoise.info>
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 11:27:56 +0200
In-Reply-To: <3cda94e9d0c9e9c75d9327f55ea4c822769fa4ee.camel@linenoise.info>
References: <3cda94e9d0c9e9c75d9327f55ea4c822769fa4ee.camel@linenoise.info>
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=linenoise.info; s=ibeerc; t=1760088477;
 bh=D5IVMWSVlWIbffb98gW7q1d/pW1L02TiI38e607/ylA=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=vKvWE9nKDjhuROhy6ySniwnVVOiG7wq2Q7jOHqfjCojAmMHIBZF4U7uFj+FGrxKIw
 a0rYSouUOr3cf3zUrEGSv8hdDF57DY164pkXd8RYHG3uLB9GBFO85VS1TQNjqriVxb
 USydIhlgUR9uKi+OPCRMUg7M0DZ7wivj1mV+mR6908GgNImZKD9v2nkYAL8QK3u0XX
 lpP10LZEhnYtAnktgd6esAo4NjDSLLitOcl6nKdPGjGSd4Z7C3TCx/Mh7j0U/RT005
 ICcIc8tl67e/b2vyob8EtfqI/2nQEiQxFcSorfIa+/yYSc/FHR4ITVVn1ZKP2a49qI
 qoYJ54Y79VEow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linenoise.info
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linenoise.info header.i=@linenoise.info
 header.a=rsa-sha256 header.s=ibeerc header.b=vKvWE9nK
Subject: Re: [Buildroot] Cannot build kernel with custom DTS file
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
Content-Type: multipart/mixed; boundary="===============1348029404606603216=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1348029404606603216==
Content-Type: multipart/alternative; boundary="=-cg7Os2swOIBHVJzkaI+7"

--=-cg7Os2swOIBHVJzkaI+7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Sorry, I already discovered that buildroot already knows how to deal with t=
his, but I needed to do some changes.

Here they are, just in case it's useful to someone:

diff --git a/SAR/defconfig b/SAR/defconfig
index cc1093a..3064a08 100644
--- a/SAR/defconfig
+++ b/SAR/defconfig
@@ -17,7 +17,8 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,linux-xlnx=
,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.t=
ar.gz"
BR2_LINUX_KERNEL_DEFCONFIG=3D"xilinx"
BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"$(BR2_EXTERNAL_SAR_PATH)/SAR.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"xilinx/SAR"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR=3D"$(BR2_EXTERNAL_SAR_PATH)/dts"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
BR2_PACKAGE_XILINX_FPGAUTIL=3Dy
BR2_TARGET_ROOTFS_EXT2=3Dy

And I had to create dts/xilinx directory and place SAR.dts there

Sorry for the inconvenience,

On Fri, 2025-10-10 at 10:51 +0200, =C3=81lvaro G. M. wrote:
> Hi,
>=20
> I'm trying to upgrade an old 2021.08 buildroot based project to latest
> master, using a more up to date kernel, for a platform based on zynqmp.
>=20
> As a starting point I'm using my old defconfig and the latest zynqmp_zcu1=
06_defconfig
> with the difference that I want to provide my own DTS file to both the ke=
rnel and u-boot.
>=20
> However, I'm stuck at kernel compilation because it doesn't seem to know =
how to build .dtb file:
>=20
> $ make
> make -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/../buildroot =
O=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output BR2_EXTERNAL=
=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR
> PROJECT_NAME=3DSAR BR2_DEFCONFIG=3D/home/sslayer/Proyectos/ART/DAR/DAR-up=
grade.git/SAR/defconfig defconfig
>   GEN     /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Make=
file
> #
> # configuration written to /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.gi=
t/SAR/output/.config
> #
> make -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/../buildroot =
O=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output BR2_EXTERNAL=
=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR
> PROJECT_NAME=3DSAR BR2_DEFCONFIG=3D/home/sslayer/Proyectos/ART/DAR/DAR-up=
grade.git/SAR/defconfig
> /usr/bin/make -j1  O=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SA=
R/output HOSTCC=3D"/usr/bin/gcc" HOSTCXX=3D"/usr/bin/g++" syncconfig
>   GEN     /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Make=
file
> > > > linux custom Building
> cp -f /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/SAR.dts /home/s=
slayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-custom/arch=
/arm64/boot/dts/
> GIT_DIR=3D. PATH=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/o=
utput/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bi=
n:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//=
bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
> riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG=3D"/home/sslayer/=
Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFI=
G_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=3D"/home/sslayer/Proye=
ctos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Pr=
oyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=3D/home/ssla=
yer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 =
HOSTCC=3D"/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/ss=
layer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/ssl=
ayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DA=
R/DAR-upgrade.git/SAR/output/host/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribu=
te-alias"
> INSTALL_MOD_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/ou=
tput/target CROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.gi=
t/SAR/output/host/bin/aarch64-linux-" WERROR=3D0
> REGENERATE_PARSERS=3D1 DEPMOD=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgra=
de.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/P=
royectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
> custom all
>   SYNC    include/config/auto.conf
>   CALL    scripts/checksyscalls.sh
> GIT_DIR=3D. PATH=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/o=
utput/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bi=
n:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//=
bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
> riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG=3D"/home/sslayer/=
Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFI=
G_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=3D"/home/sslayer/Proye=
ctos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Pr=
oyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=3D/home/ssla=
yer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 =
HOSTCC=3D"/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/ss=
layer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/ssl=
ayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DA=
R/DAR-upgrade.git/SAR/output/host/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribu=
te-alias"
> INSTALL_MOD_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/ou=
tput/target CROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.gi=
t/SAR/output/host/bin/aarch64-linux-" WERROR=3D0
> REGENERATE_PARSERS=3D1 DEPMOD=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgra=
de.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/P=
royectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
> custom Image
>   CALL    scripts/checksyscalls.sh
> GIT_DIR=3D. PATH=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/o=
utput/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bi=
n:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//=
bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISCV/
> riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG=3D"/home/sslayer/=
Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config" PKG_CONFI=
G_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1
> PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=3D"/home/sslayer/Proye=
ctos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Pr=
oyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/share/pkgconfig" BR_BINARIES_DIR=3D/home/ssla=
yer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 =
HOSTCC=3D"/home/sslayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem /home/ss=
layer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/home/ssl=
ayer/Proyectos/ART/DAR/DAR-
> upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DA=
R/DAR-upgrade.git/SAR/output/host/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribu=
te-alias"
> INSTALL_MOD_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/ou=
tput/target CROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.gi=
t/SAR/output/host/bin/aarch64-linux-" WERROR=3D0
> REGENERATE_PARSERS=3D1 DEPMOD=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgra=
de.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/P=
royectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-
> custom SAR.dtb=20
> make[4]: *** No rule to make target 'arch/arm64/boot/dts/SAR.dtb'.  Stop.
> make[3]: *** [Makefile:1408: SAR.dtb] Error 2
> make[2]: *** [package/pkg-generic.mk:273: /home/sslayer/Proyectos/ART/DAR=
/DAR-upgrade.git/SAR/output/build/linux-custom/.stamp_built] Error 2
> make[1]: *** [Makefile:83: _all] Error 2
> make: *** [../common.mk:42: default] Error 2
>=20
> In the old project I used 5.17. I've tried master buildroot with kernel 5=
.17
> and this succeeds on building .dtb file, so I guess something has changed
> between kernel versions that buildroot doesn't take into account.
>=20
> File output/build/linux-custom/arch/arm64/boot/dts/SAR.dts exists,
> so buildroot copies the file to the usual directory, but it seems
> that it now requires the DTS to be behind a directory there, because
> if I copy my SAR.dts file under output/build/linux-custom/arch/arm64/boot=
/dts/xilinx,
> I can then manually run the last make line but asking it to make
> xilinx/SAR.dtb instead of SAR.dtb, it will succeed.
>=20
> So, it definitely looks like there's the need of placing user provided DT=
S file
> under a directory, but I don't know how should this be fixed in buildroot=
.
>=20
> Any insight would be appreciated.
>=20
> Thanks
>=20
> This is my defconfig:
>=20
> BR2_aarch64=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=3Dy
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=3Dy
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=3D"microblazeel-buildroot-elf"
> BR2_DL_DIR=3D"$(HOME)/.buildroot-dl"
> BR2_CCACHE=3Dy
> BR2_PACKAGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_SAR_PATH)/../local.mk"
> BR2_GLOBAL_PATCH_DIR=3D"$(BR2_EXTERNAL_SAR_PATH)/../patch"
> BR2_ROOTFS_OVERLAY=3D"$(BR2_EXTERNAL_SAR_PATH)/../overlay/common $(BR2_EX=
TERNAL_SAR_PATH)/../overlay/$(PROJECT_NAME)"
> BR2_ROOTFS_POST_BUILD_SCRIPT=3D"$(BR2_EXTERNAL_SAR_PATH)/../scripts/set_v=
ersion_file.sh"
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_SAR_PATH)/../scripts/zynq-=
post-image.sh"
> BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-p $(PROJECT_NAME) -f $(BR2_EXTERNAL_SAR_P=
ATH)/post_script.rc $(BR2_ART_SOFTWARE_VERSION)"
> BR2_LINUX_KERNEL=3Dy
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,linux-xl=
nx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40=
.tar.gz"
> BR2_LINUX_KERNEL_DEFCONFIG=3D"xilinx"
> BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"$(BR2_EXTERNAL_SAR_PATH)/SAR.dts"
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> BR2_PACKAGE_XILINX_FPGAUTIL=3Dy
> BR2_TARGET_ROOTFS_EXT2=3Dy
> BR2_TARGET_ROOTFS_EXT2_4=3Dy
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D"$(call github,=
Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_202=
5.1.tar.gz"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"zynqmp"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=3Dy
> BR2_TARGET_UBOOT=3Dy
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy
> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,u-boot-x=
lnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01_2025.1.tar.gz"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"xilinx_zynqmp_virt"
> BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> BR2_TARGET_UBOOT_NEEDS_GNUTLS=3Dy
> BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=3Dy
> BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy
> BR2_TARGET_UBOOT_USE_BINMAN=3Dy
> BR2_TARGET_UBOOT_FORMAT_ITB=3Dy
> BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=3Dy
> BR2_TARGET_UBOOT_SPL=3Dy
> BR2_TARGET_UBOOT_SPL_NAME=3D"spl/boot.bin"
> BR2_TARGET_UBOOT_ZYNQMP=3Dy
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW=3Dy
> BR2_TARGET_UBOOT_ZYNQMP_PM_CFG=3D"board/zynqmp/zcu106/pm_cfg_obj.c"
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D"DEVICE_TREE=3Dzynqmp-zcu106-rev1.0"
> BR2_TARGET_XILINX_EMBEDDEDSW=3Dy
> BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=3Dy
> BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> BR2_PACKAGE_HOST_GENIMAGE=3Dy
> BR2_PACKAGE_HOST_MTOOLS=3Dy
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--=-cg7Os2swOIBHVJzkaI+7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hi</div><div><br></div><div>Sorry, I already disc=
overed that buildroot already knows how to deal with this, but I needed to =
do some changes.</div><div><br></div><div>Here they are, just in case it's =
useful to someone:</div><div><br></div><div>diff --git a/SAR/defconfig b/SA=
R/defconfig</div><div>index cc1093a..3064a08 100644</div><div>--- a/SAR/def=
config</div><div>+++ b/SAR/defconfig</div><div>@@ -17,7 +17,8 @@ BR2_LINUX_=
KERNEL_CUSTOM_TARBALL=3Dy</div><div> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATI=
ON=3D"$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.40)/=
xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz"</div><div> BR2_LINUX_KERNEL_DEF=
CONFIG=3D"xilinx"</div><div> BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy</div><div>-BR=
2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"$(BR2_EXTERNAL_SAR_PATH)/SAR.dts"</div><d=
iv>+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"xilinx/SAR"</div><div>+BR2_LINUX_KE=
RNEL_CUSTOM_DTS_DIR=3D"$(BR2_EXTERNAL_SAR_PATH)/dts"</div><div> BR2_LINUX_K=
ERNEL_NEEDS_HOST_OPENSSL=3Dy</div><div> BR2_PACKAGE_XILINX_FPGAUTIL=3Dy</di=
v><div> BR2_TARGET_ROOTFS_EXT2=3Dy</div><div><br></div><div>And I had to cr=
eate dts/xilinx directory and place SAR.dts there</div><div><br></div><div>=
Sorry for the inconvenience,</div><div><br></div><div>On Fri, 2025-10-10 at=
 10:51 +0200, =C3=81lvaro G. M. wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>Hi,</pre><pre><br></pre><pre>I'm trying to upgrade an old 2021.08 buildroo=
t based project to latest</pre><pre>master, using a more up to date kernel,=
 for a platform based on zynqmp.</pre><pre><br></pre><pre>As a starting poi=
nt I'm using my old defconfig and the latest zynqmp_zcu106_defconfig</pre><=
pre>with the difference that I want to provide my own DTS file to both the =
kernel and u-boot.</pre><pre><br></pre><pre>However, I'm stuck at kernel co=
mpilation because it doesn't seem to know how to build .dtb file:</pre><pre=
><br></pre><pre>$ make</pre><pre>make -C /home/sslayer/Proyectos/ART/DAR/DA=
R-upgrade.git/SAR/../buildroot O=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgr=
ade.git/SAR/output BR2_EXTERNAL=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgra=
de.git/SAR</pre><pre>PROJECT_NAME=3DSAR BR2_DEFCONFIG=3D/home/sslayer/Proye=
ctos/ART/DAR/DAR-upgrade.git/SAR/defconfig defconfig</pre><pre>  GEN     /h=
ome/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Makefile</pre><pre=
>#</pre><pre># configuration written to /home/sslayer/Proyectos/ART/DAR/DAR=
-upgrade.git/SAR/output/.config</pre><pre>#</pre><pre>make -C /home/sslayer=
/Proyectos/ART/DAR/DAR-upgrade.git/SAR/../buildroot O=3D/home/sslayer/Proye=
ctos/ART/DAR/DAR-upgrade.git/SAR/output BR2_EXTERNAL=3D/home/sslayer/Proyec=
tos/ART/DAR/DAR-upgrade.git/SAR</pre><pre>PROJECT_NAME=3DSAR BR2_DEFCONFIG=
=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/defconfig</pre><pre>=
/usr/bin/make -j1  O=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/=
output HOSTCC=3D"/usr/bin/gcc" HOSTCXX=3D"/usr/bin/g++" syncconfig</pre><pr=
e>  GEN     /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/Make=
file</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"mar=
gin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pa=
dding-left:1ex"><pre>linux custom Building</pre></blockquote></blockquote><=
/blockquote><pre>cp -f /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/=
SAR.dts /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/li=
nux-custom/arch/arm64/boot/dts/</pre><pre>GIT_DIR=3D. PATH=3D"/home/sslayer=
/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin:/home/sslayer/Proyec=
tos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/sbin:/home/sslayer/b=
in:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/EMPIRE_XPU=
_8.03:/home/opt/ADS2017//bin:/home/sslayer/bin:/home/sslayer/Proyectos/RISC=
V/</pre><pre>riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" PKG_CONFIG=3D"/ho=
me/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin/pkg-config=
" PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=3D1</pre><pre=
>PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=3D"/home/sslayer/Proyec=
tos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:/home/sslayer/Pro=
yectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/share/pkgconfig" =
BR_BINARIES_DIR=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/outpu=
t/images /usr/bin/make -j17 HOSTCC=3D"/home/sslayer/Proyectos/ART/DAR/DAR-<=
/pre><pre>upgrade.git/SAR/output/host/bin/ccache /usr/bin/gcc -O2 -isystem =
/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/include -L/=
home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/l=
ib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/ho=
st/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribute-alias"</pre><pre>INSTALL_MOD=
_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/target C=
ROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/=
host/bin/aarch64-linux-" WERROR=3D0</pre><pre>REGENERATE_PARSERS=3D1 DEPMOD=
=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/sbin/dep=
mod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.gi=
t/SAR/output/build/linux-</pre><pre>custom all</pre><pre>  SYNC    include/=
config/auto.conf</pre><pre>  CALL    scripts/checksyscalls.sh</pre><pre>GIT=
_DIR=3D. PATH=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output=
/host/bin:/home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/ou=
tput/host/sbin:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/ga=
mes:/usr/games:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//bin:/home/sslayer/bi=
n:/home/sslayer/Proyectos/RISCV/</pre><pre>riscv-bin/bin/:/opt/st/stm32cube=
ide_1.14.0/" PKG_CONFIG=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/=
SAR/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALL=
OW_SYSTEM_CFLAGS=3D1</pre><pre>PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_=
LIBDIR=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/l=
ib/pkgconfig:/home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR=
/output/host/share/pkgconfig" BR_BINARIES_DIR=3D/home/sslayer/Proyectos/ART=
/DAR/DAR-upgrade.git/SAR/output/images /usr/bin/make -j17 HOSTCC=3D"/home/s=
slayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/bin/cca=
che /usr/bin/gcc -O2 -isystem /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.g=
it/SAR/output/host/include -L/home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre=
>upgrade.git/SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR=
/DAR-upgrade.git/SAR/output/host/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribut=
e-alias"</pre><pre>INSTALL_MOD_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-u=
pgrade.git/SAR/output/target CROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/D=
AR/DAR-upgrade.git/SAR/output/host/bin/aarch64-linux-" WERROR=3D0</pre><pre=
>REGENERATE_PARSERS=3D1 DEPMOD=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrad=
e.git/SAR/output/host/sbin/depmod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/Pr=
oyectos/ART/DAR/DAR-upgrade.git/SAR/output/build/linux-</pre><pre>custom Im=
age</pre><pre>  CALL    scripts/checksyscalls.sh</pre><pre>GIT_DIR=3D. PATH=
=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/bin:/ho=
me/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/sbi=
n:/home/sslayer/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/game=
s:/opt/EMPIRE_XPU_8.03:/home/opt/ADS2017//bin:/home/sslayer/bin:/home/sslay=
er/Proyectos/RISCV/</pre><pre>riscv-bin/bin/:/opt/st/stm32cubeide_1.14.0/" =
PKG_CONFIG=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/ho=
st/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR=3D"/" PKG_CONFIG_ALLOW_SYSTEM_CFL=
AGS=3D1</pre><pre>PKG_CONFIG_ALLOW_SYSTEM_LIBS=3D1 PKG_CONFIG_LIBDIR=3D"/ho=
me/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output/host/lib/pkgconfig:=
/home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/=
share/pkgconfig" BR_BINARIES_DIR=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgr=
ade.git/SAR/output/images /usr/bin/make -j17 HOSTCC=3D"/home/sslayer/Proyec=
tos/ART/DAR/DAR-</pre><pre>upgrade.git/SAR/output/host/bin/ccache /usr/bin/=
gcc -O2 -isystem /home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/output=
/host/include -L/home/sslayer/Proyectos/ART/DAR/DAR-</pre><pre>upgrade.git/=
SAR/output/host/lib -Wl,-rpath,/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.=
git/SAR/output/host/lib" ARCH=3Darm64 KCFLAGS=3D"-Wno-attribute-alias"</pre=
><pre>INSTALL_MOD_PATH=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SA=
R/output/target CROSS_COMPILE=3D"/home/sslayer/Proyectos/ART/DAR/DAR-upgrad=
e.git/SAR/output/host/bin/aarch64-linux-" WERROR=3D0</pre><pre>REGENERATE_P=
ARSERS=3D1 DEPMOD=3D/home/sslayer/Proyectos/ART/DAR/DAR-upgrade.git/SAR/out=
put/host/sbin/depmod INSTALL_MOD_STRIP=3D1 -C /home/sslayer/Proyectos/ART/D=
AR/DAR-upgrade.git/SAR/output/build/linux-</pre><pre>custom SAR.dtb </pre><=
pre>make[4]: *** No rule to make target 'arch/arm64/boot/dts/SAR.dtb'.  Sto=
p.</pre><pre>make[3]: *** [Makefile:1408: SAR.dtb] Error 2</pre><pre>make[2=
]: *** [package/pkg-generic.mk:273: /home/sslayer/Proyectos/ART/DAR/DAR-upg=
rade.git/SAR/output/build/linux-custom/.stamp_built] Error 2</pre><pre>make=
[1]: *** [Makefile:83: _all] Error 2</pre><pre>make: *** [../common.mk:42: =
default] Error 2</pre><pre><br></pre><pre>In the old project I used 5.17. I=
've tried master buildroot with kernel 5.17</pre><pre>and this succeeds on =
building .dtb file, so I guess something has changed</pre><pre>between kern=
el versions that buildroot doesn't take into account.</pre><pre><br></pre><=
pre>File output/build/linux-custom/arch/arm64/boot/dts/SAR.dts exists,</pre=
><pre>so buildroot copies the file to the usual directory, but it seems</pr=
e><pre>that it now requires the DTS to be behind a directory there, because=
</pre><pre>if I copy my SAR.dts file under output/build/linux-custom/arch/a=
rm64/boot/dts/xilinx,</pre><pre>I can then manually run the last make line =
but asking it to make</pre><pre>xilinx/SAR.dtb instead of SAR.dtb, it will =
succeed.</pre><pre><br></pre><pre>So, it definitely looks like there's the =
need of placing user provided DTS file</pre><pre>under a directory, but I d=
on't know how should this be fixed in buildroot.</pre><pre><br></pre><pre>A=
ny insight would be appreciated.</pre><pre><br></pre><pre>Thanks</pre><pre>=
<br></pre><pre>This is my defconfig:</pre><pre><br></pre><pre>BR2_aarch64=
=3Dy</pre><pre>BR2_TOOLCHAIN_EXTERNAL=3Dy</pre><pre>BR2_TOOLCHAIN_EXTERNAL_=
BOOTLIN=3Dy</pre><pre>BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=
=3Dy</pre><pre>BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=3Dy</pre><pre>BR2_TOOLCHA=
IN_BARE_METAL_BUILDROOT_ARCH=3D"microblazeel-buildroot-elf"</pre><pre>BR2_D=
L_DIR=3D"$(HOME)/.buildroot-dl"</pre><pre>BR2_CCACHE=3Dy</pre><pre>BR2_PACK=
AGE_OVERRIDE_FILE=3D"$(BR2_EXTERNAL_SAR_PATH)/../local.mk"</pre><pre>BR2_GL=
OBAL_PATCH_DIR=3D"$(BR2_EXTERNAL_SAR_PATH)/../patch"</pre><pre>BR2_ROOTFS_O=
VERLAY=3D"$(BR2_EXTERNAL_SAR_PATH)/../overlay/common $(BR2_EXTERNAL_SAR_PAT=
H)/../overlay/$(PROJECT_NAME)"</pre><pre>BR2_ROOTFS_POST_BUILD_SCRIPT=3D"$(=
BR2_EXTERNAL_SAR_PATH)/../scripts/set_version_file.sh"</pre><pre>BR2_ROOTFS=
_POST_IMAGE_SCRIPT=3D"$(BR2_EXTERNAL_SAR_PATH)/../scripts/zynq-post-image.s=
h"</pre><pre>BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-p $(PROJECT_NAME) -f $(BR2_EXT=
ERNAL_SAR_PATH)/post_script.rc $(BR2_ART_SOFTWARE_VERSION)"</pre><pre>BR2_L=
INUX_KERNEL=3Dy</pre><pre>BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy</pre><pre>BR2=
_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,linux-xlnx,xl=
nx_rebase_v6.12_LTS_merge_6.12.40)/xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.=
gz"</pre><pre>BR2_LINUX_KERNEL_DEFCONFIG=3D"xilinx"</pre><pre>BR2_LINUX_KER=
NEL_DTS_SUPPORT=3Dy</pre><pre>BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"$(BR2_EXT=
ERNAL_SAR_PATH)/SAR.dts"</pre><pre>BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<=
/pre><pre>BR2_PACKAGE_XILINX_FPGAUTIL=3Dy</pre><pre>BR2_TARGET_ROOTFS_EXT2=
=3Dy</pre><pre>BR2_TARGET_ROOTFS_EXT2_4=3Dy</pre><pre># BR2_TARGET_ROOTFS_T=
AR is not set</pre><pre>BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy</pre><pre>BR2_T=
ARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=3Dy</pre><pre>BR2_TARGET_ARM_TRUS=
TED_FIRMWARE_CUSTOM_TARBALL_LOCATION=3D"$(call github,Xilinx,arm-trusted-fi=
rmware,xlnx_rebase_v2.12_2025.1)/xlnx_rebase_v2.12_2025.1.tar.gz"</pre><pre=
>BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"zynqmp"</pre><pre>BR2_TARGET_A=
RM_TRUSTED_FIRMWARE_BL31_UBOOT=3Dy</pre><pre>BR2_TARGET_UBOOT=3Dy</pre><pre=
>BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy</pre><pre>BR2_TARGET_UBOOT_CUSTO=
M_TARBALL=3Dy</pre><pre>BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call =
github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.1)/xlnx_rebase_v2025.01=
_2025.1.tar.gz"</pre><pre>BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"xilinx_zynqmp=
_virt"</pre><pre>BR2_TARGET_UBOOT_NEEDS_DTC=3Dy</pre><pre>BR2_TARGET_UBOOT_=
NEEDS_OPENSSL=3Dy</pre><pre>BR2_TARGET_UBOOT_NEEDS_GNUTLS=3Dy</pre><pre>BR2=
_TARGET_UBOOT_NEEDS_UTIL_LINUX=3Dy</pre><pre>BR2_TARGET_UBOOT_NEEDS_ATF_BL3=
1=3Dy</pre><pre>BR2_TARGET_UBOOT_USE_BINMAN=3Dy</pre><pre>BR2_TARGET_UBOOT_=
FORMAT_ITB=3Dy</pre><pre>BR2_TARGET_UBOOT_FORMAT_QSPI_BIN=3Dy</pre><pre>BR2=
_TARGET_UBOOT_SPL=3Dy</pre><pre>BR2_TARGET_UBOOT_SPL_NAME=3D"spl/boot.bin"<=
/pre><pre>BR2_TARGET_UBOOT_ZYNQMP=3Dy</pre><pre>BR2_TARGET_UBOOT_ZYNQMP_PMU=
FW_EMBEDDEDSW=3Dy</pre><pre>BR2_TARGET_UBOOT_ZYNQMP_PM_CFG=3D"board/zynqmp/=
zcu106/pm_cfg_obj.c"</pre><pre>BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D"DEVICE_T=
REE=3Dzynqmp-zcu106-rev1.0"</pre><pre>BR2_TARGET_XILINX_EMBEDDEDSW=3Dy</pre=
><pre>BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW=3Dy</pre><pre>BR2_PACKAGE_H=
OST_DOSFSTOOLS=3Dy</pre><pre>BR2_PACKAGE_HOST_GENIMAGE=3Dy</pre><pre>BR2_PA=
CKAGE_HOST_MTOOLS=3Dy</pre><pre>___________________________________________=
____</pre><pre>buildroot mailing list</pre><pre><a href=3D"mailto:buildroot=
@buildroot.org">buildroot@buildroot.org</a></pre><pre><a href=3D"https://li=
sts.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/m=
ailman/listinfo/buildroot</a></pre></blockquote><div><br></div><div><span><=
/span></div></body></html>

--=-cg7Os2swOIBHVJzkaI+7--

--===============1348029404606603216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1348029404606603216==--
