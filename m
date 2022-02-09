Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F01C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487C460E43;
	Wed,  9 Feb 2022 22:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSZEld1H0gko; Wed,  9 Feb 2022 22:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8968E60E40;
	Wed,  9 Feb 2022 22:58:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8894E1BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7754560E40
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNqWAi05zaIT for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:58:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id A827B60E3F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:58:06 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HvuWnZ8cwks1JHvuWnJdlw; Wed, 09 Feb 2022 23:58:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644447485; bh=pB3TbFb6mv7v8Guual6bCWkq2zEPut6jSdsTl7kcI64=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jN0JMeI278/dt59SdBdbxuHeNcBcsF/wyGm2eny9Jc0ccC1AMwzZe9aepvXvullQ2
 bRhE0hQn9+Fu/Z1cignbiLGW1Coo0XiRxK6bhXu1o08rVMNxAJdcYDUqTn1vHJzrmX
 DkQ+Rwvc2AT0E3qjMXDsv/di7Ie+o6DZrv+3Z5zpUwhLQS/qRNuChpYuTNX/5U6hVn
 2z8CBWQPSkirTM20stJk0OkTMxZ8chLBDhA0PezJsn8rDbVzISUqUQw/rS25cf3aEy
 cpSHAuBnhMlua737H47xMOZl0e15f3BzSZfiMkEL4o2+eGUyGgJjkC+6EUFlXVLWpn
 +7ovvQk/kncsQ==
Message-ID: <2135e397-ab3a-8f85-0715-671b8c7382b7@benettiengineering.com>
Date: Wed, 9 Feb 2022 23:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220125054956.27492-1-peterlin@andestech.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220125054956.27492-1-peterlin@andestech.com>
X-CMAE-Envelope: MS4wfJ9dUKB4CnMiYEY9I+8pAAWxTHZl1VjCKBIydsY3tkqgVs0AQShdagp+X6jnBPAinFRPeaKeM42LC3kJEWgxJzQFKM+seNnyQ2DloS2QtuppW9PHtvsf
 WGT3/UHMnZahOy2nSPM3bcRH2g8F+6BFV3hla8oZ5BhtjwAq1qzyPX0NAe1jITwcn/UtzQ7wXuH0/p/ye9/dM0Yog9+kAp6EJuixVhDvLl10hKy0TYKwWD/q
 Z6MT3NscsbqRa3KGVNwe+Btr3X3tTPA50BcXE4jUbj0=
Subject: Re: [Buildroot] [PATCH v2 1/3] board/andes: rearrange nds32 folder
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

On 25/01/22 06:49, Yu Chien Peter Lin wrote:

I would add also:
"Rearrange nds32 folder structure to add different boards"(or SoCs)

> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> ---
>   .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
>   board/andes/{ => ae3xx}/readme.txt                              | 0
>   configs/andes_ae3xx_defconfig                                   | 2 +-
>   3 files changed, 1 insertion(+), 1 deletion(-)
>   rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>   rename board/andes/{ => ae3xx}/readme.txt (100%)
> 
> diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> similarity index 100%
> rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> rename to board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
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

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
