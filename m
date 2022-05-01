Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D5AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A8780C7A;
	Sun,  1 May 2022 19:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOVT-WzhTzI4; Sun,  1 May 2022 19:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EF580C5E;
	Sun,  1 May 2022 19:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE79D1BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABBA0605A1
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lV0GuFd3E5kC for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:36:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D79F7600C7
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:36:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8846178031A;
 Sun,  1 May 2022 21:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651433785;
 bh=ePU4n9PKLoQ3ZuRWYfEvUsOUsEMe5I6FQkzNqL910Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnOQ6lGqlAakYYPnO0MpBemuZeloEftQy+h4mzUE8ujzhKr55sN/4lHODqsLUF5Oi
 BdhZE8DLAE9zBC/8ZovgekZ9bMJZRTXHuhMOGX6XE+BIAwg9d9r6Oo5P4dflaWrqEs
 JwL9aCRHxvv6m+lw2GG+atngcYMqdTUKLHjScAA7YlR58hHs5oWYMCN5Qb5Xe2U3+l
 Z9Vqtwcq3GJipW75xF1N5hXGbLXXBJbvCUHbcGdYBhTcrp5FBI5C/HgNdTkdgOzve2
 kYbQPHjR7DbVVT6dEEiywxay+Ikh99sIHa4UA0+ZSH9tK7X/PTpZw0oZArmQsd6YLI
 kONAxFHuNnySQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 21:36:21 +0200
Date: Sun, 1 May 2022 21:36:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20220501193621.GN3624965@scaer>
References: <20220501084213.547024-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501084213.547024-1-huth@tuxfamily.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: Fix license
 information
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

Thomas, All,

On 2022-05-01 10:42 +0200, Thomas Huth spake thusly:
> The kvm-unit-tests are licensed under the GPL v2 nowadays, see:
> 
>  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/b29b222beb424a00
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index e56436f802..0bdbca70ac 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -7,7 +7,7 @@
>  KVM_UNIT_TESTS_VERSION = 2022-03-08
>  KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
>  KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
> -KVM_UNIT_TESTS_LICENSE = LGPL-2.0
> +KVM_UNIT_TESTS_LICENSE = GPL-2.0

In fact, lots of files in kvm-unit0test are still LGPL-2.0, so it is
still a relevant license to be listed here.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
>  
>  ifeq ($(BR2_aarch64),y)
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
