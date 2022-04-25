Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2009FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04B360F35;
	Mon, 25 Apr 2022 19:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXsah5PJzAgD; Mon, 25 Apr 2022 19:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC7D605E0;
	Mon, 25 Apr 2022 19:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62EA61BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD5D82A2E
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGyzhboWP8nJ for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:06:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79996812FE
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 19:06:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id r13so31512998ejd.5
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Cz7dMqQxqGHbC+o33kOnc6T++oYv3jGs91jjZ85C9Ok=;
 b=RxMcfQeRszPWFFDMv0+NkyEXs5PuCKmy9T0XHy1pRX9ERVI1/gWOik8d6/gkR898g3
 wCjVI6gGzlq5X6/cBIS//O3iFDJiAzHZW6fconRcknqKttMZtQEfT82dPHdYa4m+i2FD
 td0vwRlDw2XT/zPPFPitCnJyk+z+RLFK8uI/7tQR8VqFxsBufze+TFCmDBqSRtUXdHz/
 4ONDRssNd+xeQvRJfSkTdNs+EbmoEUHEGe3xxybdREj39IQ6chrU4zCpbsZnk8caChWx
 RAHDqgyDx7pDCK1hDyZckW5sN1+aCQjsv2wdXt9TZWjDlSjc0YspszgmPY57EJx3vhZo
 ZCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cz7dMqQxqGHbC+o33kOnc6T++oYv3jGs91jjZ85C9Ok=;
 b=oJ7/HXU2GK6yADQAl0EIEW7wAj2VHCQlbHKcFXy3PQA/2aqo/wfEkPH+y/FXsJQ8rQ
 C/yNHyJo7jv8Y14134lAFRXKAXTa8b1VXE45A1YP+pFBOnvs1bm0LDtpZD0HWGdlNJch
 nk+aP4J2uU7s28qrdmjLyOgeDl+0hUKAkuso0PAQjz/1XCz0a6nsYrt2/l/JV64ufWTf
 Xb3eF2K5qtobpz5D+m6IJTNKJm7YkrFhS0HxcfVJ8AMn9lhx58lz5A/Eu0DiLZoDoaeG
 403EPqaaLuUVgqQiM1khe44pcrndLOOlISm0YHqXoD5kyQTZAvUqloVMHzfrKSkbnAPu
 CYWg==
X-Gm-Message-State: AOAM533UDHQQIYTsrbLQKXeFpPJfW9uDXyCYju8jdcpufyuHUMbuQ088
 9Tg8UIqAHES4nLWNUgqDkWiqIA==
X-Google-Smtp-Source: ABdhPJw9zex5eiKPFLJSkwSlLIBshER8zEmbMtYqYPguuDFYkPzmCQlCcQ4hREBigRenMEm55TRDiA==
X-Received: by 2002:a17:906:9c43:b0:6f3:a8be:af46 with SMTP id
 fg3-20020a1709069c4300b006f3a8beaf46mr1351185ejc.271.1650913612704; 
 Mon, 25 Apr 2022 12:06:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 vr7-20020a170906bfe700b006e8325fe130sm3859335ejb.31.2022.04.25.12.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:06:52 -0700 (PDT)
Message-ID: <f1550a0e-cee9-2fdd-028b-3ef7bbbf4207@mind.be>
Date: Mon, 25 Apr 2022 21:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
 <20220422161514.3449177-6-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422161514.3449177-6-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 6/8] package/perl-mojolicious: bump to
 version 9.24
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
>   package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
>   package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
> index cc29c3553..cd6c8ef7f 100644
> --- a/package/perl-mojolicious/perl-mojolicious.hash
> +++ b/package/perl-mojolicious/perl-mojolicious.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  c7a00b4bd8fa2db991c9b918d34041d3  Mojolicious-9.22.tar.gz
> -sha256  6b76e024d3d6c077ad984ea3b3d229f093373d5e06438aca248235150d029043  Mojolicious-9.22.tar.gz
> +md5  fea8c6a9b97b988ee18b1616e20cf3db  Mojolicious-9.24.tar.gz
> +sha256  5a2f2e064fe50ad94ec5ed175403a26ec1ff4150d77742d14ca7b842e17f9168  Mojolicious-9.24.tar.gz
>   
>   # computed by scancpan
>   sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
> diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
> index 559b995cd..4a05fe48b 100644
> --- a/package/perl-mojolicious/perl-mojolicious.mk
> +++ b/package/perl-mojolicious/perl-mojolicious.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_MOJOLICIOUS_VERSION = 9.22
> +PERL_MOJOLICIOUS_VERSION = 9.24
>   PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
>   PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
>   PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
