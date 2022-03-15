Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B536BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB3284261;
	Tue, 15 Mar 2022 21:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4NrqGhHyoTL; Tue, 15 Mar 2022 21:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5606284199;
	Tue, 15 Mar 2022 21:49:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A07C1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 790EA84187
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKcH6ouISlfY for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D9A284199
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 21:49:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qt6so368528ejb.11
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EJF1IbBPbpVk2+dmx28iscpSpjxFOBpRfIQeCFsDawQ=;
 b=fKK7VlNWWRb9ErNoO4OF4m5/iAZYEShtXOXghGw/spNnTLTtE6EdI39DU2h12pSmtg
 SFY2UYd7KkgpUColZ3UPwCeObFW0hrTLGj2mlc2940Mxz5b8k7uN8v3Gd5UsdHjkKT9g
 o1BaIdWNBNZRRIOaYBhVN0VGo6UnxvmoUkV+RsbAKh4JrB4K2JDLOltLt7uxyb6CIO3n
 JVFL4gq4iN79rHnoL5xtQkxE921mw8ox7L7zU5nFlG6TclXXmy0LIyrK/poHYGc2qNlG
 zchpgo5c5K0ccc5Xd6FnLSxDDjWW4TU4BoR4R5GrEO1IEfMhpaPSNMoJMvRJqSjM4iTd
 aX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EJF1IbBPbpVk2+dmx28iscpSpjxFOBpRfIQeCFsDawQ=;
 b=5IoCXry6IkgZYiBbgNUB4N8ADHw+FcvI/kwix7HXLiaUs8FE4rT8MlinC/Rag9+RsN
 nGNfMGdttnAEjNe+RbRP82UPgXoklKKv0LcgAiURRTO+2kkVp7shR3Tnv02Qg/rP9RSI
 DDVsnh2lN8CURrs1FCj7ezc8yYIDTlLCRWPOmdGgp8VsbrZ7b9Gw92Nl1G9kdmkXscpq
 cBUbZ/hafuepTtoVLGVmtWrZgFLSLfEFaFulFE64OjtXsAkTWOjkRZAtMTLwmsi4TLNS
 if0MSkrlGADzzHhQBsLL9lOkVZyR9IsJn52cZClxhPs1BQQ8iFzFnCQmNAp9UJagtRjR
 z+PA==
X-Gm-Message-State: AOAM532QxpHV3D+SQPyPglBOaOZjVpXk8njfZHIGNDWLwXEMCjK2cCct
 hWkna5/FHvM/9NdGxPLxnwVCWdTmD2KP7g==
X-Google-Smtp-Source: ABdhPJzbHrIisrrpPYxU0WX1i10lC9jfqnAtMcG3eFUL8alHDOI8p+xd9XOWI0o3iPdYsB4pd/Dnpg==
X-Received: by 2002:a17:907:168b:b0:6db:a7da:2d4d with SMTP id
 hc11-20020a170907168b00b006dba7da2d4dmr17785288ejc.101.1647380971354; 
 Tue, 15 Mar 2022 14:49:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a170906649b00b006dbebf9c3b8sm90881ejm.121.2022.03.15.14.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:49:30 -0700 (PDT)
Message-ID: <71887a9d-2d28-0bd1-22bc-b9a9cd8c7968@mind.be>
Date: Tue, 15 Mar 2022 22:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114141.919836-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114141.919836-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.33
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



On 10/03/2022 12:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgtk3/libgtk3.hash | 4 ++--
>   package/libgtk3/libgtk3.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
> index c23abcb51..23ce1f42b 100644
> --- a/package/libgtk3/libgtk3.hash
> +++ b/package/libgtk3/libgtk3.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.31.sha256sum
> -sha256  423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9  gtk+-3.24.31.tar.xz
> +# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
> +sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801  gtk+-3.24.33.tar.xz
>   
>   # Hash for license file:
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index f298afade..cd0a75eb2 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBGTK3_VERSION_MAJOR = 3.24
> -LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).31
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
>   LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
>   LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
>   LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
