Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CE1B40A8C;
	Mon, 25 Apr 2022 19:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4ckuj_P_l3M; Mon, 25 Apr 2022 19:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3370E4052E;
	Mon, 25 Apr 2022 19:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C969B1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CF7829AF
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzE5yT3nWOkn for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:06:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB13882974
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 19:06:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z19so6352920edx.9
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=w47cuU+NtDQX0qKJk2UNt8CCVQ/JCY4z7hJb777eB5k=;
 b=DG1npseikVksO7uosPiY3QFRjDxR9ptkm2pTUfzp6XZTcl7n1ijCsNn+0dkwdrefsm
 pKtCZQw6V78PWKURho+eWbLfrvfuBywUrQJ22jdzVz1SE4yKBE7JNyG0zqBOT3dodv5t
 OBn/x98iMjCSjRgRdR73YSZ3yu9CKmFaOSzqkInrA4vazyZcx2cAtta7rns5ge/uEY5y
 uZV+Hvpl5rP/2PfJT0Bu5HRPIeZTN/+XE1b3arAKbdOTorGY8UgL5E0vYSlv8E02De+2
 N9soBJ8VpMlJKjCmbVE+iLoFCJWj+xd8XBr6aOPKXGS/4U7eUhYBmwrjs7BEGQ+q3Zx9
 wIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w47cuU+NtDQX0qKJk2UNt8CCVQ/JCY4z7hJb777eB5k=;
 b=pJ6BTc8JQfbcWnsk9E3l7epXE6bOKXehRoPldhNcWWeZSrw6k8KcpkcP4IwZHBCjp0
 iouG2BNjP5tSLqaxuZx9IUQCpu6NaMjlNWyPG739TDlmJ/2FckH4Jam9WSKo7hFdKe4i
 c3eD9nI6HjcfwyxJW97jTpNfttyCG+PlvRuV1lOQKHzv/BJ3nRnEaZvYtUljrFeG7FWI
 TOnq5xzsuchND2jnpOQvvclUSkj7niQ+pPzap+PigMc21Fb/BnON755nYWRq15GKqdC1
 S/KfDCKVftZhWlBGJf1NmmJ40oRZ93ILkHO9g5UL2sFsElMFWFFnBafG57wxdbRs/euF
 yobg==
X-Gm-Message-State: AOAM532UthQxi/CYpSK+RGgiMsQP5c3AjPQBF3u48heDsqntAPGh94Av
 VikyUn5lweg3gEglfc10aYEU4vPfpRaaOg==
X-Google-Smtp-Source: ABdhPJxTCypZL2uZ4CAab4LCCFhfJ/HIJ49LyhQ3ZucI4K11X8gTwmQbZDCsgYXe9fardj4zQ5u3fg==
X-Received: by 2002:a05:6402:5211:b0:423:fcbe:cf06 with SMTP id
 s17-20020a056402521100b00423fcbecf06mr20196505edd.39.1650913580041; 
 Mon, 25 Apr 2022 12:06:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm3951592ejd.11.2022.04.25.12.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:06:19 -0700 (PDT)
Message-ID: <20aad077-fbbb-3412-7688-616e20b8e5ef@mind.be>
Date: Mon, 25 Apr 2022 21:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
 <20220422161514.3449177-2-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422161514.3449177-2-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 2/8] package/perl-file-listing: bump to
 version 6.15
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



On 22/04/2022 18:15, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/perl-file-listing/perl-file-listing.hash | 6 +++---
>   package/perl-file-listing/perl-file-listing.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
> index 235896571..cb52c127c 100644
> --- a/package/perl-file-listing/perl-file-listing.hash
> +++ b/package/perl-file-listing/perl-file-listing.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  cf60a79563185391831613178a79b4cd  File-Listing-6.14.tar.gz
> -sha256  15b3a4871e23164a36f226381b74d450af41f12cc94985f592a669fcac7b48ff  File-Listing-6.14.tar.gz
> +md5  8ba34641a6c5a2ec1b0bf7064f68c535  File-Listing-6.15.tar.gz
> +sha256  46c4fb9f9eb9635805e26b7ea55b54455e47302758a10ed2a0b92f392713770c  File-Listing-6.15.tar.gz
>   
>   # computed by scancpan
> -sha256  7f0ccec295e6d7d2be1439cedd7caf6cc6247191f4c10ac56d91ee9bc265ba02  LICENSE
> +sha256  287e6f0fdf2db790a24975b492cde64b210c16af7137f44373cbd03fcf844212  LICENSE

  You didn't explain in the commit message why the license hash changed, so I 
haven't applied this. Marked as Changes Requested. Same for the other ones where 
the license file was updated.

  Regards,
  Arnout

> diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
> index 61bbc18eb..c8584ffa8 100644
> --- a/package/perl-file-listing/perl-file-listing.mk
> +++ b/package/perl-file-listing/perl-file-listing.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_FILE_LISTING_VERSION = 6.14
> +PERL_FILE_LISTING_VERSION = 6.15
>   PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
>   PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
>   PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
