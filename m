Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0612FECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A012A60B60;
	Sun, 28 Aug 2022 10:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A012A60B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVZ239tFxW-Y; Sun, 28 Aug 2022 10:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B258B60585;
	Sun, 28 Aug 2022 10:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B258B60585
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B23A1BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E3F81D70
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E3F81D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjS-HfsCJDBg for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C4F81A47
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74C4F81A47
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:18:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BD555780346;
 Sun, 28 Aug 2022 12:18:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 12:18:03 +0200
Date: Sun, 28 Aug 2022 12:18:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220828101803.GM37358@scaer>
References: <20220828084033.13660-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828084033.13660-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661681885;
 bh=fHEEzWHGCquRVfLJgyfvK4/DyQLzCOgF+T8yLY5rG4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FL62P5uLsor1hE5u5TgbK6rxGqIy18VN5sx9ASyGeh0I82PnnEj51aDI2PEBJhHp0
 ynW+4hsQVgI01xzTMB9rd+RAchLK0idqyyIBmezehBv7rZMk1lJdulwd8wjzGDYq4C
 yysodAJD+pTtOtZROayusrVyHrUeTj1P7u/HK8bbB1qaDqBkWn8IomK9UUlVZei41P
 JHOkQDxO+yqzZnaE4U25XxmN7jmI4s6CitPa8IQzTheLaOVWlw9QEmY0djiZhn2jn+
 FAqcj8vx0zoaIoKlM0FqWXdT4TpNvfC2y9Nu6rub7Nv6OeigpyDvyZAWfi4DMPbu/R
 Jl3ZFtQnsXejA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FL62P5uL
Subject: Re: [Buildroot] [next 1/2] package/poco: bump version to 1.12.2
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

Julien, All,

On 2022-08-28 10:40 +0200, Julien Olivain spake thusly:
> poco 1.12.0 updated its pcre depencency to pcre2, see:
> https://github.com/pocoproject/poco/blob/poco-1.12.2-release/CHANGELOG#L37
> The Kconfig selection and dependencies are updated accordingly. This
> commit also reorder those Kconfig options alphabetically.
> 
> This commit adds an upstream patch to fix compilation failure with
> oracle-mysql. See:
> https://github.com/pocoproject/poco/commit/3884c734c261231c34f59e56cde7ae02945b4dae
> 
> This commit also adds "-latomic" to ldflags at configuration time, if
> the toolchain has it. This is required for some architecture: without
> this, compilation with bootlin-riscv64-glibc toolchain (for example)
> fails at link time with undefined reference to '__atomic_exchange_1'.
> The --ldflags option was introduced in 1.12.0 (Thanks Fabrice). See:
> https://github.com/pocoproject/poco/pull/3545
> 
> For the full Poco change log since 1.11.12, see:
> https://github.com/pocoproject/poco/blob/poco-1.12.2-release/CHANGELOG
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index c06e55210e..3bcc42c455 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
[--SNIP--]
> -POCO_DEPENDENCIES = pcre zlib \
> +POCO_DEPENDENCIES = pcre2 zlib \

I've pushed up a followup patch that reflows the dependencies one item
per line.

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
>  	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
>  	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
> @@ -60,11 +60,17 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  POCO_MAKE_TARGET = all_release
>  endif
>  
> +POCO_LDFLAGS=$(TARGET_LDFLAGS)
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +POCO_LDFLAGS += -latomic
> +endif
> +
>  define POCO_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
>  		--config=Linux \
>  		--prefix=/usr \
>  		--cflags=-std=c++14 \
> +		--ldflags="$(POCO_LDFLAGS)" \
>  		--omit="$(POCO_OMIT)" \
>  		$(POCO_CONF_OPTS) \
>  		--unbundled \
> -- 
> 2.37.2
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
