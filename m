Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D94C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 04:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD5140204;
	Sun,  6 Nov 2022 04:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD5140204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KT59rL8n6mWx; Sun,  6 Nov 2022 04:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE46F40144;
	Sun,  6 Nov 2022 04:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE46F40144
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8871BF2F7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 04:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 523A440144
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 04:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 523A440144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 993Q54itkmy9 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 04:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C865D40022
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C865D40022
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 04:10:14 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 2A64A07F057129;
 Sun, 6 Nov 2022 12:10:00 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Sun, 6 Nov 2022 12:09:57 +0800
Date: Sun, 6 Nov 2022 12:07:13 +0000
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Y2ejY8/mrFd/AVi+@APC323>
References: <20221104080407.25870-1-peterlin@andestech.com>
 <20221105220835.1e1fa5f0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105220835.1e1fa5f0@windsurf>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 2A64A07F057129
Subject: Re: [Buildroot] [PATCH 1/1] andes_ae350_45_defconfig: bump opensbi,
 u-boot and linux
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
Cc: tim609@andestech.com, ycliang@andestech.com, dylan@andestech.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, Nov 05, 2022 at 10:08:35PM +0100, Thomas Petazzoni wrote:
> On Fri, 4 Nov 2022 16:04:07 +0800
> Yu Chien Peter Lin <peterlin@andestech.com> wrote:
> 
> > This patch bumps following packages to the newer version:
> > - OpenSBI v1.1
> > - U-boot v2022.10
> > - Linux 6.0
> > 
> > Linux kernel is hosted on AndesTech Github which includes ethernet,
> > SD card, DMAC, RTC, WDT drivers support. OpenSBI is based on v1.1
> > with andes platfrom fdt driver, hence adding patches for U-boot to
> > update the plmt and plicsw compatible strings and modify the IPI scheme.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> >  board/andes/ae350/ae350.dts                   | 274 ------------------
> >  board/andes/ae350/genimage_sdcard.cfg         |   2 +-
> >  ...isable-PIC-explicitly-for-assembling.patch |  29 --
> >  ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 --
> >  ...001-Fix-mmc-no-partition-table-error.patch |  27 --
> >  ...-Support-DTS-of-ftsdc010-driver-for-.patch |  35 +++
> >  ...2-Prevent-fw_dynamic-from-relocation.patch |  27 --
> >  ...-tree-blob-address-at-8-byte-boundar.patch |  37 +++
> >  ...0003-Fix-u-boot-proper-booting-issue.patch |  26 --
> >  ...andes_plic.c-use-modified-IPI-scheme.patch |  43 +++
> >  ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 --
> >  ...04-riscv-Rename-Andes-PLIC-to-PLICSW.patch | 263 +++++++++++++++++
> >  board/andes/ae350/post-build.sh               |   2 +-
> >  board/andes/ae350/readme.txt                  |   4 +-
> >  .../boot/extlinux/extlinux.conf               |   2 +-
> >  board/andes/ae350/uboot.config.fragment       |   6 +-
> >  configs/andes_ae350_45_defconfig              |  16 +-
> >  17 files changed, 394 insertions(+), 449 deletions(-)
> >  delete mode 100755 board/andes/ae350/ae350.dts
> >  delete mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
> >  delete mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
> >  delete mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
> >  create mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
> >  delete mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
> >  create mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
> >  delete mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
> >  create mode 100644 board/andes/ae350/patches/uboot/0003-riscv-andes_plic.c-use-modified-IPI-scheme.patch
> >  delete mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
> >  create mode 100644 board/andes/ae350/patches/uboot/0004-riscv-Rename-Andes-PLIC-to-PLICSW.patch
> 
> It looks mostly good. Could you however:
> 
>  (1) Add your Signed-off-by inside each of the U-Boot patches you are
>  introducing, as well as provide a link to where the patches were
>  downloaded from?

Will do, but the first patch:
0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
is used in our production code only, and might not be upstreamed,
We will drop it once we updated the mmc driver in kernel.

>  (2) Remove the numbering in the U-Boot patch titles. I.e instead of
>  [PATCH 1/2], we want to see [PATCH]. Use "git format-patch -N" to not
>  have this numbering.

OK.

>  (3) Keep the correct BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_xxyz=y
>  option in the defconfig?

OK.

> With these changes, your patch will be ready to be applied.
> 
> Also, are those U-Boot changes going to be accepted in upstream U-Boot?

For 0002, here is the thread [1], it seems to be no common solution for
ARM and RISC-V based system, not sure what's the status right now.
The 0003 & 0004 have been merged recently, I'll remove them and bump
U-boot to newer revision.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20210712035231.26475-1-bmeng.cn@gmail.com/

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks for your review!

Best regards,
Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
