Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC5C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E942F415E0;
	Tue, 13 Feb 2024 17:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kqNIHZoHtat; Tue, 13 Feb 2024 17:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE77402AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE77402AB;
	Tue, 13 Feb 2024 17:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AED2B1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9966D402AB
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoIVurDGwlLc for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FE394010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE394010C
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE394010C
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:44:09 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZwpBraCuIPNlaZwpBryhbX; Tue, 13 Feb 2024 18:44:05 +0100
Message-ID: <bc6f9eec-71e5-4a68-b3ac-fd1f545a4fac@benettiengineering.com>
Date: Tue, 13 Feb 2024 18:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240211120857.6622-1-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240211120857.6622-1-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfEzrhzmKpDb/RA9garM0qBSfQKKHwikZKGJnsqmqMDZhT5YCUe3clUnJtkAatFiJsBScy/TENJI1A9wH88lpP5oMn+pr0FyyK7uy11bJvLJ/OCcapB++
 oi4Ux0oWaoYqiLAanOkXTa1svCxTwCIkDmXQTGh6o9FTfQWwVF9k0SCu72YFZeTSEGaC8nfpq+kXrICOVCg3tfMvU4ESh3QvtEuARrr6TXDiZlF8NaLLK/Qs
 77meW77DCBDzo1cUW8aL6UA0jwDEdOibYaK8QesCGhM+dPqeBg0/O/8PD1+CUi0eGkklWmxkusDSPl+z/SeScl0jvoVF2+9f2LUBMKZDsM8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707846245; bh=2So5Mjrd/2h6uyeHY2ZC+/akkNCSK+3LrcFkGCLdjII=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=n6l+SJE2cMoiyw2J7VMdgJzytrSbwq1PPiCKg7tB9FI5SKoCYvo8aqh3EjKT4jEJh
 uj9xWvlPrqpD0ZqF02h7McddBdCFx8d008golXmnqQ4FvWzuDqagtEYE0Z9uD1uQsC
 BnKZ5Dvvw3grzzjKL1oYJ7wso9vz/sMrCIkvsFWFoNtR1isL0a9jdBOrwhKj8Oxrbr
 C2y/WgoSpYRnpv1vDTnLMrOr95ocB2GtPB7Tu7le+Ho6xofFWlxF60OTGxg+6v+Zfa
 C4SKPrceWyy3fPxXxN+7inq8gMv5xKN99VBgs+2InH7ApRaTvsK7kZkvbRT1gkuQt6
 g1xaBNHhvoqNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=n6l+SJE2
Subject: Re: [Buildroot] [PATCH v3 0/2] Add board support for the
 BeagleV-Ahead
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 11/02/24 13:08, Kilian Zinnecker via buildroot wrote:
> This patch series adds board support for the BeagleV-Ahead.
> 
> This patch series introduces a package which fetches binaries for the
> SoC, i.e., one binary blob for an on-chip FPGA and one binary blob for
> audio. Currently they are not used, but are intended to be used in the
> future.
> 
> This board support generates an image suitable for SD card. The boot
> command for uboot to boot the kernel could not easily be changed. It
> seemed that a default boot command was persisent and any change to it
> by normal means (e.g., uboot config parameters like
> CONFIG_BOOT_COMMAND) did not have any effect. Hence a patch for the
> custom u-boot is introduced for now, to insert the proper boot
> command.
> 

please report the patches changelogs in the patches most of all.
It's useful there while reviewing, more than here where it should be
a brief explanation.

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> v2 -> v3:
> 
>    - Added brief description what the xuantie bin binaries are for
>    - Unrolled loop in XUANTIE_BINS_INSTALL_IMAGES_CMDS of
>      package/xuantie-bins/xuantie-bins.mk
>    - Added a second product page link to board's readme.txt
>    - Added URL to the product page to git commit message
>    - Dropped "_CUSTOM" from all "BR2_RISCV_ISA_*" in the board's
>      defconfig
>    - Add description to the board's readme.txt and defconfig  why GCC
>      v13 is chosen
>    - Added BR2_PACKAGE_HOST_DOSFSTOOLS to board's defconfig
> 
> v1 -> v2:
> 
>    - Added hash file for xuantie-bins package
>    - Now uses uEnv.txt for actual boot commands
>    - Removed extlinux.conf
>    - Removed superflous comments inside config files
> 
> 
> Kilian Zinnecker (2):
>    package/xuantie-bins: new package
>    configs/beaglev_ahead: new defconfig
> 
>   DEVELOPERS                                    |  3 +
>   board/beaglev-ahead/genimage.cfg              | 62 +++++++++++++++
>   board/beaglev-ahead/linux.fragment            |  2 +
>   .../0001-Overwrite-bootcmd-by-force.patch     | 30 +++++++
>   board/beaglev-ahead/post-image.sh             |  6 ++
>   board/beaglev-ahead/readme.txt                | 78 +++++++++++++++++++
>   board/beaglev-ahead/uEnv.txt                  |  4 +
>   board/beaglev-ahead/uboot.fragment            |  2 +
>   configs/beaglev_ahead_defconfig               | 46 +++++++++++
>   package/Config.in                             |  1 +
>   package/xuantie-bins/Config.in                |  8 ++
>   package/xuantie-bins/xuantie-bins.hash        |  1 +
>   package/xuantie-bins/xuantie-bins.mk          | 23 ++++++
>   13 files changed, 266 insertions(+)
>   create mode 100644 board/beaglev-ahead/genimage.cfg
>   create mode 100644 board/beaglev-ahead/linux.fragment
>   create mode 100644 board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
>   create mode 100755 board/beaglev-ahead/post-image.sh
>   create mode 100644 board/beaglev-ahead/readme.txt
>   create mode 100644 board/beaglev-ahead/uEnv.txt
>   create mode 100644 board/beaglev-ahead/uboot.fragment
>   create mode 100644 configs/beaglev_ahead_defconfig
>   create mode 100644 package/xuantie-bins/Config.in
>   create mode 100644 package/xuantie-bins/xuantie-bins.hash
>   create mode 100644 package/xuantie-bins/xuantie-bins.mk
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
