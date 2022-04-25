Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C25C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078C182A17;
	Mon, 25 Apr 2022 19:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuOTQ-8t8W54; Mon, 25 Apr 2022 19:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 147EC829AF;
	Mon, 25 Apr 2022 19:06:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAA381BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C98EE829AF
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3oiKahbLqW1 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:06:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D256C82974
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 19:06:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id d6so14523618ede.8
 for <buildroot@busybox.net>; Mon, 25 Apr 2022 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SJGMzGMSjlveIHwT82sc060pXkeDpL2xXutEukVNpt8=;
 b=EbR6Ab6L/YnEhtYOPHHx879sf0jXnb92fFCO475bDys7lUTl2e9zsTSEI8m+OwFs9m
 FKdyeJTQ4jPlA8gG2f9PjtSzzy5rhIgLEw3fOb2VgYIza4m7M8i5QZgRUvIPQV8u2WQu
 eIvNyWrHfZrEQddPDezBga0fh4TexV2PcMAhuQ8WpXqAsO1EDIHn492JOEvCTmT1fdom
 mpFtDOLoozztzG2S7VcmEojZfiy7s8cKf5eEPsLvxLweyv7U0VtcRij1fMG9bjoC0tCL
 unGqwuMh24et8Y+G2n3Cy5BJDFMeuKZOGaV0E6ghPA6R7MlXl0wJGY76G1V1VQZ6h3pJ
 4DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SJGMzGMSjlveIHwT82sc060pXkeDpL2xXutEukVNpt8=;
 b=hhhAIoCZ3VuH0H7kLUG8O6ja/obQTV7ppUbu8TuTLu9m+PeqXd+wW+bbkDOm8Ibs9s
 juBSHmXbFqjkA62sIRe6hBgBYzttBNgzdiad2mnCW9R7N8cJ/8O8KJwbfe0zHhJuM2ES
 ODbpPaoEIAJVlzgbV0O/PIAWKxlC4qIVmmGAPuD1xi2nm6+XadCDk78j+MdKLnFkMSSB
 +n0JPtlpZQ8GPa+cB1cP5pj27dh0sJyumbjBjqz0bXwc+x6GXk4MKZujd7fGDTgBmVQR
 +jYAHF1TiSFmoxJl6jTES/4XQRq1/FGw8TxcibuVxcw6SWp1daUCihQV/kkeM3FhUn4V
 wf4A==
X-Gm-Message-State: AOAM533jYiQJIt9FNsmY84fT/mky4DT0e+c2NC8vnKXBBwF8FxNpCS2i
 Zg5fjdTVKql5BhZ+vZD3lqN7epEgOSlEkw==
X-Google-Smtp-Source: ABdhPJweJlr7oCWgm5fYpfVYyE2Rc5WUkZV+YmFJstYxvjWPqRzK9jbaXXSUVhtmqfBarc6nycRgLg==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id
 n9-20020a05640205c900b00420aac6257bmr20597604edx.128.1650913594062; 
 Mon, 25 Apr 2022 12:06:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hf3-20020a1709072c4300b006f392c2bf71sm1532144ejc.175.2022.04.25.12.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:06:33 -0700 (PDT)
Message-ID: <a97e85ae-8776-f611-77c6-0434c2cfe48d@mind.be>
Date: Mon, 25 Apr 2022 21:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
 <20220422161514.3449177-5-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422161514.3449177-5-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 5/8] package/perl-libwww-perl: bump to
 version 6.62
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
>   package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
>   package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
> index e32258050..25b6675ec 100644
> --- a/package/perl-libwww-perl/perl-libwww-perl.hash
> +++ b/package/perl-libwww-perl/perl-libwww-perl.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  ce5180358d9279b2843a6518bf2de200  libwww-perl-6.60.tar.gz
> -sha256  cdd28b9237b9c6791725b9099695c7c3c720b33881606fd6cc7635a5495bb07c  libwww-perl-6.60.tar.gz
> +md5  3cc193bbddb1dc9e867e88582b440a92  libwww-perl-6.62.tar.gz
> +sha256  569ac15eb69d54b2a8d932403610690b89c68d6a987eab2f627c0639bae7de18  libwww-perl-6.62.tar.gz
>   
>   # computed by scancpan
>   sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
> diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
> index aa15ebb59..43bd4db78 100644
> --- a/package/perl-libwww-perl/perl-libwww-perl.mk
> +++ b/package/perl-libwww-perl/perl-libwww-perl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_LIBWWW_PERL_VERSION = 6.60
> +PERL_LIBWWW_PERL_VERSION = 6.62
>   PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
>   PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
>   PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
