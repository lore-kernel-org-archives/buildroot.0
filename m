Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F818ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 625F641A42;
	Fri,  9 Sep 2022 14:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625F641A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3u4YEGGwhWAI; Fri,  9 Sep 2022 14:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FB041A45;
	Fri,  9 Sep 2022 14:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FB041A45
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0311BF370
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A8576FB0F
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 14:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8576FB0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvvK_uNqAdRS for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 14:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC65160A97
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC65160A97
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 14:47:05 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WfHZoKd08yUocWfHZol7Um; Fri, 09 Sep 2022 16:47:02 +0200
Message-ID: <e669a83d-5721-7ff6-4108-2ec043f08d82@benettiengineering.com>
Date: Fri, 9 Sep 2022 16:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20220909140241.909074-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220909140241.909074-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfKMGIW9xgkbso5eiQyilUn4gwEgi9HdnH/8FoQRt+/BB9+fwB/dktIWkFLN3yBnHnukqOejYs8U4EI0L9ZoSJaBg/0A0E/obzYRPpX+k7GmcDkNpN6C3
 Q0d6gLRKmxIMv95QtT1+D9EbKjFXSBzrXJNhf3mQSG15i7YbNfn5iRqB03pE96QE+2DMpuE/YHpJyk5BAKu1ik5LPL49upOeFTYKTrIzD/n56ynarCYYCnpk
 +/LM07Gk0t8hEV4zBW4NtsYmHqpjUk4r8ioY8fq6lqaFQdNVge+qrjfO4MYJeSUMIDoWgaICbQAJ/JWv5AGscjVJlaOooV+yYoymzbKHjy+EnKuJwV9YMua2
 zJQSv4nWvYy3lIIskmABZrCFdQXMDASt5yRn7gx3u3M/nb5CVyTkrUIMjPtV+eXnQJgbqidV5SYDyQM6Dq5eEYQEriqG3+P+Yjda3LLDoqHJTDDryE8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662734822; bh=qHSL6UGptZ07V13zfwDAlc2Q/KOmBtMU2+V7ZJi5OVE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=krTGXqdZ/vd8L2+lH7sD+CYhidDppp7b6QILjDYw+uhibPVRxYP7cOv/LsX0CIeO0
 uX0FVqONgwzEM9KeLi/5eExLRhcukcGKNyyfjBQg3T4VWNk54sQEnxPMBKSD0mh0IU
 9NSpGMhy8HEKCEamYoSVnJyrOtItjW/sr2S/wmDNF3B/5SllG9UpfB4lnEQFeKNKRs
 Q98sRsNmxVE78HqhYOssxwGjGjV2/RF9fgnxms4epzD5Z/4ONrBl5VNUEDuQB0WSgq
 HLYsEtbqkAcxgTUlFm0ZHjytw+OtEHkSfDIKeUYA/p6kADhp2GUstYhmEDwVp8H7b9
 NAw1K/0irPWFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=krTGXqdZ
Subject: Re: [Buildroot] [PATCH v7 0/2] Add support for BSH smm s2 [pro]
 boards
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

thank you but this was not needed since patchwork already combines the
various tags.

Best regards!
-- 
Giulio Benetti
Benetti Engineering sas

On 09/09/22 16:02, Dario Binacchi wrote:
> The series adds support to BSH smm s2 [pro] boards.
> 
> Changes in v7:
> - Add Giulio Benetti Reviewed-by tag.
> - Add Heiko Thiery Reviewed-by tag.
> 
> Changes in v6:
> - Change offset in imx-boot partition of genimage.cfg from 33k to 32k.
> 
> Changes in v5:
> - Update the commit description.
> - Bump the kernel version to 5.19.7.
> - Remove the 0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
>    patch.
> - Regenerate all added patches (Linux kernel and U-boot) so that they contain
>    the [PATCH] header without numbering.
> - Add patchwork link to U-boot patch.
> 
> Changes in v4:
> - Update the commit description.
> - Bump the kernel version to 5.18.19.
> - Shrink the Linux configuration.
> - Add 3 dashes to the kernel patches to avoid having the version history
>    to fall into the final commit log.
> - Add lore.kernel.org links to the submitted patches.
> - Apply the 0003-Revert-Revert-mtd-rawnand-gpmi-Fix-setting-busy-time.patch
>    to the kernel.
> 
> Changes in v3:
> - Update the commit description.
> - Bump U-Boot to version 2022-07.
> - Remove U-Boot patches merged in version 2022-07.
> - Update the Linux patches.
> 
> Changes in v2:
> - Drop the patch that added the 'uuu' package. It has been merged.
> - Patch 1/2: "configs/imx8mn_bsh_smm_s2_defconfig: new defconfig":
>    - Change commit subject and description.
>    - Update linux patch to version 4. It hasn't been merged yet but has
>      been reviewed. This is the most up-to-date version.
>    - Replace `Co-developed-by:' tag with `Co-authored-by'.
>    - Use the buildroot's output directory if the binaries directory is
>      not passed as a parameter to the `flash.sh' script.
>    - Replace the linux.config file with an architectural defconfig and
>      a config fragment for the changes.
>    - Remove useless and deprecated statements in nand-full.lst.
>    - Remove the buildroot configurations for ext2/ext4 filesystem creation.
> - Patch 2/2: "configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig":
>    - Change commit subject line.
>    - Use the buildroot's output directory if the binaries directory is
>      not passed as a parameter to the `flash.sh' script.
>    - Replace the linux.config file with an architectural defconfig and
>      a config fragment for the changes.
> 
> Dario Binacchi (1):
>    configs/imx8mn_bsh_smm_s2_defconfig: new defconfig
> 
> Michael Trimarchi (1):
>    configs/imx8mn_bsh_smm_s2_pro_defconfig: new defconfig
> 
>   DEVELOPERS                                    |   8 +
>   .../common/imx8mn-bsh-smm-s2/linux.fragment   | 895 ++++++++++++++++++
>   board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |   4 +
>   board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      |  23 +
>   board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  |  17 +
>   board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |   7 +
>   board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |   3 +
>   board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    |  73 ++
>   board/bsh/imx8mn-bsh-smm-s2/flash.sh          |  26 +
>   board/bsh/imx8mn-bsh-smm-s2/nand-full.lst     |  29 +
>   ...ine-mxs-use-platform_driver_register.patch |  45 +
>   ...2-dmaengine-mxs-fix-section-mismatch.patch |  39 +
>   ...Remove-rootwait-1-to-all-the-affecte.patch | 160 ++++
>   board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
>   board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
>   configs/imx8mn_bsh_smm_s2_defconfig           |  40 +
>   configs/imx8mn_bsh_smm_s2_pro_defconfig       |  41 +
>   17 files changed, 1489 insertions(+)
>   create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-use-platform_driver_register.patch
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0002-dmaengine-mxs-fix-section-mismatch.patch
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
>   create mode 100755 board/bsh/imx8mn-bsh-smm-s2/post-build.sh
>   create mode 100644 board/bsh/imx8mn-bsh-smm-s2/readme.txt
>   create mode 100644 configs/imx8mn_bsh_smm_s2_defconfig
>   create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
