Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 12:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31A5606D3;
	Mon, 31 Jan 2022 12:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrhAiSl2Ozoj; Mon, 31 Jan 2022 12:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10FFC60E50;
	Mon, 31 Jan 2022 12:05:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D67AB1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D277A60E50
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xFbSVflSobs for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 12:05:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id D28F1606D3
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:05:51 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EVRMnWVNX0FuyEVRNnTRMQ; Mon, 31 Jan 2022 13:05:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643630749; bh=jyS5XxfE/kQkF4eDqy9O2wp+uTM/jvHUdQ6dig3QPQo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WGlF/gHIyowVk2MGS+Lji0G6gyG3GztyHFGREFRM+0uRNIakSCEO0bLEtP4f9d9q1
 H7hCu6n8ouhulbDp5Za0UepSv1MEhy/9FXNR6WE1VfwwBZvs5GXRwI9gV965kYZ0k3
 kuMY9yaA8d/kcBzqGZysgtkxtSds3Qo7ol2PSHI7N7g8sISrPkpCLRTKbgj8RuDPPZ
 MjkKWzru9DizANm7pGFMu9M4bcIKi3kZDE5D4+xBz2+j2+mpuTn27zlg/HcJ3M9EnO
 dEVYTq0cRBIuBBCYqfP+U38rzWAYRyZPdXY1yeaZyaKASQMgoXMOZJu7hvb7JcSTlo
 8b/Kojtpz0/7Q==
Message-ID: <48cd0534-15fc-3dda-4a39-64487b112229@benettiengineering.com>
Date: Mon, 31 Jan 2022 13:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220131081214.12773-1-geomatsi@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
X-CMAE-Envelope: MS4wfDVWhI+d8HNiY3nwHqhWfGBeVShZSmVX4rjw+l1DQPtqKxhNi6ptri3QvNy2GHDjcDWJsr7XEl3sBTqhMN5DGBXWzjeP3PDDqP7qrFWAHfYhzQYIQP6i
 XtBSL7UaxBF0m9fZlvkskG48S3TfKKyzA/92hPArItPHWDALRg+HAKLuJmAgXkMCbBl9SJ3A3+ZVOxco4v5TBC1Ha5LnGhHnQbtML2I+AJ4HGPKaxxu872PI
 AUKL2+KMgQG8YO8A9lluchNr5lpQxmIOt5NrorY/vFoGx3x1QKBDslSpMKEI72Cb5GxYUmCdM8co56nBo9xn+A==
Subject: Re: [Buildroot] [PATCH 0/5] synopsys: boards maintenance
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On 31/01/22 09:12, Sergey Matyukevich wrote:
> Hi all,
> 
> This is a maintenance patch series for Synopsys boards. Outdated
> and unused VDK configurations are removed. All the other boards
> receive Linux kernel and U-Boot updates.

Have you tested on the real boards or only check if they built successfully?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Sergey
> 
> 
> Sergey Matyukevich (5):
>    configs/snps_arc700_axs101: bump kernel and u-boot versions
>    configs/snps_archs32_axs103: bump kernel and u-boot versions
>    configs/snps_archs38_hsdk: bump kernel and u-boot versions
>    configs/snps_archs38_haps: bump kernel and u-boot versions
>    board/synopsys: remove outdated vdk boards
> 
>   board/synopsys/axs10x/uboot-fragment.config   |   1 +
>   .../synopsys/vdk/linux-vdk-aarch64-defconfig  | 143 ------------------
>   board/synopsys/vdk/readme.txt                 |  65 --------
>   configs/snps_aarch64_vdk_defconfig            |  12 --
>   configs/snps_arc700_axs101_defconfig          |  10 +-
>   configs/snps_archs38_axs103_defconfig         |  10 +-
>   configs/snps_archs38_haps_defconfig           |   6 +-
>   configs/snps_archs38_hsdk_defconfig           |   7 +-
>   configs/snps_archs38_vdk_defconfig            |  20 ---
>   9 files changed, 20 insertions(+), 254 deletions(-)
>   create mode 100644 board/synopsys/axs10x/uboot-fragment.config
>   delete mode 100644 board/synopsys/vdk/linux-vdk-aarch64-defconfig
>   delete mode 100644 board/synopsys/vdk/readme.txt
>   delete mode 100644 configs/snps_aarch64_vdk_defconfig
>   delete mode 100644 configs/snps_archs38_vdk_defconfig
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
