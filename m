Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61780C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 16:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2918441F;
	Sat,  4 Jun 2022 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hi7R7QtZz0uL; Sat,  4 Jun 2022 16:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1F88843E2;
	Sat,  4 Jun 2022 16:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC9A1BF3E9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88BF0611AB
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho5xRDGXoB6N for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 16:30:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F6DB607B0
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 16:30:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A30765FFA1;
 Sat,  4 Jun 2022 18:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654360200;
 bh=/hV9Fe7zcAzWYnA4nkydvU6f468ujYbx529hAjKrYE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZdI9/5RT5X3pUICTAMAoLqohI93mybpjpadZoECoVpMHl9nt8plREe4gkGoObNI8+
 cqJmFus6dPIUF9d+YwMU438Rvupbo3Gvl+ZriDcHy9jHyBcitWXUIsnITiPSiZTPba
 Y7+KyNShwQk3RW98gn5hexPosjCtusTPEC1vlaB0bmTIGUC6XbTfKKUwhboIy7ylS7
 JyHnE6xdShFv+s6qYpMX2dkFrEHBP9+u2HQMZ+Gr37/jC3Cyg2gN34sZ4g4CYlh9l7
 jK7vp0Nhq/SaB2mpxwG4dFJmN6alVwTQConCptEy8nYPao+xDn0kbtKn3uZxbSdU9u
 2w6aY09yGNQdA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 18:29:57 +0200
Date: Sat, 4 Jun 2022 18:29:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604162957.GN427639@scaer>
References: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530204716.3054785-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/gtest: gmock needs host gcc >=
 4.9
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-30 22:47 +0200, Fabrice Fontaine spake thusly:
> gtest unconditionally uses is_trivially_copy_constructible since
> version 1.11.0 and
> https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770
> 
> So add a dependency on host gcc >= 4.9 for gmock to avoid the following
> build failure since commit 9dfbbbb4105c47602da048c9bb9499fb8862e768:
> 
> In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
>                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
>                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest.h:64,
>                  from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/src/gtest-all.cc:38:
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/build/host-gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
>             std::is_trivially_copy_constructible<M>::value &&
>             ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9d19a47deb80824eaa718d80f14b0afd5f9eb054
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gtest/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gtest/Config.in b/package/gtest/Config.in
> index d8bcf6343f..35fc9fea7b 100644
> --- a/package/gtest/Config.in
> +++ b/package/gtest/Config.in
> @@ -26,6 +26,7 @@ if BR2_PACKAGE_GTEST
>  
>  config BR2_PACKAGE_GTEST_GMOCK
>  	bool "gmock"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-gtest
>  	help
>  	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
>  	  C++'s specifics in mind, Google C++ Mocking Framework (or
> @@ -47,6 +48,9 @@ config BR2_PACKAGE_GTEST_GMOCK
>  	  libraries required to link/run them. The host package installs
>  	  gmock_gen, a Python script used to generate code mocks.
>  
> +comment "gmock needs host gcc >= 4.9"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> +
>  endif # BR2_PACKAGE_GTEST
>  
>  comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
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
