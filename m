Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A77C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D652404BB;
	Mon,  7 Mar 2022 21:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uri0WMIvZajv; Mon,  7 Mar 2022 21:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BF7A404B0;
	Mon,  7 Mar 2022 21:46:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE3561BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE7064173A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8liU-_Xu-ar for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:46:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FF60415D2
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:46:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hw13so34834375ejc.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jBp/39fLt56DR3dTCfM+nY0fxgq6hU/x1tRxdJP/Bbg=;
 b=iOgSn0XH8PBLt7Qr8fapXQx0yAElCEcsTNaaKoeNZGg0PSe081q7kk4/sm7OYzj2Gp
 a6pzwlqop7ghMnSkBIqmEatq6BFDCmRX6Lq4vD8uxGXZ3CZaIGglEbZpB0ozBEUKq2mG
 xxAAPxpGg6kPKpgO0qku7/tqzsQmcx9yMf0j6drnfMt1GDqpGmgFtU7JLD64rI+SAv2r
 Ck5xLsEEnglUIJXv4vmvMs9k5Bl5tooTIu568VC8Kio0bP6n+Y7p73yuvj/gvtgrjfAy
 i0JA4cF5sIA6knXf7MO+R5yoPJfavYAPQM1N8nJVh5C9qt/+a12Y2+r2s1vvDFLiFk15
 epDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jBp/39fLt56DR3dTCfM+nY0fxgq6hU/x1tRxdJP/Bbg=;
 b=vxgLqMpCfnjkxUuw2NX4UsPKvz5B1xu25irGsXXZ10ac6j8yNvRlx/ZLZOrlF7gBG+
 5MaqOxylZxTF34hwWij4L67qq2ic1a4yrQ40/tpFQY2EFNQvjcekKfnbTo+gnCT51nWT
 sxseSVter2GajMNpNkliBbfgg37M/q2YNXVHnpxqXRi22gZflj6IWC6n0uFnxVHNCMCz
 TOtE7Nd/rBnlHfsDuecO43Fhn7vTvRCTRZDHBykzscRiX4xNOSp77tpHHNSxR2w37U2z
 gT4OMilw4bfB70v3HuzZ0JN8Ota83927RyNSd5yYh/omiWCbrPshn+g1biOVLPYnWZ2l
 menQ==
X-Gm-Message-State: AOAM531qT0LFkfuCHsgO6TYUNJoSeMEE2EsehAELd1mroMsqlNbvJNOL
 FgcYg6hiCm2QhM46KH7QIJFG4rukTtpLAQ==
X-Google-Smtp-Source: ABdhPJyX3iRV2oSQiGvwi/XPTSME/nyGiz00iBOqZfvllCDV3jD7tT6dnZw5aauDmfOSBdHvPjdNug==
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id
 d9-20020a1709063ec900b006bb2eb9084fmr10534689ejj.86.1646689592236; 
 Mon, 07 Mar 2022 13:46:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a170906275500b006d10c07fabesm5138044ejd.201.2022.03.07.13.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:46:31 -0800 (PST)
Message-ID: <2fc5dae4-85a8-9197-d5ea-eebd9d77871c@mind.be>
Date: Mon, 7 Mar 2022 22:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: John Keeping <john@metanate.com>, buildroot@buildroot.org
References: <20220219154350.1552021-1-john@metanate.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220219154350.1552021-1-john@metanate.com>
Subject: Re: [Buildroot] [PATCH] package/gdb: fix when gmp is installed on
 the host machine
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



On 19/02/2022 16:43, John Keeping wrote:
> gdb's AC_LIB_HAVE_LINKFLAGS macro hardcodes a search starting with
> /usr/lib/ which can lead to libgmp from the wrong architecture with the
> result that the test fails.  Even if a libgmp is found there it is now
> the one that should be used.
> 
> This is the same macro used for expat and lzma for which there are
> already specific CONF_OPTS flags added here.  Add the same flag for
> libgmp and move the handling down so that it is logically grouped with
> the other similar options.
> 
> Note that there is no --with(out)-gmp flag to configure, as the
> dependency is mandatory, so only the --with-libgmp-prefix option is
> specified.
> 
> Signed-off-by: John Keeping <john@metanate.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdb/gdb.mk | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 05de3c14d1..9bde2beea1 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -77,14 +77,6 @@ ifeq ($(BR2_GDB_VERSION_11),y)
>   HOST_GDB_DEPENDENCIES += host-gmp
>   endif
>   
> -# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
> -# we're building the full gdb for the target, we need gmp as a
> -# dependency. For now the default gdb version in Buildroot doesn't
> -# require gmp.
> -ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
> -GDB_DEPENDENCIES += gmp
> -endif
> -
>   # When gdb sources are fetched from the binutils-gdb repository, they
>   # also contain the binutils sources, but binutils shouldn't be built,
>   # so we disable it (additionally the option --disable-install-libbfd
> @@ -169,6 +161,16 @@ GDB_CONF_OPTS += \
>   	--without-curses
>   endif
>   
> +# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
> +# we're building the full gdb for the target, we need gmp as a
> +# dependency. For now the default gdb version in Buildroot doesn't
> +# require gmp.
> +ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
> +GDB_CONF_OPTS += \
> +	--with-libgmp-prefix=$(STAGING_DIR)/usr
> +GDB_DEPENDENCIES += gmp
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
>   GDB_CONF_OPTS += --enable-gdbserver
>   GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
