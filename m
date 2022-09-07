Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA23C54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F704818C2;
	Wed,  7 Sep 2022 07:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F704818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l10h7ETrvC3y; Wed,  7 Sep 2022 07:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565FF817C0;
	Wed,  7 Sep 2022 07:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565FF817C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08B011BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86EC607B0
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86EC607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkofnZctuT9S for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:30:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F418260A69
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F418260A69
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:30:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1EFD413F86F;
 Wed,  7 Sep 2022 09:30:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Sep 2022 09:30:25 +0200
Date: Wed, 7 Sep 2022 09:30:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220907073025.GG1490660@scaer>
References: <20220906203423.476196-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906203423.476196-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662535831;
 bh=h1PQfNEZlAmVV7kvJeY5SrbfbaLkt18V0DQkBeaY0p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eT4Z8vsVzTSbsYtY00QTgwPPiBEhT6xSuT7H/ue2SgK5ychjrPDtKG4gcpoGZIM9L
 AbwqDRnxTadwZNZA9+Cci7CJ+gbq2VbgT3d0iFtF12oOmw2IQcMS+V4v3V1Cny6F0D
 bSXL3+TU9ndgczsd1Slm4cZdHOKHCry3Ee9VuuwaYehRM9EV77l7btlYuKmyaDIY6L
 TinBqM8bA6XOpEzKE4zGSBJMUoS3sLK6sBK0/qxLi5QQkLVE2UyqIihqY1Z5Vn5Ewu
 Pslmn6u6zULWA57KXLUIBiZPwfKOuz8TclNFctA3GsBhwQW9AcPWX0iDCPuVBT6Zd1
 UKHkoXL+gwUjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eT4Z8vsV
Subject: Re: [Buildroot] [PATCH] arch/Config.in.powerpc: disable 64bits only
 target for PowerPC target variant
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-09-06 22:34 +0200, Romain Naour spake thusly:
> It turn out that some PowerPC variant are actually 64bits only and
> fail to build an internal toolchain (fail on glibc, uClibc-ng or musl
> build).
[--SNIP--]
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index c48edd3bb4..b321dd2d4c 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -66,10 +66,14 @@ config BR2_powerpc_604e
>  	depends on !BR2_ARCH_IS_64
>  config BR2_powerpc_620
>  	bool "620"
> +	# gcc support only powerpc64 target
> +	depends on BR2_ARCH_IS_64
>  	# No C library supports this variant on ppc64le
>  	depends on !BR2_powerpc64le

As Thomas previously suggested, let's use positive logic:

    # gcc support only powerpc64 target, and
    # no C library supports this variant on ppc64le
    depends on BR2_powerpc64

And so on for the others.

Let's try and get simpler dependencies, which make it obvious under what
conditions each CPU variant is actually available.

Also, I think Joel's series [0] had even more changes in that area, and
it would be so nice to see an updated revision.

[0] https://lore.kernel.org/buildroot/20220729000904.1295295-1-joel@jms.id.au/

Regards,
Yann E. MORIN.

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
