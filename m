Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C07C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632724211B;
	Sat, 16 Dec 2023 09:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 632724211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pE8RmegKd9yB; Sat, 16 Dec 2023 09:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE1D4209D;
	Sat, 16 Dec 2023 09:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE1D4209D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E660D1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE85640146
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE85640146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqu8OcGX0bJa for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:50:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E85740123
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E85740123
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E8C11BF203;
 Sat, 16 Dec 2023 09:50:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rERJK-00FOvB-1e;
 Sat, 16 Dec 2023 10:50:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20231213134849.2822206-1-neal.frager@amd.com>
Date: Sat, 16 Dec 2023 10:50:18 +0100
In-Reply-To: <20231213134849.2822206-1-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 13 Dec 2023 13:48:49 +0000")
Message-ID: <877clebhnp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kd240_defconfig:
 new defconfig
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds support for Xilinx Kria KD240 starter kit.
 > KD240 features can be found here:
 > https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html

 > While the Kria SOM is based on a ZynqMP SoC, there are some key
 > boot config differences from the other ZynqMP evaluation boards.

 > 1. There are no boot switches on Kria SOMs. The boot mode is thus
 > hard configured for QSPI flash. A pre-programmed boot.bin comes
 > with every Starter Kit. U-Boot can then find the Linux kernel and
 > file system on the SD card.

 > Optional instructions for updating the boot.bin in the QSPI flash
 > can be found in the readme.txt file and the link below.

 > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

 > 2. Kria SOMs use UART1 for the console instead of UART0. For this
 > reason, Kria Starter Kits will use a separate extlinux.conf file
 > from other ZynqMP evaluation boards.

 > 3. The KD240 has a USB to SD card bridge, so the Linux kernel
 > and file system are found on /dev/sda1 and /dev/sda2.

 > 4. The following patches have been submitted upstream to u-boot.
 > Without these patches, the usb, sd card and ethernet peripherals
 > do not work correctly.

 > https://patchwork.ozlabs.org/project/uboot/patch/20231213134007.2818069-1-neal.frager@amd.com/
 > https://patchwork.ozlabs.org/project/uboot/patch/20231213134052.2818879-1-neal.frager@amd.com/

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  DEVELOPERS                                    |   1 +
 >  board/zynqmp/kria/kd240/kd240.sh              |  16 +
 >  ...nqmp-Fix-k24-psu_init_gpl.c-clocking.patch | 400 ++++++++++++++
 >  ...ynqmp-Add-output-enable-pins-to-SOMs.patch |  79 +++
 >  board/zynqmp/kria/kd240/pm_cfg_obj.c          | 494 ++++++++++++++++++
 >  board/zynqmp/kria/readme.txt                  |  21 +-
 >  configs/zynqmp_kria_kd240_defconfig           |  42 ++
 >  7 files changed, 1045 insertions(+), 8 deletions(-)
 >  create mode 100755 board/zynqmp/kria/kd240/kd240.sh
 >  create mode 100644 board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch
 >  create mode 100644 board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch
 >  create mode 100644 board/zynqmp/kria/kd240/pm_cfg_obj.c
 >  create mode 100644 configs/zynqmp_kria_kd240_defconfig

I've fixed the check-package warnings and applied, thanks.

board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch:4: generate your patches with 'git format-patch -N'
board/zynqmp/kria/kd240/patches/uboot/0001-arm64-zynqmp-Fix-k24-psu_init_gpl.c-clocking.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch:4: generate your patches with 'git format-patch -N'
board/zynqmp/kria/kd240/patches/uboot/0002-arm64-zynqmp-Add-output-enable-pins-to-SOMs.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
