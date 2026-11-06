Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1D606A985
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Et07EZsa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2205D81EBD;
	Fri,  6 Nov 2026 16:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt7U7CLQMcP3; Fri,  6 Nov 2026 16:11:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 262B181A18
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981490;
	b=qjpTFfIM9+69BRsIJoapP5b1fuAzSpATxFZ0lMq338i6/7kAka/g96BcXwf+PL1TFsjJ
	 kVyXhOoCwKPnHo3gqh0LPE1tvsYR29MwjUhj3soP2dA8qWWR2NxT6uUDrOZ9Lp0s/LEJW
	 8h1vZTobvc+5Ewf2ZVpVCspe4LjY1647kmjlMSVjtClDLHbNJNbBb8BMBXVtwi7Vfc+kx
	 1iMm0a+NGHqdWeBxHa8Go+fxCflCfG+f09RHaIR9iKKWMq4hPYW6NFhHpLOZlHZn3uZz0
	 41dfoCUt+HVpTSirLM2lS2yQDQ1fbxq2pTAd062Y1naGYdleyfsOiWb7V3vQxAQNPtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wbCVcKq12ykFb7S3DBnN3ggnOmKt7IPLNHAl55eYdBA=;
	b=m4Rfr9rEHiEWb62Y+SoMGJT87TMxvl2pVKk/vmwY641uxm7Bmy80maF2qrCR9vlIuMwn
	 zQhStP/kcTil8QxPMO9+5SUKeC1qVWoWaPjQFUQGPvQzSPMjgLt18wGoFRqLUvsaJM091
	 CTTvg12Baey8TAGSa9Hvijrt9yjcjR0CIWcKDrRNvLjTfHEINprcCJG6gcBQPpV9mihza
	 XL50jtpkk7hNnrwQK1NIID388BbR4PK59U7n0NUhT7VOT2G6RUrCwOnrMP5oatsKNp8I0
	 DmAEwN6ZPe0yHj5ZlLHyuu+JnOeBcvM5Z6ki/NCFkyZcM/NBLyeK1uWfXG9xikczvaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981490;
	bh=wbCVcKq12ykFb7S3DBnN3ggnOmKt7IPLNHAl55eYdBA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Et07EZsai+qCEJJeBDNi4WkrtDcQkriU+DLEwShOb6+LXLXvP9nxqn3BOl/xeJdOg
	 dQpxg1PtVsEBzVDQzcoPLDcGfLbfqBWq5ltDg1UKBqMfl85/UERo8nNDvkZG36TeeY
	 93rIi1Z9dlzKu1frBYTsycQRgf0hreHzGHnTdttF4ghxncLd6s8W6arrIW767VuIuS
	 n/n4mHtC8uw2hg4xj45bWxc5wrBtwRz+Tl9TIUKfv0DbloIG13i+rHoZZmJuwaCMwr
	 rW9o2LIUv2c3gQklAob3GdMszASoaDa7IMojbdSEzHl+KVYh0ofbcALkhR3GNhmWlI
	 3ZKkT6HPpg4+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262B181A18;
	Fri,  6 Nov 2026 16:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED9912E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D313181E97
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_APK3xMFfEU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F9AC81EA4
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F9AC81EA4
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so10195295e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981485; x=1794586285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ql7R36sMWP03zC4d6SBl8jG6oaxWrtztgYCKUX4eoss=;
 b=KYBA+jZ8XaQL5A11qRfeYa68RB9OeXEZ/hEnRwvLJjy+rkaE4vwewu9cPTJKFnpvdZ
 BXJ2X/TfXz8kaDQBSP9iB3Paw0tY3i1SGdaGCaiVmMdBbGmUKC9bBK5FGY7qiJIOrYt3
 Jj58ShAeUqd9jiZADbioaM2g2pX1Hef9C8wEFt01M06gwpPSj9Tf7J0eINdJkExWzLJS
 gCl7JIbzlWYw1+WEoMyvLFIR0QW2V//ANhnZqJYP80UhtkzGRkzQ9yGEWOkKLDA697jo
 KDrnwOdZil6bHhyC+x4+dO5oON8H3Vwt42H0BF+IkgHlf0xx+XZfCNmQ2nUlE0iVb46G
 E6Kg==
