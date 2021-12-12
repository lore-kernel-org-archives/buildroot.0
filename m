Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCEAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DDD6072D;
	Sun, 12 Dec 2021 13:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mnWCyjeK6JX; Sun, 12 Dec 2021 13:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A0D60757;
	Sun, 12 Dec 2021 13:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497241BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 449A160757
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zN0RafvKIZe for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1798E6072D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 13:45:35 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z5so44836999edd.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XUgSPRIIKIbHrk1tzlyNYzYNwuVf42BBArKRA8jU50U=;
 b=UuGq+Zrks2GeUPxyUwT7YhiLg0piFkW3sJvBHMP0e5vUVnin+l73Sj9mc1tquIciR3
 RhJVwzpoBY1xb+q2KhYMV+sZlF6+gG/k7Vo6rKOZ5aj6IPyoWkYSNZ4jrUEHoq/eZklz
 dnJKQ8sbThEo8PrqItcHZAnX8i2oUmgAVSSBhqioalsubPhjKvoirxIKrf41Vl25+Fma
 Hv5+xalfS4VtcjfOM1w7I5bKQmPtM4LR5Gr/j6KZ5ZeuZGv73fmQIUv1rYJ5M0I6yTTi
 L01UNmRKTW0jC6Kt60le6qcfPp1HUa5XnOBb5dCubTMlUDzM1pgEfzDvAOAzZpDn+1nA
 fXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XUgSPRIIKIbHrk1tzlyNYzYNwuVf42BBArKRA8jU50U=;
 b=FxQ7lEhxSzdhE+V/01Xfu+kNRVqFqoCj7WTr99CQ1cJlpk2CTZQ6HIzKs0fnPtM5fP
 EDqUd8FFnWlGxdVX/JLkXRWbplAkhCp71nz+WRzvJetE1AcloTvfg2fBZLkW3Yo3VmtV
 EiSre1rfZyZRE8IPzd8W3jqjPX5BBaZstNtqniYu0s6mWgMKHxku36e+jHJtk0y4L0Ot
 hi4Rf463V20UEcMnKxXKHa/J6LlZPOp8r3X6lLt8JqUMSIyRkngCj3ZKJJo683fWd9cG
 bPz80L9XGP8sIN3zuZQ9yneGbsJaWujxQ1grPXyDYhVZDGhMer9ACbxfrEw64RfaHxJm
 25Ng==
X-Gm-Message-State: AOAM5317yTRjLdabUBjOHId1hvZAH22d+zJoBRpN/Ogv5EyF0uG5BQDg
 2kzc1AiqEQls9G9nLQSlulFzNw==
X-Google-Smtp-Source: ABdhPJy+1qvEzPsydnfhwg03Mfr0JB2b5nA9uDVPWCpYXbeqQHm3LLjL5d66bOjIkDa3Knc7JMT2Pw==
X-Received: by 2002:a17:907:7213:: with SMTP id
 dr19mr37079674ejc.157.1639316734096; 
 Sun, 12 Dec 2021 05:45:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cw5sm4594256ejc.74.2021.12.12.05.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 05:45:33 -0800 (PST)
Message-ID: <96e2c40d-9d3d-74ea-1505-af760226668d@mind.be>
Date: Sun, 12 Dec 2021 14:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211208173051.3816198-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211208173051.3816198-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dmalloc: fix strdup detection
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



On 08/12/2021 18:30, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 5.6.5 in
> commit 736932c71552adc4dfa95c5236d1064860900e8a:
> 
> In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:631:0,
>                   from arg_check.c:31:
> dmalloc.h:377:7: error: expected identifier or '(' before '__extension__'
>   char *strdup(const char *string);
>         ^
> 
> This build failure is raised because 0004-fix-strdup.patch was wrongly
> removed and because configure.ac wrongly assumes that strdup macro is
> not available when cross-compiling
> 
> As configure.ac can't be patched because autoreconf is not working,
> patch configure as already done in DMALLOC_POST_PATCH. An upstream patch
> on configure.ac will be sent as soon as upstream merges this old PR:
> https://github.com/j256/dmalloc/pull/44
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/00565c4b0618ea5f553d8c22284637b6574e4a93
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dmalloc/dmalloc.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 05943943d6..93dc45c15d 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -48,6 +48,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
>   
>   define DMALLOC_POST_PATCH
>   	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
> +	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
>   	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
>   	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
>   	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
