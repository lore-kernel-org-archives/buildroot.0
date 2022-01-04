Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D3C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7772E400FB;
	Tue,  4 Jan 2022 17:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XV46430_uc-2; Tue,  4 Jan 2022 17:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB5440236;
	Tue,  4 Jan 2022 17:57:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A087A1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F5DE813C5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWwrKufjnRDI for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E209813D4
 for <buildroot@busybox.net>; Tue,  4 Jan 2022 17:57:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m21so152747926edc.0
 for <buildroot@busybox.net>; Tue, 04 Jan 2022 09:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+E0JDFa0Srs3JzMFQ/icuh+DxDT49f90utV8RpaQENg=;
 b=aWvfrh14UMVMkHPzhArEiFyg607EXIJdgVmxELSFtk0q5mMQoV88swG29DohJ7ONvH
 VYNDhzxDYXaOvpzJO5xiXte4VA2zbnC3LG+Wg2m7mVOkdpHYBrtzkhoQee0JYOw6KOY8
 3RE2Egf02m9360XyNt1istz4L0FqpVgazF3q8vA7xg32TA0zXh2RMWZPzEgF0PgrEBKd
 WYivy9mmOm+HjewWLJLMjgPHFADl/JOgHzjOxiS0DHAUfIpjG8V5Bpnd0GNZxi8FFbo4
 VV7H1Ras1EtY2GvCKYZd2dY2rhMm8BDrAXAiGDu5Klbub7aygu23PEKRuegf9ZSDPFWg
 QfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+E0JDFa0Srs3JzMFQ/icuh+DxDT49f90utV8RpaQENg=;
 b=CJb6V+ij3O+S0H3LBfw7xfO9rFvs4T3PvtWIwazqBETPc8z7Rc6WaZ62RLmuyDf5YQ
 NzwZ+nPZWbTQXMDL7j4eL4NmuRdJfhFtorGksjdTaBnC6y6G2GCLJS7Pj5QHyTAgfr0n
 kuva1eVwunz/h2+ma3kmMDEO8WHgmNhrJBVm91pPWCJXBIJVPtGXK81W7yVOXdyqDCwU
 nuqr5W34JoYsYxKvrFWMiEuTecjIcgVp5nGJgliJe3OfrJFJSokzxiYVUHF08zX9aBc9
 GhNvxksZDb4xVboz0AzkNrnN6USLeRs1mXLc1I9uLt6aeb1NOjPfmEqOZ6sYz6bvOfs+
 j8aA==
X-Gm-Message-State: AOAM532zyokl/OurZDLoQ27B22SG5zWj1dEiwEsS8ls3FbI9s7ZRI1A1
 5et4uG4/L9IB2pLF9iVDEJqhyg==
X-Google-Smtp-Source: ABdhPJxbkwIanc5eplBFs/vPCQ47hbZ9EoC33/bx2EETpUjqPY0CzQmV7+ISVFwfS0lgGqZUpeXToQ==
X-Received: by 2002:a17:906:3e83:: with SMTP id
 a3mr41808763ejj.383.1641319055537; 
 Tue, 04 Jan 2022 09:57:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 7sm11682510ejh.161.2022.01.04.09.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:57:35 -0800 (PST)
Message-ID: <21297fa7-2ce2-c60d-6c55-d3872151587a@mind.be>
Date: Tue, 4 Jan 2022 18:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220102104318.2631-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102104318.2631-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.34.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 11:43, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/perl/perl.hash | 12 ++++++------
>   package/perl/perl.mk   |  6 +++---
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index 42b7cc66c..b0f60ef6f 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,10 +1,10 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz.{md5,sha1,sha256}.txt
> -md5  7f104064b906ad8c7329ca5e409a32d7  perl-5.32.1.tar.xz
> -sha1  1fb4f710d139da1e1a3e1fa4eaba201fcaa8e18e  perl-5.32.1.tar.xz
> -sha256  57cc47c735c8300a8ce2fa0643507b44c4ae59012bfdad0121313db639e02309  perl-5.32.1.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz.{md5,sha1,sha256}.txt
> +md5  df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
> +sha1  d461e206a1dca5e79d39e77debf0b564f6d77d37  perl-5.34.0.tar.xz
> +sha256  82c2e5e5c71b0e10487a80d79140469ab1f8056349ca8545140a224dbbed7ded  perl-5.34.0.tar.xz
>   
> -# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.hash
> -sha256  91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25  perl-cross-1.3.5.tar.gz
> +# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.6/perl-cross-1.3.6.hash
> +sha256  4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5  perl-cross-1.3.6.tar.gz
>   
>   # Locally calculated
>   sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index f661fef01..d7f9c58dd 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -5,8 +5,8 @@
>   ################################################################################
>   
>   # When updating the version here, also update utils/scancpan
> -PERL_VERSION_MAJOR = 32
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
> +PERL_VERSION_MAJOR = 34
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
>   PERL_SITE = https://www.cpan.org/src/5.0
>   PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>   PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>   PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   PERL_INSTALL_STAGING = YES
>   
> -PERL_CROSS_VERSION = 1.3.5
> +PERL_CROSS_VERSION = 1.3.6
>   # DO NOT refactor with the github helper (the result is not the same)
>   PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>   PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
