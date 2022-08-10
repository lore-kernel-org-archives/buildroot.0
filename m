Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AB3C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1A361097;
	Wed, 10 Aug 2022 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1A361097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaWA09LtVQIM; Wed, 10 Aug 2022 13:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53E2761082;
	Wed, 10 Aug 2022 13:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53E2761082
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA1021BF96B
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 13:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5DD4176D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 13:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5DD4176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OirKRSRtTO8H for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 13:51:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D664175E
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9D664175E
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 13:51:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,227,1654531200"; d="scan'208";a="320442541"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Aug 2022 21:51:03 +0800
IronPort-SDR: RaI1D2tCNzwwA555zoI/zQmQxXrlE/NKqj9xW+3BJY/kwGkuYfVzD3Qoc67BlfqNHAJcsq1nb9
 CwkfrTpPPkILiFqLz0XYb/HcuGl5xPCcWwLL29mzOIQy1A5fg/OFJIA3bh3A5n+tx6M7xBd9Sv
 CZiX+SIWdxfretiP6x91hSeDh0VwoTuopG8USU1baPFKE1XkxalSShGVZFBMspHlKXsTKiGFxC
 +ljv1t8VJGXu+Jb0kIlz73PlDPeMwsR5cFagoCxjzn6kKh2W38VnQsifepcf0d0RtQPtK6LZaV
 nFAgWI5LS2nhKFCwiqPsfE9V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 06:11:58 -0700
IronPort-SDR: iLadEYcMszX1qBDpbCKtDY1W6Nj4zxWkJgzmQ/ZUoDvH4WVeor2UKimLrSJTo7nJnUhG+icX2i
 vufFrh3bNZ0MNKr5gWlrRPg+phKDYo9TxtPJCuXotz6N6KrlQqiMITikSDcIl1EwuzBFFXgsKW
 2COuNkE1JPvZvjin2EqOSwerg9WweqPN+j5Hp4hDuEZ0asBJn80S8d8UT/3O2rEALQP/CyhQBq
 5q8HDJeN0i7gwsM3lrjCOYXocjsSIYmvrqxWKF4FI/1VIbXUab9cXdgJGqfV8fPy5hSHQNgCXV
 OOY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 06:51:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M2rtv1PkWz1Rwnl
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 06:51:03 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ExvC7ML7bnUT for <buildroot@buildroot.org>;
 Wed, 10 Aug 2022 06:51:02 -0700 (PDT)
