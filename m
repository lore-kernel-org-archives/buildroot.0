Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C84C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA57A60E4E;
	Tue, 18 Jan 2022 17:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gu6u4KbatgXn; Tue, 18 Jan 2022 17:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CAC60E4C;
	Tue, 18 Jan 2022 17:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE0B1BF59D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49F3381420
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 17:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wnG6ArCTAWN for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 17:33:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE85F813D8
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 17:33:13 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9sM2nkmUrX0z79sM2nkSrI; Tue, 18 Jan 2022 18:33:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642527192; bh=zxFpOPFakOXtLBFh00dY4s5CfBfJvd1jkgZLDYqAy3s=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Pv5uPdNprb5fQXipfoPe76KCWfXgQ9MkVE6HMI5v+ydCfxEvlcb9Toi2KkhCBmiFt
 Vc/EnPrM7b9vI6M5ZaZ01bYZU8a8kKY6gopvZu+DqvCxM4c3Nbqs29lwCJL7kPeLsg
 v3r1dUPSq/N2Q9M8DcJuPOJRwTKBVYCwB4UJDpb2TWPSkR8ekU1LIeJmei0YGzjrxR
 5e7XPp21yc/qMbExwo6W62fE6BQGLUkvWz20Q4LGlF9CmATCNgBNP9XmPfGlUma/CU
 vdGyxvzscavzWqRsdQ3l5S9HZLGmlhLGv7wkPc2lQv4vwLSG37oYlh3vrss+cZ0Oqr
 BvdmEt5j/Fwtw==
To: buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <4ac1fff6-a7ff-063e-82f7-7b1d198ef0a6@benettiengineering.com>
Date: Tue, 18 Jan 2022 18:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118104338.2081259-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBqZgZCgqtW09VWZ6EbbeAvKSG2dLj3oCgOfzR5zJYbifkbyW944jcOystF37ZpFp3IjI3BVV0wlAJ3vk4D8VrVm6pxrJq7nWTaQso/lJi+n25MUK8Fk
 c6V7zBHjES/s2+/bY1+e/krQAVrlabc8Svi9DuEnp3PHHnoSQy03JP/swOykqLUgTYOiK4iDGrAqRds/l6RvH4Z95uoFw+TFjYoybBlDtS5Jc70oyDzPqdOz
 v4uV9V+E3wVCUcFOJPty1TGogxjLn2ybOnmlywONMMjRRG17POcnQ8FUeQbriWaCCVcbFA+UQyEBiG2glcg2FcgfM+uxw6gG4KGUhlUk8pwXqRblB4Z4vpTZ
 rqPAZGDDGDgc5amj279cG97Hz6mmZk/ndc/HsjjaNlIVwnAZ1d7H72ESZuis/Cxz/9EqD1SVStBeArqOpAZjEzl3BdmmRT/kGu2plbIY76aRrVMcllGp3qZL
 RLzfeMEDCPr8p5mzWZilsWM4vAKCCNUHBS9H+y+C2pHLLis+KHWTvTCt+sQsi5HNXjItAl65MWDtjtW+Bet0zM710vZSaImKq63j1hSTXQcSZJ8dDxH/UH1x
 sWhMAdqikYS8nk1nFkmIPrVbiiqTMGQoq9nOde4kpgO/DA/9bdM4DhbIyvnYmZYvG3RUQDMvKUuY4vopi2nhxS4kmmo4CeVBK9Ca/i4+7c+3cFnv3AYdRL3C
 R3UmoUwhB4Q8EUHOiQR7H0qEUVLdEJxjJrNtPzhD8dL3CvFLl1BKsw==
Subject: Re: [Buildroot] [PATCH 01/28]
 configs/acmesystems_acqua_a5_256mb_defconfig: enable NEON/VFPV4 FPU
 strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Davide Viti <zinosat@gmail.com>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On 18/01/22 11:43, Giulio Benetti wrote:
> As pointed by SAMA5D2 Datasheet[1]:

As pointed by Edgar on Patch 02/28 Acqua A5 doesn't have a SAMA5D2 but a 
SAMA5D3 that doesn't have VFPV4+NEON, but a VFPv4-D16 and NEON, so this 
can't work.

I've marked it as Rejected in Patchwork as patch 01/28 and please drop it.

Thank you and sorry for the noise.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ```
> The Cortex-A5 NEON Media Processing Engine (MPE) extends the Cortex-A5
> functionality to provide support for the ARM v7 Advanced SIMD v2 and
> Vector Floating-Point v4 (VFPv4) instruction sets.
> ```
> 
> So let's enable VFPV4/NEON FPU strategy instead of the default VFPV4-D16.
> 
> [1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA5D2-Series-Data-sheet-ds60001476G.pdf
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/acmesystems_acqua_a5_256mb_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index f8129f3780..991de4c1be 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -1,5 +1,6 @@
>   BR2_arm=y
>   BR2_cortex_a5=y
> +BR2_ARM_FPU_NEON_VFPV4=y
>   BR2_ARM_ENABLE_VFP=y
>   BR2_ARM_INSTRUCTIONS_THUMB2=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
