Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392EBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD54440280;
	Sun,  6 Feb 2022 11:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCULC3PngHKS; Sun,  6 Feb 2022 11:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA7240287;
	Sun,  6 Feb 2022 11:14:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C50E1BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7787C60B48
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLM-jHec-V1m for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF3860625
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:14:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ka4so33738089ejc.11
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 03:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RwkjDXZ6SaUI2El1Ev12YUPKDtsk1fO7qQuZ1WSfAbY=;
 b=aDkVgobrZ0gQa5QDcYDPO2VGVQLHshDBfxRXV8L+nWyDhAR1U2ZQbhJuyXU52K1V49
 +9zqdYatQuNemoGSFXUVjzBZC7s7S8keDaPmNuKPyujbBeIsWuseyo560GQkHYUG2Mmn
 ixuUEXY5jIBaK4NRUZYmthKag7BRUEOdyEflIgg2XjVkF164g9UQQbYTGq0vskQx5cvR
 tA1AoGJm3DbiqWyRjTG3uIx0AIGlZzYeBJF4XRaODzxCb7SCNCLThUnTLp7s+yU+6NgI
 tjo3g9AShUB+mq6DNULBpRx87sJ0Pzg2pie0gD0gBa6m1+tlkfy9lEzhBgGJxgifq6Qu
 ufrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RwkjDXZ6SaUI2El1Ev12YUPKDtsk1fO7qQuZ1WSfAbY=;
 b=U6yrCebMpYSxvTG2iJ5OzCZs3BxfBwh4KyubS/bboqxewbn3uBfcmBRxnDUan+9WWD
 HDRyL1sJ+FanPejgmTf7n0tWqzFl7p4BFp1QGtoU67zzGm0OFba/M5vkRNHVEjudFBZg
 4yVd5tX4xFFBZHvnBK9WTx4ONwLHgwuhi1I9Crimnn1dZ576YcggK+WBnIOOFSqKGOVZ
 BnOPiRCqWO0ox3AIwLBwDhZPKYYcdjh5Ax5FyM53EkDNoQA1ncjSDeb9OyB6RPEEGeJd
 JtAFpBWJLpkR8aNzAehETPSQOdI4vK3XGue4RVrPFK5fG0D1fOEi+lzUe9GjMgHDkuF6
 l3Bw==
X-Gm-Message-State: AOAM533IcH1j8WbarWyru3LqezyBExtfqeOocSLAPGEAqwkKZfFdqfuE
 n36Urtr3MaPPxuZ2EpzKmwQswg==
X-Google-Smtp-Source: ABdhPJzNUG4tKfThVO6p5bVgtJLQFqaUKTP8toNtcdqHVC+SCLZpbSsHglr9pe/NSNXVoel0Q5mTvA==
X-Received: by 2002:a17:906:d551:: with SMTP id
 cr17mr4016339ejc.392.1644146049133; 
 Sun, 06 Feb 2022 03:14:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h16sm2495386ejj.56.2022.02.06.03.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 03:14:08 -0800 (PST)
Message-ID: <bf7f8c67-a1b2-e912-7579-780ef99d180e@mind.be>
Date: Sun, 6 Feb 2022 12:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] toolchain: update gcc bug 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 10:08, Giulio Benetti wrote:
> Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
> fixed on gcc 11.x, so let's update bug conditions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   toolchain/Config.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index ccdf62503d..aed8f393a3 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -185,11 +185,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>   # Error: branch offset out of range on Nios II. This bug
>   # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been

  If this statement is true...

> -# fixed on gcc 10.x.
> +# fixed on gcc 11.x.
>   config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>   	bool
>   	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11

  ... then this should be

	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11

  We don't have a nios2 GCC9 toolchain in the autobuilders so we'll never 
notice, of course.

  Regards,
  Arnout

>   	depends on BR2_nios2
>   
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