Received: from [10.111.68.99] (c02drav6md6t.sdcorp.global.sandisk.com
 [10.111.68.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M2rtt0Znqz1RtVk;
 Wed, 10 Aug 2022 06:51:01 -0700 (PDT)
Message-ID: <13cb21d3-69ef-8758-2f2b-f36ed26f1999@opensource.wdc.com>
Date: Wed, 10 Aug 2022 06:51:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Content-Language: en-US
To: Niklas Cassel <niklas.cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220810115055.3898793-1-niklas.cassel@wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220810115055.3898793-1-niklas.cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660139464; x=1691675464;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cwBd3+59X8n7me+RPYh/iVcHwiE3gYIw7eYxUVxlb20=;
 b=RDewVxDRI+VrqGRC1JWr8kOJ9duJ8J64HwyFtxbbhEmfu8AZcdfFOBe4
 lScVELxcd7t3cqSumwqFxh43Sph4giV12U1y4M3G2jIVv4Pz7hRIR93gJ
 HNcJfwhVEZB0+fVON4aliUBkt9h4sed7okUWndxKjeapj0eRpDJrFEnJm
 tovUGKgje63oCSPkOIM2Dar1gTHRueFQZkQO6c1viwEpy5ZiNst5l6sSU
 5C/e6G++7/PtgtL73j5VqeC2DFho//eaMebfTPUxXnuiCpywxF/0Iy61k
 mSwZSkFy8234gZPjtnMfrHZlwl/ESi9oZY7vWGlYi9Rh1p8KzD8S05GO2
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1660139462; x=1662731463; bh=cwBd3+59X8n7me+RPYh/iVcHwiE3gYIw7eY
 xUVxlb20=; b=bBRXvPvfzF8QI8IVs3ayBGaxkcotnGuwAuecj3eRr2ptFISCzif
 WIvoiSUYVN12tAgavcYmNtE2500nLc5Qy9TvTu14gibnwGK2M9QHDi/dk7v2v1ln
 LIBJ0vwc3IfvW4A8GkE+tnQR3xcrnXII7B2rAq5ZTI64SD1PuKdut5G6gguCZQxY
 brb6UyTpi7ZeLN0tvFMfGpKU/6vaFVFroLCYFVDXaXbWujSR5b9sXbsTB/Wwwm/Z
 wA2kc0JD0Pblr9ZK+NWfvU8uiWSj4WkstC/chv2RtTKUzXad8ttj8Rgli7oC+nSP
 I8bwlkeU3DdKMSLSacIXMU+0LRjKF3WMmPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=RDewVxDR; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=bBRXvPvf
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: Re: [Buildroot] [PATCH] board/riscv/nommu: bump kernel version and
 drop no longer needed patch
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022/08/10 4:50, Niklas Cassel wrote:
> Bump the kernel version for all riscv nommu configs from 5.18 to 5.19.
> That way, we can remove the one and only riscv nommu patch,
> since this patch is included in kernel 5.19.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  ...ot-stop-relocating-GOT-entries-prema.patch | 110 ------------------
>  board/riscv/nommu/patches/linux/readme.txt    |   3 -
>  configs/canaan_kd233_defconfig                |   5 +-
>  configs/qemu_riscv64_nommu_virt_defconfig     |   5 +-
>  configs/sipeed_maix_bit_defconfig             |   5 +-
>  configs/sipeed_maix_bit_sdcard_defconfig      |   5 +-
>  configs/sipeed_maix_dock_defconfig            |   5 +-
>  configs/sipeed_maix_dock_sdcard_defconfig     |   5 +-
>  configs/sipeed_maix_go_defconfig              |   5 +-
>  configs/sipeed_maix_go_sdcard_defconfig       |   5 +-
>  configs/sipeed_maixduino_defconfig            |   5 +-
>  configs/sipeed_maixduino_sdcard_defconfig     |   5 +-
>  12 files changed, 10 insertions(+), 153 deletions(-)
>  delete mode 100644 board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
>  delete mode 100644 board/riscv/nommu/patches/linux/readme.txt
> 
> diff --git a/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch b/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
> deleted file mode 100644
> index e5513b729b..0000000000
> --- a/board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 6045ab5fea4c849153ebeb0acb532da5f29d69c4 Mon Sep 17 00:00:00 2001
> -From: Niklas Cassel <niklas.cassel@wdc.com>
> -Date: Thu, 14 Apr 2022 11:10:18 +0200
> -Subject: binfmt_flat: do not stop relocating GOT entries prematurely on riscv
> -
> -Upstream commit 6045ab5fea4c849153ebeb0acb532da5f29d69c4.
> -
> -bFLT binaries are usually created using elf2flt.
> -
> -The linker script used by elf2flt has defined the .data section like the
> -following for the last 19 years:
> -
> -.data : {
> -	_sdata = . ;
> -	__data_start = . ;
> -	data_start = . ;
> -	*(.got.plt)
> -	*(.got)
> -	FILL(0) ;
> -	. = ALIGN(0x20) ;
> -	LONG(-1)
> -	. = ALIGN(0x20) ;
> -	...
> -}
> -
> -It places the .got.plt input section before the .got input section.
> -The same is true for the default linker script (ld --verbose) on most
> -architectures except x86/x86-64.
> -
> -The binfmt_flat loader should relocate all GOT entries until it encounters
> -a -1 (the LONG(-1) in the linker script).
> -
> -The problem is that the .got.plt input section starts with a GOTPLT header
> -(which has size 16 bytes on elf64-riscv and 8 bytes on elf32-riscv), where
> -the first word is set to -1. See the binutils implementation for riscv [1].
> -
> -This causes the binfmt_flat loader to stop relocating GOT entries
> -prematurely and thus causes the application to crash when running.
> -
> -Fix this by skipping the whole GOTPLT header, since the whole GOTPLT header
> -is reserved for the dynamic linker.
> -
> -The GOTPLT header will only be skipped for bFLT binaries with flag
> -FLAT_FLAG_GOTPIC set. This flag is unconditionally set by elf2flt if the
> -supplied ELF binary has the symbol _GLOBAL_OFFSET_TABLE_ defined.
> -ELF binaries without a .got input section should thus remain unaffected.
> -
> -Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
> -
> -[1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
> -
> -Cc: <stable@vger.kernel.org>
> -Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> -Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> -Link: https://lore.kernel.org/r/20220414091018.896737-1-niklas.cassel@wdc.com
> -Fixed-by: kernel test robot <lkp@intel.com>
> -Link: https://lore.kernel.org/lkml/202204182333.OIUOotK8-lkp@intel.com
> -Signed-off-by: Kees Cook <keescook@chromium.org>
> ----
> - fs/binfmt_flat.c | 27 ++++++++++++++++++++++++++-
> - 1 file changed, 26 insertions(+), 1 deletion(-)
> -
> -diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> -index 6268981500112..dca0b6875f9c3 100644
> ---- a/fs/binfmt_flat.c
> -+++ b/fs/binfmt_flat.c
> -@@ -440,6 +440,30 @@ static void old_reloc(unsigned long rl)
> - 
> - /****************************************************************************/
> - 
> -+static inline u32 __user *skip_got_header(u32 __user *rp)
> -+{
> -+	if (IS_ENABLED(CONFIG_RISCV)) {
> -+		/*
> -+		 * RISC-V has a 16 byte GOT PLT header for elf64-riscv
> -+		 * and 8 byte GOT PLT header for elf32-riscv.
> -+		 * Skip the whole GOT PLT header, since it is reserved
> -+		 * for the dynamic linker (ld.so).
> -+		 */
> -+		u32 rp_val0, rp_val1;
> -+
> -+		if (get_user(rp_val0, rp))
> -+			return rp;
> -+		if (get_user(rp_val1, rp + 1))
> -+			return rp;
> -+
> -+		if (rp_val0 == 0xffffffff && rp_val1 == 0xffffffff)
> -+			rp += 4;
> -+		else if (rp_val0 == 0xffffffff)
> -+			rp += 2;
> -+	}
> -+	return rp;
> -+}
> -+
> - static int load_flat_file(struct linux_binprm *bprm,
> - 		struct lib_info *libinfo, int id, unsigned long *extra_stack)
> - {
> -@@ -789,7 +813,8 @@ static int load_flat_file(struct linux_binprm *bprm,
> - 	 * image.
> - 	 */
> - 	if (flags & FLAT_FLAG_GOTPIC) {
> --		for (rp = (u32 __user *)datapos; ; rp++) {
> -+		rp = skip_got_header((u32 __user *) datapos);
> -+		for (; ; rp++) {
> - 			u32 addr, rp_val;
> - 			if (get_user(rp_val, rp))
> - 				return -EFAULT;
> --- 
> -cgit 
> -
> diff --git a/board/riscv/nommu/patches/linux/readme.txt b/board/riscv/nommu/patches/linux/readme.txt
> deleted file mode 100644
> index ea754c9920..0000000000
> --- a/board/riscv/nommu/patches/linux/readme.txt
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -RISC-V NOMMU Common Support
> -
> -This directory provides Linux kernel patches common to all RISC-V NO-MMU builds.
> diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
> index 278fb883bf..3aa5dccf08 100644
> --- a/configs/canaan_kd233_defconfig
> +++ b/configs/canaan_kd233_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
> index 691cf31748..5fab255d88 100644
> --- a/configs/qemu_riscv64_nommu_virt_defconfig
> +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> @@ -3,9 +3,6 @@ BR2_riscv=y
>  BR2_RISCV_64=y
>  # BR2_RISCV_USE_MMU is not set
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Busybox with hush
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>  
> @@ -22,7 +19,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_virt"
>  BR2_LINUX_KERNEL_IMAGE=y
>  
> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
> index b31bc1309b..d2bac9e0b8 100644
> --- a/configs/sipeed_maix_bit_defconfig
> +++ b/configs/sipeed_maix_bit_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
> index e42c3ee425..e1c9dc417e 100644
> --- a/configs/sipeed_maix_bit_sdcard_defconfig
> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
> index d071e5d380..a7f0441e53 100644
> --- a/configs/sipeed_maix_dock_defconfig
> +++ b/configs/sipeed_maix_dock_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
> index d1a1b2886d..6b7f8d9c68 100644
> --- a/configs/sipeed_maix_dock_sdcard_defconfig
> +++ b/configs/sipeed_maix_dock_sdcard_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
> index 3055379db4..a68f9d3b72 100644
> --- a/configs/sipeed_maix_go_defconfig
> +++ b/configs/sipeed_maix_go_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
> index 65a6815c20..a127872cd8 100644
> --- a/configs/sipeed_maix_go_sdcard_defconfig
> +++ b/configs/sipeed_maix_go_sdcard_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
> index 50c59bd4ad..c52adb5db7 100644
> --- a/configs/sipeed_maixduino_defconfig
> +++ b/configs/sipeed_maixduino_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # Binary format
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-cpio.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
> index 5785d7acf3..baaa2bc7bb 100644
> --- a/configs/sipeed_maixduino_sdcard_defconfig
> +++ b/configs/sipeed_maixduino_sdcard_defconfig
> @@ -10,9 +10,6 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
>  # BR2_RISCV_USE_MMU is not set
>  BR2_RISCV_ABI_LP64D=y
>  
> -# Patches
> -BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
> -
>  # System
>  BR2_BINFMT_FLAT=y
>  BR2_BINFMT_FLAT_ONE=y
> @@ -21,7 +18,7 @@ BR2_BINFMT_FLAT_ONE=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
>  BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/linux-sdcard.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
