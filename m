Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823AA824E3;
	Sat, 23 Apr 2022 14:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RcgyGohjpAW; Sat, 23 Apr 2022 14:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A8881A15;
	Sat, 23 Apr 2022 14:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A520B1BF82F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 920E0401C9
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRg-W-YwW6vp for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F654400F8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:40:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z99so13639081ede.5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VSSx0ZDrEGV4ctX7phjTYeUNcOhX9feiaYPt0gnrZ4w=;
 b=gyuXoWcvVqw/EdhBU8eETxa30RqSbvsp3vv5z9+sVfbJZtvNWmSoz+xz8L0iTPM816
 m7vo5qUnA3zHZ+3wcko/s9/I+LC9LoHiimSK/nuAMEfeBA1iKUVYmmduy2pIPwrwkiAM
 J9fH7ONpvD7cEuCaH/clOpyHS6jkbiLYdWCAouGK1H9hgcKvqhRnT+3RCWUOXJZJCYEW
 B0w/X9u1iOW525kYKsO/DrArTL3IHyEZhJwzvsHvB8oNqPr6RbGlJY/i33bnYwv3xZM+
 dBlHedIZX2c4WDXygyM1xWoAoUTc1UuvJQdvvOXIsE1Y6K5iJCbMm9D+WtxI8HCIu84o
 4lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VSSx0ZDrEGV4ctX7phjTYeUNcOhX9feiaYPt0gnrZ4w=;
 b=faIe4GyIgeYf5yM4WlME5MkSSQmiAcVFEbSVI36wia/TPskk6kKHo9bONtoResToEc
 2i5zwXPup3kI50jTeslWhsDoHtyxBHJsVFeUcsEA7zH66IlOJpfkTyGhQKqi8pppPJ4g
 CtxiRtHXTriBCSobOWjAM4VDj2VN3EemZVN/f+piF8kE7Ec0Ud5Z9mmvZ+7ebLwdWWSg
 vrHAwQxB3nNEI0LhqsK9i2lLS2Xk02o7nt8CxBmzjO8ts30i0aWt9p88GJPtOg/SIU+n
 LfsYeARWyLrJjsBvzGW4TGP/GsgvPUEfPKfaves8c1+u6rCmtSx9P1tW9C/dJkNOdHSE
 RgLA==
X-Gm-Message-State: AOAM532TQ4eCoClT+u1Uls0cSVZ5jg+3uWwWiFgN/OvIRjK2K8EmZ90h
 hiHCI75d7ckfw8LSNNgbOtqMRQ==
X-Google-Smtp-Source: ABdhPJwFN67RjBSkX/iw5YauK9ww8nv1fNvUL/NO98UknRH6TPhIeXpHy4j/zvAzHwN2CcMQW9pDXA==
X-Received: by 2002:a50:bae3:0:b0:425:b2b5:6248 with SMTP id
 x90-20020a50bae3000000b00425b2b56248mr10298176ede.281.1650724830068; 
 Sat, 23 Apr 2022 07:40:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a1709064c5a00b006e89debe3f4sm1737299ejw.9.2022.04.23.07.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 07:40:29 -0700 (PDT)
Message-ID: <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
Date: Sat, 23 Apr 2022 16:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkgconf: fix
 BR2_SHARED_STATIC_LIBS build
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



On 16/04/2022 23:13, Fabrice Fontaine wrote:
> Add --static when calling pkg-config with BR2_SHARED_STATIC_LIBS to
> avoid the following build failure if a package (e.g. dash or zabbix)
> decide to use the static library of of its dependency instead of the
> shared library (e.g. edit or openssl) resulting in the following build
> failures:
> 
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/10.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib/libedit.a(terminal.o): in function `terminal_tputs':
> terminal.c:(.text+0x1d4): undefined reference to `tputs'
> 
> /nvmedata/autobuild/instance-28/output-1/host/lib/gcc/powerpc64le-buildroot-linux-gnu/10.3.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /nvmedata/autobuild/instance-28/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
> dso_dlfcn.c:(.text+0x28): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2032d6b1233ce5c79a0c9421052ab1b9184c5b89
>   - http://autobuild.buildroot.org/results/b0e1bd19f0612a0e90d89ad8fe9e294f57871f6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pkgconf/pkgconf.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index 5d65f69c10..c40c8b9433 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -35,10 +35,10 @@ endef
>   PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
>   HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
>   
> -ifeq ($(BR2_STATIC_LIBS),y)
> -HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
> -else
> +ifeq ($(BR2_SHARED_LIBS),y)
>   HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
> +else
> +HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC

  Err, so this would mean that we almost always link statically in the 
SHARED_STATIC case? I don't think that that's what we want, really...

  If a package wants to link statically and is using pkg-config, why is not 
calling pkg-config with --static? Something seems to be really off here...

  Regards,
  Arnout


>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
