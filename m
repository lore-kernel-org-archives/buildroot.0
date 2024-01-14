Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1F9C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33BF741830;
	Sun, 14 Jan 2024 11:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33BF741830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9M_KGxqY4AmF; Sun, 14 Jan 2024 11:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601EF41836;
	Sun, 14 Jan 2024 11:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601EF41836
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 665DC1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 382BA60BDE
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382BA60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLytipDtsTcc for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:11:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECF2C60BEB
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF2C60BEB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BAD9313F8A7;
 Sun, 14 Jan 2024 12:11:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 12:11:01 +0100
Date: Sun, 14 Jan 2024 12:11:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaPBRc4jfREsr0rz@landeda>
References: <20240114101619.7120-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114101619.7120-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705230665;
 bh=Eq/AtF7QEbdXgfsluP6rToNmldIt+6Cx+tFqVUv+0n4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfYhBjSuG/zVidk1vxJ0lmu9+94hb/b0Etm4SHVxTut9M9hDbcjZNIOQWv33pIAnc
 ye4RorZL9YWkew4FF6vD0fNLqvMoKcB+xAKrE3yjIpWhyZDcpj61GjJDta6/9ours5
 sVHH95ojUiktnCpxYOVxG9Dzyu0E5UlqdLuX4UkS+/IOkJerk2tB2o9OLo7Rs+S3UH
 ZbYR0djQYi41TuBiHqgxU87/sc/CUOagWSYAkI+ixYnyZUjp7VKczHhf+GhPrrACpA
 U97t/oyReVpjhjTBHKuuDhJi5mMk+Z230CK+zWreIkbGeI3+VwTCIkUBGm+7/gdJN9
 U/H3EiBo2VCfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sfYhBjSu
Subject: Re: [Buildroot] [PATCH 1/1] package/criu: disable on aarch64_be
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-14 11:16 +0100, Fabrice Fontaine spake thusly:
> armv8a aarch64_be raises the following build failure since the addition
> of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:
> 
> Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
>  - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/criu/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> index fc0da823b3..02d000e49b 100644
> --- a/package/criu/Config.in
> +++ b/package/criu/Config.in
> @@ -1,10 +1,10 @@
>  # criu only builds on certain architectures
>  config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_ARM_CPU_ARMV6
> -	default y if BR2_ARM_CPU_ARMV7A
> -	default y if BR2_ARM_CPU_ARMV7M
> -	default y if BR2_ARM_CPU_ARMV8A
> +	default y if BR2_arm && BR2_ARM_CPU_ARMV6
> +	default y if BR2_arm && BR2_ARM_CPU_ARMV7A
> +	default y if BR2_arm && BR2_ARM_CPU_ARMV7M

armv6 and armv7 can never be aarch64, so there is no need to guard them
with BR2_arm. Also note that this also disables for armeb, not just
aarch64_be.

Unless you meant this commit to mean "disable for armeb and aarch64_be"?

> +	default y if BR2_arm && BR2_ARM_CPU_ARMV8A

This also disables armv8 for armeb. Is that expected?

If it is just about disabling for aarch64_be (and nothing else), then
I'd prefer the condition to be written explicitly, as such:

    default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be

However, if your commit was really about disabling for all big-endian
ARM and Aarch64, then the commit title and commit log should be fixed.

Regards,
Yann E. MORIN.

>  	default y if BR2_aarch64
>  	default y if BR2_x86_64
>  	default y if BR2_powerpc64le # Only support powerpc64 with LE
> -- 
> 2.43.0
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
