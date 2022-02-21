Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A21C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC25E813DF;
	Mon, 21 Feb 2022 20:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PO9p3uzeNxFS; Mon, 21 Feb 2022 20:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B4B813D5;
	Mon, 21 Feb 2022 20:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE43A1BF319
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A09400A8
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ca-zx5WU1lSJ for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:00:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65F1940199
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:00:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c4d2:14e:83d5:3704])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3FDE819F5A1;
 Mon, 21 Feb 2022 21:00:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645473647;
 bh=4YOUjcPDyqBU8WBj9yaleDwgHxOfFz3Z870+1bsdfGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sw1ruHtuWeuxsXo1TiQcfj9MD8Ylt7BqzxwLycIfPh/+2u1/bEfvjPQ8SJWBWGm5K
 uRAB5/6+2SUlNQOnem5vL3X1BlvfdQcHrns0u/hmxU6Qcog45TA0e+B4lgbXfq+vNK
 3sk+BP/jN4fT3MF+nQsQjcz/jW0jccLjP+ZhkzcvNe5b7TbPn9lp5gbkSwQ1B5CwaJ
 l9GtaIJG38ihlOstRghLBsHJ5jJtE8u3QnRucXcwv87q6An60srSjRLYMWb8/Pghn3
 WX8woNC2/eCK+kAtrMZzLezONjAMTJH9PW1AEc4fRoegFPyPgMylzmeCjAnuwQw4mt
 OvODamM62Y9LQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Feb 2022 21:00:44 +0100
Date: Mon, 21 Feb 2022 21:00:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220221200044.GA2166282@scaer>
References: <20220221172900.1937856-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221172900.1937856-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: fix build with gcc <= 5
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

On 2022-02-21 18:29 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc <= 5 raised since bump to
> version 2022-02-01 in commit d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
> and
> https://github.com/google/re2/commit/a022cc0c55b0519629d64d775e7a5195af34a477
> 
> ./re2/sparse_array.h:266:37: warning: defaulted and deleted functions only available with -std=c++11 or -std=gnu++11
>  SparseArray<Value>::SparseArray() = default;
>                                      ^
> ./re2/sparse_array.h: In copy constructor 're2::SparseArray<Value>::SparseArray(const re2::SparseArray<Value>&)':
> ./re2/sparse_array.h:273:3: error: 'copy_n' is not a member of 'std'
>    std::copy_n(src.sparse_.data(), src.max_size(), sparse_.data());
>    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8ebbac67f32fe24416a1f72aad0afd42b567b403
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/re2/re2.mk | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index 41392cb179..cc5fed71fa 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -10,20 +10,25 @@ RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
>  
> +RE2_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
> +	prefix=/usr

Is there a reason to have 'prefix' be set during the build, instead of
just the install steps?

Regards,
Yann E. MORIN.

>  define RE2_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
>  		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
>  endef
>  
>  define RE2_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
>  
>  define RE2_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
>  
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
