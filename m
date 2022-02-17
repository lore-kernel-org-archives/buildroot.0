Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC128C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A54F80F5C;
	Thu, 17 Feb 2022 15:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jzt8D_gksuBw; Thu, 17 Feb 2022 15:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE57C80CE3;
	Thu, 17 Feb 2022 15:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C93B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 488CA801E2
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u45qFXzPfl5i for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:58:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F55984034
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:58:29 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KjAqntNmkvHpTKjAqn00po; Thu, 17 Feb 2022 16:58:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645113509; bh=noimaVmR+qFkUHbb0bEv4imWEfnVf8p6W4KKpogxYtQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UPVgdCG9/KQdxN+oX9sFszJlR3aWqKjDMhmZMhiiyOZmF3sTCAmBzkfnl/loywrxK
 PQX/VQxL9VWXICzXc4urX48KetOqIOuUKeksRvbWZ2SqLxI176cTjNQAPaPo7ZCmyk
 MefoDZYggd4fImSFtS3mtZ4R0X105bTqp8GGPccw18IKGlkxciI90u7g204GzvE+2N
 +YHUk/EFtefcYVa4/gLZtIGZico19UHVgkFOrjXHiTeUeuZhhthmQiYelZzZqpkn3f
 2m7LDGpfQ75a+dBez+LS6+DMLeHH9d6ZDC/ydTMSFCI9SEsbabQ2W7ceImR8CYk5Yg
 tK6p4lTka1cpA==
Message-ID: <e4475742-30a4-57f2-d4be-8d1bfaf9720e@benettiengineering.com>
Date: Thu, 17 Feb 2022 16:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-2-marcus.hoffmann@othermo.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220217155549.1084829-2-marcus.hoffmann@othermo.de>
X-CMAE-Envelope: MS4wfGngTWypB1gAVxmSsDoZlysvXbGZc0ESKQiyqDSE7HSCiLUETUvW+3vWMNhAuoOZ30kFcjkYr3iAL+sYVRE+pC0gJiSQvpu6QtL8iWM2FmJwDbPFiXxk
 GWtXfX3TxkxmdvePHiCR0i9XP7nF4rQBdKAPK6nU/zIVzY3W/+7wKaIMKcoJ2L31dv0A1YDxeKYb6+800K1rU/J7DwK3HmiTUV0F5j3IL3TpOZMyX2lNrWzn
 cAhArjTUpTMe/6UtvONOH5Wxih4QeyCqb6vRsQ01qpM=
Subject: Re: [Buildroot] [PATCH v2 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/02/22 16:55, Marcus Hoffmann wrote:
> Fixes the following compile error:
> 
> In file included from include/bootm.h:10,
>                   from tools/image-host.c:12:
> include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
>   1178 | #  include <openssl/evp.h>
>        |            ^~~~~~~~~~~~~~~
> compilation terminated.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784200
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   configs/friendlyarm_nanopi_r2s_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
> index 818c847f4b..ce252a5d76 100644
> --- a/configs/friendlyarm_nanopi_r2s_defconfig
> +++ b/configs/friendlyarm_nanopi_r2s_defconfig
> @@ -30,6 +30,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>   BR2_TARGET_UBOOT_FORMAT_CUSTOM=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
