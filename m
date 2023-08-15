Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3073C001DE
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 09:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5828340BE2;
	Tue, 15 Aug 2023 09:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5828340BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-J_X6wEc6oi; Tue, 15 Aug 2023 09:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E91240BEE;
	Tue, 15 Aug 2023 09:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E91240BEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2387B1BF2FF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDA7A41803
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA7A41803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IA7A32g1NPDu for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 09:22:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 392EA408C9
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 09:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392EA408C9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6587:c204:11b1:7ba6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01C7413F89D;
 Tue, 15 Aug 2023 11:22:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Aug 2023 11:22:40 +0200
Date: Tue, 15 Aug 2023 11:22:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230815092240.GB2603@scaer>
References: <20230814201650.245224-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814201650.245224-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692091363;
 bh=GCgycTHAecB8aRsDha1/N6lqRSzFar2orrNX/wGeeos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nNlcGC0FEqiXxRSrxbgeSShSsVUPjhFxMcPI9N5HbbYZS3ekSrJhos6q2qqXsbFlK
 yZa7uM2xSOLWmKkCIhD9rVDo1ABu4cOz9mLdQYU5DbQWpZlhV977+Iq6BH5a7GC3kk
 r1Q+Ol8RHWzxUgDT4La1VmhgAXYoOqwM6tNTn663o5sXUyCagJE+7MN2L7jRhhBIzf
 M9IBioikYqMThMAe7KQPwyquaJ9tZyCTyxkzl8qwW94qnZ7E9jLxXcyQ7fq672qUit
 HESDQ8Et1lpXJWRQSrf/jSDQ9rm977VcrBHyD6ux/0uXklJlTlZdAqgNciU55pG6hY
 7cSfBeR+p6EWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nNlcGC0F
Subject: Re: [Buildroot] [PATCH] package/optee-test: fix build with openssl
 >= 3.0
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

Romain, All,

On 2023-08-14 22:16 +0200, Romain Naour spake thusly:
> Backport an upstream:
> "Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
> flexible with regards to which version of OpenSSL build environment has
> to provide"
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060472
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-xtest-add-DOPENSSL_API_COMPAT-10100.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
> 
> diff --git a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
> new file mode 100644
> index 0000000000..b876c3385f
> --- /dev/null
> +++ b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
> @@ -0,0 +1,57 @@
> +From a0db2b60b9f5c14e9f69c0e06e1a8d35f9fb1b5a Mon Sep 17 00:00:00 2001
> +From: Jerome Forissier <jerome.forissier@linaro.org>
> +Date: Tue, 25 Jul 2023 14:39:25 +0200
> +Subject: [PATCH] xtest: add -DOPENSSL_API_COMPAT=10100
> +
> +regression_1000.c uses OpenSSL functions that have been deprecated
> +after version 1.1. In particular, building with version 3.0 causes the
> +following error (and other similar ones not pasted here):
> +
> + optee_test/host/xtest/regression_1000.c: In function 'check_signature':
> + optee_test/host/xtest/regression_1000.c:2735:9: error: 'SHA256_Init' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
> +  2735 |         SHA256_Init(&ctx);
> +       |         ^~~~~~~~~~~
> +
> +Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
> +flexible with regards to which version of OpenSSL build environment has
> +to provide.
> +
> +Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> +Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
> +(cherry picked from commit cf111604c4c32a76be90f29aab25fa9b882c8715)
> +Upstream: https://github.com/OP-TEE/optee_test/commit/cf111604c4c32a76be90f29aab25fa9b882c8715
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + host/xtest/CMakeLists.txt | 2 +-
> + host/xtest/Makefile       | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
> +index 776787b..ae0f4e0 100644
> +--- a/host/xtest/CMakeLists.txt
> ++++ b/host/xtest/CMakeLists.txt
> +@@ -12,7 +12,7 @@ endif()
> + 
> + find_package(OpenSSL)
> + if(OPENSSL_FOUND)
> +-	add_compile_options(-DOPENSSL_FOUND=1)
> ++	add_compile_options(-DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100)
> + 	set (OPENSSL_PRIVATE_LINK OpenSSL::Crypto)
> + endif()
> + 
> +diff --git a/host/xtest/Makefile b/host/xtest/Makefile
> +index 8505629..2497850 100644
> +--- a/host/xtest/Makefile
> ++++ b/host/xtest/Makefile
> +@@ -39,7 +39,7 @@ endef
> + # - User/group login tests 1027 and 1028
> + WITH_OPENSSL ?= y
> + ifeq ($(WITH_OPENSSL),y)
> +-CFLAGS += -DOPENSSL_FOUND=1
> ++CFLAGS += -DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100
> + ifneq ($(OPTEE_OPENSSL_EXPORT),)
> + LDFLAGS += -lcrypto
> + CFLAGS += -I$(OPTEE_OPENSSL_EXPORT)
> +-- 
> +2.41.0
> +
> -- 
> 2.41.0
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
