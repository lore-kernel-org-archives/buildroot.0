Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24F2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 11:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EBF540BE8;
	Wed, 23 Mar 2022 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INuGzsYvLHbF; Wed, 23 Mar 2022 11:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3191B404C8;
	Wed, 23 Mar 2022 11:13:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 108701BF5A2
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F389A4001F
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9Pij0IVhOZ5 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 11:12:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD268415D5
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 11:12:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d34:bdfa:f457:8010])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D997619F5AD;
 Wed, 23 Mar 2022 12:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648033977;
 bh=i6jw7Fs8Zs/SzGNpUBbNdTwqrgyims6wZsQN9t+cu9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FT8hCHHtTOQ+VZ5wPiRcX1m1tfw0hQdJSdx66ifsDr/2yL9Ea+Mhh55NPwbUzJTtd
 R4i1zK3lceTK7/zfmjpKY79jDe+MxRnk88jeCOFWXR+vQpfCy6Ctx4yWWR1sk96uOK
 mpDPwxdPH6wmdeqNZ3hiFPFuh2ocDzjI9kOXg4ZfHrBUE7XHW3shMMYIx0QkbJQR0f
 b/YnI33psWz/69Gijv+ntvzsTuGGB+3bAHKPlQyy7tFRjnlHpf4xBtumTAbcYxnM2O
 DTCmEf+jqfBkqz8NVCfLghVK4ppZli7A6my1JFFM3wrWMQgL3VeX8UjjQqApAWraKY
 cEVKwDUVwt64A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 12:12:52 +0100
Date: Wed, 23 Mar 2022 12:12:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220323111252.GM1566358@scaer>
References: <20220317223928.508338-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317223928.508338-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add s390x
 support
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
Cc: Matt Weber <matthew.weber@collins.com>, Cyril Bur <cyrilbur@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-17 23:39 +0100, Fabrice Fontaine spake thusly:
> s390x is supported since
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/3934308046e5f113e19ed0ada002e2ec33335b8a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kvm-unit-tests/Config.in         | 1 +
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index e470dd6157..a3d6756fb9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  		BR2_cortex_a17 || BR2_cortex_a17_a7
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_s390x
>  
>  config BR2_PACKAGE_KVM_UNIT_TESTS
>  	bool "kvm-unit-tests"
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index d610442e03..2d05d08067 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -16,6 +16,8 @@ else ifeq ($(BR2_i386),y)
>  KVM_UNIT_TESTS_ARCH = i386
>  else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
>  KVM_UNIT_TESTS_ARCH = ppc64
> +else ifeq ($(BR2_s390x),y)
> +KVM_UNIT_TESTS_ARCH = s390x
>  else ifeq ($(BR2_x86_64),y)
>  KVM_UNIT_TESTS_ARCH = x86_64
>  endif
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
