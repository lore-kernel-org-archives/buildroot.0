Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE23C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 11:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD03740BEF;
	Wed, 23 Mar 2022 11:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzXnvalDyJ8U; Wed, 23 Mar 2022 11:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3333040BEC;
	Wed, 23 Mar 2022 11:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A55341BF5A2
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA5D60AA8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCZAMxdygVJN for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 11:13:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D523607FE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 11:13:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d34:bdfa:f457:8010])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C9AC219F5AE;
 Wed, 23 Mar 2022 12:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648034008;
 bh=sYwxyn7gmoVog4vsq686haKIQcIUJw2HI3SQ14B22MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQYo00xngInzFmUZ3/C3TqqV/pGGT2nqATUOZbuYpwCXwrD2IIaFPmRiPsB7W0OTY
 h4Q6aUw/iFHSpSMnGPvx1a6JjrhdFj54AvkBHg5kcCwSztoG9grjh5P2uHLBfcRkgT
 UaShk5Mpl4SDEhWdHK9nTfjk+IGGPx5fC4lpthrcJ6R4Yhm3ShOS4ALOWR28W7wk13
 b8gxZcxr/NLzNT+wvUH3P/AohnsG43Wo55q+miTbnMWUiCHt3mpz6qOnAg9PcbVQ2H
 iFXjhpgkOr/czCma1RSUQU2ZQ8tOH8iMcsjpcLzIY4ekO0bfg8f+TXu/oqrKgvaJab
 p4yklo3KkYUmw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 12:13:23 +0100
Date: Wed, 23 Mar 2022 12:13:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20220323111323.GN1566358@scaer>
References: <20220322170800.1872403-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220322170800.1872403-1-cohuck@redhat.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add more arm
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cornelia, All,

On 2022-03-22 18:08 +0100, Cornelia Huck spake thusly:
> Add some more cortexes with VHE, and enable aarch64.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Resent because I was subscribed with a different email address.
> Sorry about the spam.
> 
> ---
>  package/kvm-unit-tests/Config.in         | 5 ++++-
>  package/kvm-unit-tests/kvm-unit-tests.mk | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index e470dd6157f0..b084375e62e9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -3,7 +3,10 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  	# On ARM, it uses virtualization extensions
>  	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
>  		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
> -		BR2_cortex_a17 || BR2_cortex_a17_a7
> +		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
> +		BR2_cortex_a55 || BR2_cortex_a75 || \
> +		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
> +		BR2_cortex_a76_a55
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
>  
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index d610442e039f..d72eba02bc3b 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -10,7 +10,9 @@ KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive
>  KVM_UNIT_TESTS_LICENSE = LGPL-2.0
>  KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
>  
> -ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_aarch64),y)
> +KVM_UNIT_TESTS_ARCH = aarch64
> +else ifeq ($(BR2_arm),y)
>  KVM_UNIT_TESTS_ARCH = arm
>  else ifeq ($(BR2_i386),y)
>  KVM_UNIT_TESTS_ARCH = i386
> -- 
> 2.34.1
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
