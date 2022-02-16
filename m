Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37622C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3C64177F;
	Wed, 16 Feb 2022 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WM6-wW31eknY; Wed, 16 Feb 2022 21:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27EE7410AA;
	Wed, 16 Feb 2022 21:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA6F1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AB1F60BEA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkvfmOlGH6Bw for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 106B560BE5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:47:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d10so2266834eje.10
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8w7+UxjW9pPf2REtQwgS3QrcU++gPujwzgjOxsdAdFg=;
 b=curHm3Z4AEnkwhFyFowf/B1tUj7Za4NzHao/JX2a8mHllhIJ8MFevy7FY+Ar9pPRto
 OHR7uRPzNcsYmz18nnjQrHuQ9kDcXxN+fkacW86PxgRLyymruXv7G7muhMuHFN4N9R3b
 YdFG+xMGyNJHirmKcDiPm4JvZsl89ffelCt/7CcXlk1qGkNy8fyLJrJXn5IRnlFWDuVU
 aWgLfwIqeKHXsoZkTNtzv0Vxk5KA2OfAl/W8cODbLt+2mTR9WCr6bZLG+pEMZTNC5nyR
 xG8co6S8092HXs7Z/MjkokHwDFwIlFYxo5ClYocGczQCg8W/DVb2yA0L+wrDd1JTMVvU
 sM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8w7+UxjW9pPf2REtQwgS3QrcU++gPujwzgjOxsdAdFg=;
 b=wvLbrxJSLlkWOizqgjE1KatEEkhumdrFIPwqL5ElPAw4A7oiIo7KXRZPu2CAzN4MWZ
 cZFrresoY0us80GbeRMdn+Q+/q7jOcBoesZ8rfmsJMH6A7uPbDS04AU3GK4Jvg8CKNp1
 zbQ1AGh1qqqzf7nSmBpqb6W1gPpDrYEkpDQFfIuID7ujWLNtvFhaAadYImVgOKBXNLU+
 X0BLJL/xv1eIqaNxg8UbGBPrmk8zEuNuPRNjJwHFtCLppUXO78KTzQTisewFvuvjFU6z
 ZTZFwP1po8dimCPQE1ay3gSO2MXDRyReyFjeXwC96zOatU+hE2ZEvJl81gSpgWPpj1L0
 uC9w==
X-Gm-Message-State: AOAM533xnZYAovm6svl4eSg7HW226aWr5zpHGeVAdGXZBLvJE67PcKXZ
 T4aXpNqORoklKyLPTHKdQ89lyA==
X-Google-Smtp-Source: ABdhPJyk0vGwuGBYdY7Xj3Uypr9fZEsS9QQ+Lbo7lt7Fnazys2YffHIPiMOZnND7bMapRGex3KIjDg==
X-Received: by 2002:a17:906:2b01:b0:6cf:9cdb:b336 with SMTP id
 a1-20020a1709062b0100b006cf9cdbb336mr3798297ejg.707.1645048044211; 
 Wed, 16 Feb 2022 13:47:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f14sm2395439edf.67.2022.02.16.13.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:47:23 -0800 (PST)
Message-ID: <155125a2-2bad-5ebc-e080-276729f1a179@mind.be>
Date: Wed, 16 Feb 2022 22:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213112025.979418-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213112025.979418-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/safeclib: fix build with gcc 4.8
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



On 13/02/2022 12:20, Fabrice Fontaine wrote:
> Add -std=c99 to fix the following build failure with gcc 4.8 raised
> since bump to version 3.7.1 in commit
> cc27267ae41bf44276c63b1e86042c4fae4adf50:
> 
> In file included from abort_handler_s.c:35:0:
> safeclib_private.h:167:18: error: anonymous variadic macros were introduced in C99 [-Werror=variadic-macros]
>   #define slprintf(...) fprintf(stderr, __VA_ARGS__)
>                    ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5c3468585942879b47331e05058d25d324c8cc23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/safeclib/safeclib.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
> index 91b3e26c68..bc58c1a38c 100644
> --- a/package/safeclib/safeclib.mk
> +++ b/package/safeclib/safeclib.mk
> @@ -11,6 +11,7 @@ SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
>   SAFECLIB_LICENSE = MIT
>   SAFECLIB_LICENSE_FILES = COPYING
>   SAFECLIB_INSTALL_STAGING = YES
> +SAFECLIB_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
>   # -fstack-protector-strong is used by default. Disable that so the
>   # BR2_SSP_* options in the toolchain wrapper are used instead
>   SAFECLIB_CONF_OPTS = --disable-hardening
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
