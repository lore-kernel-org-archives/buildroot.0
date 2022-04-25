Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A97C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C558295A;
	Mon, 25 Apr 2022 19:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhFzVece5fqZ; Mon, 25 Apr 2022 19:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C0B8828AF;
	Mon, 25 Apr 2022 19:05:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0321BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B948828AF
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soyBx7Sv1Ls8 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76260812FE
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 19:05:36 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id y3so11116472ejo.12
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 12:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jHfqDl4yYphd0br8IBPhYaaLaWMHxh11hF5YWzyiM9M=;
 b=H6UbWa0p7LPGRPjRHoaI8yPk0NHc12LNuXMu1KrNZEkUhMAPeKZGguWH+yOdK2+SrQ
 0ktfETMFaoN4wxsurU5aWnhriBbfdGkxgfeI1IDUmjf0PmKlhxZcQRTChYOWfXiJ6fJ9
 LF8PBtOrBUHZy7/w79mziD9Z3e/9eMG6qa15qUj6YEcCjxsMEsUc3s32jKQ88JcxlPy9
 votzPw8meRTzICAJFRWZ4G6Dzb1F+3lDAM2OG7Y/53AkBmS9JdzPHWcCc0u6HP8HNq5C
 jLAy6E2u2l3elfenvePtLZXT2isBiUH8m7uWEzT9IfmAYeFWrFiQ8YV98Un7ZDsaQiKh
 0qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jHfqDl4yYphd0br8IBPhYaaLaWMHxh11hF5YWzyiM9M=;
 b=5nB6sdueJ6f4+tRO8S6IiXActD+IOLNq3+QiEkhV7FNgtj5aLw7rLaDEQ6A7JkTY10
 OxDIOyQgEumyshFzwJYluMtZXeuLC86gskClv8RrSkLeoT3kAgpn0E7d2xsZlL7byAQX
 HQtLzxpwJrsXrQGIcJNDEXlROPMsWV50nOt3yetmeGc3d998Z2dpybRrHgchC2djR2mM
 EEm1Tf6HMrvwgGxVv+2le4ImxbWxrOn7p1fJZw+nmwlQFggsckSBSX3Zb9X+CYEWOkVo
 3COH3rYQyhmelFi5ypd/Q/YUP340qr/ZdoAF9+47K+1uhXyIQdA4cPXPmnZ2Tsm2cBNx
 WHDg==
X-Gm-Message-State: AOAM533gdLlMPprQLDl8R3DMVkYvwMW7Rtk6ecq+cyzoaQhozwJZDWMg
 1vWhujm9nv3xBmEmFfvHMXyZtw==
X-Google-Smtp-Source: ABdhPJwt8ddxpGRpMvdel5Vnrwm6PpBEH5TvTnOoE//mW+WlYeNCR9WEgAsx/k1h2WNRDFn7kilL9w==
X-Received: by 2002:a17:907:9721:b0:6f3:806c:b9f4 with SMTP id
 jg33-20020a170907972100b006f3806cb9f4mr9891416ejc.462.1650913534568; 
 Mon, 25 Apr 2022 12:05:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090630cb00b006e83fb1e6b1sm3900942ejb.100.2022.04.25.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:05:34 -0700 (PDT)
Message-ID: <850b8014-9dcf-9625-28ac-df51e3823986@mind.be>
Date: Mon, 25 Apr 2022 21:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 1/8] package/perl-crypt-openssl-guess: bump
 to version 0.15
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

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash    | 4 ++--
>   package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk  | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
> index e6d19cb68..b4795ed3d 100644
> --- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
> +++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  9e86baf96828a38c967003a5e66f0c39  Crypt-OpenSSL-Guess-0.12.tar.gz
> -sha256  0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d  Crypt-OpenSSL-Guess-0.12.tar.gz
> +md5  e07f470dd25023730cf8536e0cefbabd  Crypt-OpenSSL-Guess-0.15.tar.gz
> +sha256  1c5033381819fdb4c9087dd291b90ec70e7810d31d57eade9b388eccfd70386d  Crypt-OpenSSL-Guess-0.15.tar.gz
>   
>   # computed by scancpan
>   sha256  5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072  LICENSE
> diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
> index 4f0898cf5..56ff79d84 100644
> --- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
> +++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.12
> +PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.15
>   PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
>   PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
>   PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