X-Gm-Message-State: APuU4Z+a88ARkX/XRnrQuam5wMBlAUcdSjAHVvK14Rud/wue43hLmOV+
 PLDVbQKzIQq4BVtqB5dhQN9Ny+3+Qly0+YpSJXmV2uE90Sx4cU366tQHMjzhmuniluDUKkQgLIu
 edQCQJog=
X-Gm-Gg: AYBFou1gxABxa2YxhlP7xre+DYQ2CJTkE4Xt91m5HDaXGanJZw0ld1D9khMsp5cF+Zd
 FXkuwjhPzmaNZeMJoG35m7r4RgOQ/uzMsc9KWFQIK3YYwFb/cS1oABj16cHWXmzwrOfvZCGGosF
 9JkBVHHlbwjOTvX/Ieh12I/RhmVOjG4cweKW6qsrFaeukQXKc2bUygKxAhnYHfx6CCnJ8/KMBkJ
 mmA916gDhwX3sVCvMTqugKnHTD+ABfA59wqhLRO0NAMeYzFT83Ekclz8hYshS9NpOq19Rbwu80A
 +hEj+D0H7tAOaIZRzmMegq+0ka1jJ2Ba4QKuuNA63Xo3tBaFkBUYbhalPCq9jneWMK3Pooy+9G5
 Cuoq942yBonK3IYKc8V0McY5sCrFHSLrKMA6DbluP/HXnUgE8xSDzRhKjZ/8eyHfmsU8HET5mWO
 OGjV60IrowVPWh9pHKURcJdAPXVqzmOugjklV4ZCL5CC3MW9sfZhT+rmeAh08OlXdVcVlgM4tjO
 p6EAAevkn0M8f8XI95htYwKhDeOEbJVPeA6kn9pouMAM1LMvuuul5xmNV+/hnxBRybh2TwlwmNN
 h2NRVs33sSARVLF0lpYuJvT/AhqIhfM=
X-Received: by 2002:a05:600c:5297:b0:4b4:262b:88a2 with SMTP id
 5b1f17b1804b1-4b6dc30ae97mr48319175e9.1.1793981485166; 
 Fri, 06 Nov 2026 08:11:25 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572caf48bsm163341955e9.11.2026.11.06.08.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:24 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:22 +0100
Message-ID: <20261106161123.608086-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102101649.1855600-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/swtpm: security bump
 to v0.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This fixes the following vulnerability:
> 
> - CVE-2026-75900: An out-of-bounds read vulnerability was found in swtpm's
>                   SWTPM_NVRAM_CheckHeader() function
> 
> See the release notes:
> https://github.com/stefanberger/swtpm/releases/tag/v0.8.3
> 
> (alternative to commit b6a653e5fc31ab9e0e0b105583a693938b59711a)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to 2025.02.x. Thanks

> ---
>  package/swtpm/swtpm.hash | 4 +++-
>  package/swtpm/swtpm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> index 934d3b6ee0..8d723886c4 100644
> --- a/package/swtpm/swtpm.hash
> +++ b/package/swtpm/swtpm.hash
> @@ -1,2 +1,4 @@
> -sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
> +# Locally computed after verifying signature from
> +# https://github.com/stefanberger/swtpm/releases/download/v0.8.3/v0.8.3.tar.gz.asc
> +sha256  5c416e3a241d4adb61c66ac04ea46699885476c6c3aaa86011386e14fa4a67ea  swtpm-0.8.3.tar.gz
>  sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index 598d56cf1d..636a385db8 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWTPM_VERSION = 0.8.2
> +SWTPM_VERSION = 0.8.3
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
>  SWTPM_LICENSE = BSD-4-Clause
>  SWTPM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
