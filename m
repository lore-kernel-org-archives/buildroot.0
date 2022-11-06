Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E306C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 14:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD7760AC6;
	Sun,  6 Nov 2022 14:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD7760AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpOd78BiV7WK; Sun,  6 Nov 2022 14:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 230D660888;
	Sun,  6 Nov 2022 14:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 230D660888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AED11BF59F
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB34C60888
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB34C60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4GGpEbAmmYW for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 14:07:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F1E60783
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2F1E60783
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 14:07:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 928D15FFA8;
 Sun,  6 Nov 2022 15:06:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 15:06:59 +0100
Date: Sun, 6 Nov 2022 15:06:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221106140659.GT3918838@scaer>
References: <20221106125830.664168-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106125830.664168-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667743621;
 bh=3vL+Dn9f/QTxc5aWSC2Bn4flHFVdAT//ynw+RyyYGSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGQLldiA5zaf3/9tk3h62iLVIoiDBw5SX+fWvx+fPi30VNRSqqEtjJOGUqIqN5e9E
 rNuJWklZN7sW1iyDjw0UgJDWVK4EAF7HjeMm6Ysl96EoT9KsM1e4RUWxUb+xrfpxfx
 yezcsbZ/jAvyvWuj4Ur6TxFv2CwjDof1fTP0Yffq55AZzXZ+yH/3w+GHNkg+86q6++
 OJB+J8H4bMXxM2D1IEXJdA9eVxA+qzyaA+FvVB0FZIrf3KimEKPeTii0wpPo+MokG4
 WvQSqNLYJ+490jQ7hbg6PEcZr95Wztz3kl+I1VDayU0BGABf0kRUUfto5c5c6ycswU
 kP2CcoZRzTZTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGQLldiA
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix build without neon
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-06 13:58 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without NEON probably raised since bump
> to version 1.9.9-b1 in commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14
> and
> https://github.com/zlib-ng/zlib-ng/commit/ec02ecf104e1d3f1836a908a359f20aa93494df5:
> 
> In file included from /home/autobuild/autobuild/instance-4/output-1/build/zlib-ng-2.0.6/arch/arm/adler32_neon.c:11:
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>    31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8260762632cde9eb5bc2154084680b5bec034aa6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zlib-ng/zlib-ng.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index 938acd4181..aa65d8437d 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -18,9 +18,15 @@ ZLIB_NG_CONF_OPTS += \
>  	-DZLIB_COMPAT=1 \
>  	-DZLIB_ENABLE_TESTS=OFF
>  
> -# Enable NEON and ACLE on ARM
> +# Enable ACLE on ARM
>  ifeq ($(BR2_arm),y)
> -ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
> +ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1
> +endif
> +
> +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
> +ZLIB_NG_CONF_OPTS += -DWITH_NEON=ON
> +else
> +ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
>  endif
>  
>  ifeq ($(BR2_powerpc_power8),y)
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
