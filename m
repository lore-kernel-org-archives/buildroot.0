Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB17160FE6;
	Mon,  4 Apr 2022 18:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjkHA5tbNty5; Mon,  4 Apr 2022 18:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0961360B0D;
	Mon,  4 Apr 2022 18:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 685071BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57B3B81AAC
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Syju03G28jxr for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 842D2817AC
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:48:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r13so21888878ejd.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9BN1u6Z1wdZBfSL5E1FriLVQM1CLK2g9feyXLxtFWwo=;
 b=OqMnp2jY/YSJpivH0zbCRiQ8FF5hqxvvDoM+Vgd5ut56hDpZrq1wunthW/JrQBN0wf
 jAEoywXRibf0DZ1nplsgXaul3h3A4IeTRCPLpY/cJ+gLX7G8mpryJN3k7Gj56ZjX+IQs
 iBErQSUWtS3/5dYQSXyHBBQ/4aXw4Ax38qX/cKzB7aCq0js2/Rudo2CkQpW8UYUK912N
 teDO++YY7Pk//x1I/pwjgu32Cj1QioiscE3482BG6o8ELLtREj0IPcxkqv+PIAtO38Ly
 Tio+HadfoXbztofUoAPAEFHZiiziqZGg2N9HpVwin0WLYD+gc2cL6iQqN8ZqMjzkYJZY
 AZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9BN1u6Z1wdZBfSL5E1FriLVQM1CLK2g9feyXLxtFWwo=;
 b=pq7gOf9itxSE3sF5Aysuoa9XgLUcltAH+opUtb/nU0IWzHE3kux1VisyBZn3xAzS7a
 EolA/VfeqeLMRFe4mMKL8/NP0XoSRJ9yZnm2L6SQk/1Y8SOp8y65wyyDQHwYMtUqa265
 ajDFnbdxNNvaHYoF6d4Vu3tHPMnrWNr5WYatRu/uRYnyO7XlsN9kjSFU2KOy+V1QUTWk
 RMj6Vlxo23rKkQznK8kzbW2Go/mIdAKbFxZy5Dz4GrixmM9sjiS8HQCoSzYcqGQavXby
 PGlsnvg7J9431BegaBeU6PgLQB8UifEeDkddB2YWUg1AoBUMndoCD9hRqaGgpjTJ8FJF
 Rm9g==
X-Gm-Message-State: AOAM531XkhV8EFVGAxcY78K1kbNZco7UQoR131aWLP30twCQvn25M7aD
 mstIj1jv06ZC8URA6Czmx8OFvw==
X-Google-Smtp-Source: ABdhPJy2Bk3HRM6xCa9Xuem0np5Aihs/oRVVInygsDrU9xGbFiBvi31m51fZX++l2O/p1ZsnYWXvww==
X-Received: by 2002:a17:906:cccf:b0:6e7:5336:8bd7 with SMTP id
 ot15-20020a170906cccf00b006e753368bd7mr1468829ejb.583.1649098132735; 
 Mon, 04 Apr 2022 11:48:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a170906178100b006e7edb2c0bdsm2022621eje.15.2022.04.04.11.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:48:52 -0700 (PDT)
Message-ID: <1ea289c4-8f58-8a61-1d1f-116ab6a117ef@mind.be>
Date: Mon, 4 Apr 2022 20:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402130049.453518-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402130049.453518-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libkrb5: fix BR2_SHARED_STATIC_LIBS build
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
Cc: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 15:00, Fabrice Fontaine wrote:
> Fix the following build failure with BR2_SHARED_STATIC_LIBS raised since
> the addition of the package in commit
> 7ae94b51ed5d51fb9fa3f5a931bb8435bcbfaa42 and
> https://github.com/krb5/krb5/commit/bd13166a4098198832d921b8e50b97008b714b7b
> 
> configure: error: --enable-static must be specified with --disable-shared
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dadbf9f77ffdcc4d4e48c6d7e6beb5da303a8074
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix patch number

  Not really necessary to respin just for that...

> 
>   package/libkrb5/libkrb5.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index d14c464b39..0553e9bdb4 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -37,6 +37,11 @@ LIBKRB5_CONF_OPTS = \
>   	--without-tcl \
>   	--disable-rpath
>   
> +# Enabling static and shared at the same time is not supported
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LIBKRB5_CONF_OPTS = --disable-static
                      +=

  Caught by check-package, fortunately!

  Regards,
  Arnout

> +endif
> +
>   ifeq ($(BR2_PACKAGE_OPENLDAP),y)
>   LIBKRB5_CONF_OPTS += --with-ldap
>   LIBKRB5_DEPENDENCIES += openldap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
