Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC52EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 07:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53EA640018;
	Mon, 31 Jan 2022 07:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Yrk3FeEsYiI; Mon, 31 Jan 2022 07:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D1740184;
	Mon, 31 Jan 2022 07:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 073151BF3C6
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 07:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0366783EE2
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 07:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0OOutR1RnOr for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 07:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A8E683EE1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 07:42:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w25so24094094edt.7
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 23:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WeSB0GnNzhR7+/clq/QF90nsNy1sOHSuziGWjfcl0no=;
 b=CzocouJbTw39+Tzfy1/VUjhJ535aRonCd9n6Chp48ACLdgrsS7evI9JOzc5EPgr77g
 7WmQ6420vNfqlrAKOBIDK2OgvD0G8usP3v4jZRieSMIWZueeFQIoycZZTglCZC2CLvFI
 qgTzVivhZPFUWG4kSUYhO9i/IIlMvT38xbpdmXtkJMKZQ5IN1Unv6/GqjJbZx3EM8F6Z
 zBvpnmcvyQDSjQbnWPMK+IIHEJ8p4zUcEObDkQ46NdV5UuWIZgsTpFySflhH0A6z3KYK
 1T2THbwY8GGjNBx2FzcJ6Wnxe93myFkwrl3oi04o3AQoHqCCe1Adrq8nXKIlpz5LJcWu
 NHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WeSB0GnNzhR7+/clq/QF90nsNy1sOHSuziGWjfcl0no=;
 b=lmcvOhObNjtLGvc5fP3jcs0bTxC7gNhWmKvHwkt0ZlDSr+lzP6zNCDoha/ti4FzpMc
 PW5NnuYPXaawVBDQo8dH6f/Ks0LDh+IjPQFbRgW15frFSHXddH3R3TsEOdd1rnxxKJoe
 5MVzpiiWlCyNFftJS80SvUlzVThXInB47+QlGles6/zK/hbJJm7Eg7v5oa2m0n/BtkCs
 T16DAqqQboGqHO1iFu9HfbFk9L1ybit/CqZb8tcGnphttilq42x1tss4UgZSGxbjn2nL
 ymyix7BvvXlVknO41FtLduy5Rf658PaIlZSCEJWn3DEbNZD7bhEZuDROAD3dTiKUnbdJ
 9bPw==
X-Gm-Message-State: AOAM533hVPhpZy61cKH6A9Syjhjfcxpo1T8UXIpOYisRFUjVAjUncMLC
 h3PnZ7KPe5P45RPFFY1YVRE2AQ==
X-Google-Smtp-Source: ABdhPJzS0KmnvKKkMYVFOaLmvskHeS02SMlHF+gUoZwXFmRWqrAnNm6/gN+Q9PRD3ONJOVr2urD7Vw==
X-Received: by 2002:a05:6402:2071:: with SMTP id
 bd17mr19641904edb.330.1643614974283; 
 Sun, 30 Jan 2022 23:42:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fv33sm3905841ejc.207.2022.01.30.23.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 23:42:53 -0800 (PST)
Message-ID: <45a93a2b-2172-2cd2-8ccb-77f251e55dbc@mind.be>
Date: Mon, 31 Jan 2022 08:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1643577025.git.yann.morin.1998@free.fr>
 <cb658b0784b6174058f01eb1db7ffb44885952f1.1643577025.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cb658b0784b6174058f01eb1db7ffb44885952f1.1643577025.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: fix build with host-gcc 10+
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/01/2022 22:10, Yann E. MORIN wrote:
> Some older versions of U-Boot, or custom versions (like forks for some
> boards), fail to build with host-gcc 10+, because of redefined symbols:
> 
>        HOSTLD  scripts/dtc/dtc
>      /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
>      of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
>      collect2: error: ld returned 1 exit status
>      make[4]: *** [scripts/Makefile.host:106: scripts/dtc/dtc] E
> 
> Since this has been fixed in recent-ish versions, we can't use an
> unconditionaly patch, so we must have a conditional patch. However, a
> patch may not always apply to arbitrary U-Boot versions or forks.
> 
> Upstream just dropped that line altogether:
>      https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73
> 
> So, we use a little sed-grep combo to do the exact same change.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   boot/uboot/uboot.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..9415c4722a 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -244,6 +244,12 @@ endef
>   UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
>   UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
>   
> +# Older versions break on gcc 10+ because of redefined symbols
> +define UBOOT_DROP_YYLLOC
> +	$(SED) '/^YYLTYPE yylloc;$$/d' `grep -l -r -E '^YYLTYPE yylloc;$$' $(@D)`

  Why not use
	grep ... | xargs --no-run-if-empty $(SED) ...

which also avoids the "no input files" problem.

  Also:
- Isn't it enough to search in $(@D)/scripts?
- I guess we should use -Z to make is 0-separated. I'm not a 100% sure, but I 
vaguely remember encountering a U-Boot or Linux vendor fork which had file names 
with spaces in them.

  Regards,
  Arnout


> +endef
> +UBOOT_POST_PATCH_HOOKS += UBOOT_DROP_YYLLOC
> +
>   ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
>   define UBOOT_XTENSA_OVERLAY_EXTRACT
>   	$(call arch-xtensa-overlay-extract,$(@D),u-boot)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
