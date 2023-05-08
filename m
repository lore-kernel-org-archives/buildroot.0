Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A0C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB72C41893;
	Mon,  8 May 2023 20:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB72C41893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znbwGz7n4K7u; Mon,  8 May 2023 20:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305A44161B;
	Mon,  8 May 2023 20:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305A44161B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B811D1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90EF384579
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90EF384579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBNPUH_S6Vqp for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:32:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F5884575
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F5884575
 for <buildroot@busybox.net>; Mon,  8 May 2023 20:32:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FD94780306;
 Mon,  8 May 2023 22:32:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:32:23 +0200
Date: Mon, 8 May 2023 22:32:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230508203222.GQ252090@scaer>
References: <20230426075059.142479-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426075059.142479-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683577945;
 bh=wjlDU3B2iVjK9v2zHtl1Av3BFijKKCOZ1Exy99SpRGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFHn1WvdczOs6ijnkna1X8ubbc1afyjnaGYoLuiVNHNuqbAH5JqlIJ3yiMbFvNzvc
 ofRf3FWqSL2/MTTesswXHsDY3a5+Jun4eE/g2C4cFVEQ4EQnYXUozWBuj0wIwSpL9I
 nD2jh55/BQj4+BUsAx8pZS4bs5koBBiUNqgpZr1Dr30td+4IsXfbzbktaO3YTwvggi
 RUwaB7kdsct1ANFwtwWJRZT5hLY31MOr3VxpBBgJqa19WPB+ZarSuFKjdQd6b0K49m
 fBJwww5/9BgS3jhhGy2wK1bAQ1pssXeQqMLA82E3ZloWRH47rMbd/KxHc5Kbx+8N5O
 5FBE45QqahZ5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mFHn1Wvd
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.36.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francois, All,

On 2023-04-26 09:50 +0200, Francois Perrad spake thusly:
> diff README:
> -Perl is Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
> -2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
> -2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022
> -by Larry Wall and others.
> +Perl is Copyright (C) 1993 - 2023 by Larry Wall and others.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.hash | 14 +++++++-------
>  package/perl/perl.mk   |  4 ++--
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index b21023f73..3ae9ecec5 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,12 +1,12 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.0.tar.xz.{md5,sha1,sha256}.txt
> -md5  826e42da130011699172fd655e49cfa2  perl-5.36.0.tar.xz
> -sha1  938c56a77ae094eb7f5019318a5e4efb2d9c74fa  perl-5.36.0.tar.xz
> -sha256  0f386dccbee8e26286404b2cca144e1005be65477979beb9b1ba272d4819bcf0  perl-5.36.0.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.1.tar.xz.{md5,sha1,sha256}.txt
> +md5  825f6b1d7e03b22522e0bdb992fbb728  perl-5.36.1.tar.xz
> +sha1  7b766266af08a6cef0487308e80b40d5d8069df7  perl-5.36.1.tar.xz
> +sha256  bd91217ea8a8c8b81f21ebbb6cefdf0d13ae532013f944cdece2cd51aef4b6a7  perl-5.36.1.tar.xz
>  
> -# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4/perl-cross-1.4.hash
> -sha256  be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91  perl-cross-1.4.tar.gz
> +# Hash from: https://github.com/arsv/perl-cross/releases/download/1.4.1/perl-cross-1.4.1.hash
> +sha256	3e14bb4f28c83586c668c5f9f6b4e57b138b4ec2fae0271086e29d4e352670ca perl-cross-1.4.1.tar.gz

    $ make check-package
    package/perl/perl.hash:7: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

I've fixed that and applied to master, thanks.

Regards,
Yann E. MORIN.

>  # Locally calculated
>  sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
>  sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
> -sha256  06bab256e2e039c59d2ca3c5853425317b4a0f251fe4e5d5201a987b11fc4f78  README
> +sha256  810c97bea10842d2e47bc79e51acdfa1628cfee34fa0d89330f4eb3a44e3def9  README
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 9be00e1b2..734e8efec 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version here, also update utils/scancpan
>  PERL_VERSION_MAJOR = 36
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
>  PERL_SITE = https://www.cpan.org/src/5.0
>  PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>  PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>  PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  PERL_INSTALL_STAGING = YES
>  
> -PERL_CROSS_VERSION = 1.4
> +PERL_CROSS_VERSION = 1.4.1
>  # DO NOT refactor with the github helper (the result is not the same)
>  PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>  PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
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
