Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB7AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC01416B5;
	Tue,  3 May 2022 20:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWJhhBhxlfqV; Tue,  3 May 2022 20:28:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B75417AE;
	Tue,  3 May 2022 20:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB5A1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B36460F2E
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5NfWrjq8M4K for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E42AD60F2D
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:27:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i19so35496791eja.11
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Hym/7p10W91bSoh3a+D21dy2iXq2295Xriu2lkqGGQ=;
 b=Hb4PYXzumPlojsLNsj+An0fjea36dB2T/f6WnqYlSdsTYWqKEMJqRnDMsnO1/YA2PE
 I9NdMV9E558gwtmZoJi0cX1nCfWD+bf5tvHz2KSRXA8O3M7587STtOtNNGn/hNmcZVug
 QhvnqiXi1R0+7em3J4TrFLbkAVU1bSzvUu6CO+N9NJysZ7KyxfRfynA7ZbLkEwXpBTYr
 wlQ7IUtpmaZnEPyda4hVlCcfJi7uKERwiqx86dsV/NS/Ctja0YpKlp9mO/2Ey/1msybN
 9e/7lzKqwgjAvFGVYas59PmlfPRteVcFHiKb+xp43Y5FdIt0Vk5APxRUkasMcZvSRb7W
 cajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Hym/7p10W91bSoh3a+D21dy2iXq2295Xriu2lkqGGQ=;
 b=Wqvjo76pfxbjkdRpQekBI73yuZ68ucV7I4h1Y9hk20cnLtO7DYgMwf2exCKUBqpaJb
 R6piXKyOoXGSBqX6HOJfoLp07OGaPSF9j4vclKoHS5CxQuCzvhbfTfpRZ/Z+dgQjGUEs
 m/K5fcB71K4hjUMxti5V1/zXnKMb3PW9yucO6z5fNQZDwdDTY/tiuDXxiYJAh8+dxf4I
 1VY2WznrJLUqlZ0V99IKP2ZHO5WnjEOINX2AuaWiNayQiAmmc/pcSEF/mXEmL63GnXI+
 f9fxWXmSR1Q34sInLP0Rj/rl7GNet94ZFqwXtluMr8mDK2qiwBxHDwRvaNTsMps+wqVW
 0vRQ==
X-Gm-Message-State: AOAM531xHZEPrHL38IO1po3f4sjSQYsbrZKFvoWGdAirmmxy+EidYMhR
 pRI34kVLVkMAZIm4Pzi7COHm9Q==
X-Google-Smtp-Source: ABdhPJwKxzl1lR1iqpifjG0XtFmaqYrhXUmXd2NSFK6k0F+djGpmngtFwM2CBGZLN8tvZRG8IyQJqA==
X-Received: by 2002:a17:906:c10d:b0:6f4:a770:846e with SMTP id
 do13-20020a170906c10d00b006f4a770846emr2533597ejc.497.1651609669145; 
 Tue, 03 May 2022 13:27:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gv3-20020a1709072bc300b006f3ef214db7sm5012149ejc.29.2022.05.03.13.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:27:48 -0700 (PDT)
Message-ID: <5c3f29d1-d0e6-6772-b263-0d51d1ffd679@mind.be>
Date: Tue, 3 May 2022 22:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220503011754.2730166-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503011754.2730166-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/luajit: depend on
 !BR2_PACKAGE_LUA
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 03:17, James Hilliard wrote:
> We can't enable lua and luajit at the same time as they both provide
> the virtual luainterpreter package.
> 
> Fixes:
> package/luajit/luajit.mk:80: *** Configuration error: both "luajit" and "lua" are selected as providers for virtual package "luainterpreter". Only one provider can be selected at a time. Please fix your configuration.  Stop.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/luajit/Config.in | 2 ++
>   package/snort3/Config.in | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 3111a2548f..f27099e80c 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>   config BR2_PACKAGE_LUAJIT
>   	bool "luajit"
>   	depends on !BR2_STATIC_LIBS # dlopen
> +	# Luajit conflicts with the regular lua package
> +	depends on !BR2_PACKAGE_LUA
>   	# Luajit is only available for some target architectures, and
>   	# has some complexity wrt 32/64. See luajit.mk for details.
>   	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> diff --git a/package/snort3/Config.in b/package/snort3/Config.in
> index dcc29b820a..9b96e7cb58 100644
> --- a/package/snort3/Config.in
> +++ b/package/snort3/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_SNORT3
>   	bool "snort3"
> +	depends on !BR2_PACKAGE_LUA # luajit
>   	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
>   	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
>   	depends on BR2_USE_MMU # fork()
> @@ -34,6 +35,7 @@ config BR2_PACKAGE_SNORT3
>   	  https://www.snort.org/snort3
>   
>   comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
> +	depends on !BR2_PACKAGE_LUA
>   	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>   	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
>   	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
