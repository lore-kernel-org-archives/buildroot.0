Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C9EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F0240167;
	Thu, 17 Feb 2022 15:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgAr3KbYdBlA; Thu, 17 Feb 2022 15:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE76740153;
	Thu, 17 Feb 2022 15:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 375221BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25156833CD
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7tHlpR7TnnG for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:55:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB6EB83367
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:55:52 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Kj8HntKbwvHpTKj8Inzy6W; Thu, 17 Feb 2022 16:55:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645113350; bh=AT2uiF5JbUXgr7U1ur9e/4iRJoupysd2k8pEMAEQeUE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZptMk1PPkHA+N+QyisgehIz513k19m7H7BkO88HcvNogzs53EUAcus5vmXTycQCbz
 3vIw5i2VXN3yj7rFOaeSnSTh1p7cMAgCHH1eq4Z5I+8sc/WII/TCFciKQwHczA8yVy
 ZMCX3ELgZkWIY81XyHK3nRMAKOGel2yhXSD6IJvGIXd+DzmEIkJJ7YPWP0FMX7HNnY
 pnSy6N6RktfXlBrN8pJJs3ZWfMSQGH/VLgBR4agtZPGSbxB8AfKFTAw8z5OjG+l95H
 z2p+OBCBJXIQ3PUDGYK2cty3mFdU+3zRYH/yjxoqnguuExjO9vxNWzDH/VOxjC3O1h
 xOlnlMgxovTBw==
Message-ID: <b7e77527-b4a2-e0ea-90d9-eebc08a9ac62@benettiengineering.com>
Date: Thu, 17 Feb 2022 16:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220215053327.4046-1-peterlin@andestech.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220215053327.4046-1-peterlin@andestech.com>
X-CMAE-Envelope: MS4wfC4Qh4ez3xWaV7KN0oLVwGs/8Qpe1NNYQDII3DezVwVOp7ZW+bb08Xv/nl9+YYaijSZmGQpv7xwwMJGW6dhN0MSM/+1uWlvsfC7inysh/Rek8sk1VUGu
 fexRImiOO64QBYfy4E0hL//ktRQmkMeTpxFIXeE7Bw74884hsAZ+Vtx7ULkd7IUiga33xtCrAr/b6eDP0GFdifs419zm1VDy1Fe2y93zkodIMhXXxSbz0qBm
 wHN1gjn5LB445wMVEtFFT9VvUQunxRhnP8Mo84AWdAM=
Subject: Re: [Buildroot] [PATCH v3 1/3] board/andes: rearrange nds32 folder
 structure
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
Cc: alankao@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 15/02/22 06:33, Yu Chien Peter Lin wrote:
> Rearrange nds32 folder structure to add AE350 platform.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> ---
>   .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
>   ...2-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch | 0
>   board/andes/{ => ae3xx}/readme.txt                              | 0
>   configs/andes_ae3xx_defconfig                                   | 2 +-
>   4 files changed, 1 insertion(+), 1 deletion(-)
>   rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>   rename board/andes/{ => ae3xx}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
>   rename board/andes/{ => ae3xx}/readme.txt (100%)

Here we have both:
board/andes/ae3xx
and
board/andes/ae350

ae3xx should be use for every ae3xx family(ae350 included), but for 
ae350 you use a specific folder.
What I see digging into ae3xx is that it is for FPGA demonstration, so I 
would move ae3xx directory to be name as ae3xx-fpga. Otherwise I would 
expect ae350(and newer parts) to be part of ae3xx.

Same goes for the defconfig, I would name it like:
andes_ae3xx_fpga_defconfig

This way we can divide the 2 typologies:
- fpga demonostration for ae3xx
- ae3xx SoC family

Otherwise you should provide a single family folder(ae3xx) compatible 
for both fpgas and SoCs.

Thank you

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> similarity index 100%
> rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> rename to board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> diff --git a/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/ae3xx/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> similarity index 100%
> rename from board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> rename to board/andes/ae3xx/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> diff --git a/board/andes/readme.txt b/board/andes/ae3xx/readme.txt
> similarity index 100%
> rename from board/andes/readme.txt
> rename to board/andes/ae3xx/readme.txt
> diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
> index 52634caa50..18051115c3 100644
> --- a/configs/andes_ae3xx_defconfig
> +++ b/configs/andes_ae3xx_defconfig
> @@ -1,5 +1,5 @@
>   BR2_nds32=y
> -BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
> +BR2_GLOBAL_PATCH_DIR="board/andes/ae3xx/patches"
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
>   BR2_LINUX_KERNEL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
