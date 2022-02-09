Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA73C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA92832E7;
	Wed,  9 Feb 2022 20:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcW7P2alk6L6; Wed,  9 Feb 2022 20:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874F283192;
	Wed,  9 Feb 2022 20:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6041F1BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B894401A1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFz5jhvCeKnJ for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83D9940150
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:12:24 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id j21so3930418vsg.6
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tl7DsKdirRGyJTwssR+ZluKLEIe8qr1qhFwBQJ+xVLI=;
 b=Trc02FKk07ClYuAG1Y0ZsOPwkn+GSydyr8t1WSZLGBtLzGAUi7BBV0N1ukIBrGcSuR
 dj4czDHrIDTyzmpRvc0EC3/vRU1sS+kOVOjMcKl/TngZcSWoPOxtoC3Sa09ydns527kG
 ySKEoPouwCxwrmwrCZCx86tKdzlLMdL/pKISeq3ICr0OIN4XuD2X9VA/o3c+jCGfU1HF
 iWDrViVDKVIGNPButm6qWm3zD0OW1qfiTpGzZrjDDqjh4JUZytxe4ovkdTETjzxcn4tG
 XAD663yxKoIZDrOrQlbpbcE5JQkliLLs7S0JABgoJTnDGHbXjGRyHbT6tYdAkS35RZDp
 xQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tl7DsKdirRGyJTwssR+ZluKLEIe8qr1qhFwBQJ+xVLI=;
 b=vZW5BOWrc3yqfOmc2tY6ghq7yq1Qk6LIbk8T4Qa5AAdXh5ufNI7ScnosVFkdk8LiqL
 +vpvSpOjATNtA5DhpAQIHDpzd4qLHYMpsNE6X/SpReM5PlO4uni21Ij9IY9RVsXQbDfk
 mD3IEIm6+UYJMXlzw8FDftBzWbjxUNZAQBaHPp//c82z3QM0AiTQkEmVY75Rs8lvhk+S
 960uPkZ1B7RxvI53hyWaRAGGCYLhFFVe2eddOjzgCMI6T3MM+XcxaU5fprzfeLMtrgzZ
 cG9RKi69Eegb8gwa40XTY3t1W0IAcjDNlWb8lIFCAqB6QHPW8ykYSJL/+VCorLTUqdLz
 2eZQ==
X-Gm-Message-State: AOAM5304AU2w6FSVY8vOVel4FZLmfFhnNFfVlV3o3XMYekDVdSstbZJL
 jnmp+w+MWvc6CDyygB9O7z2tNeHcW7syXg==
X-Google-Smtp-Source: ABdhPJy49D2NXoLDU+ju9/cAzwpoHSGq5awAMptk1yZFBNc/pxe9m32HTaIyqXL/3uqUQpWco6hhOw==
X-Received: by 2002:a05:6102:f09:: with SMTP id
 v9mr1404835vss.71.1644437542905; 
 Wed, 09 Feb 2022 12:12:22 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id p186sm2989301vke.52.2022.02.09.12.12.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 12:12:22 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id k128so1827027vkk.10
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:12:22 -0800 (PST)
X-Received: by 2002:a05:6122:2213:: with SMTP id
 bb19mr1456396vkb.17.1644437542133; 
 Wed, 09 Feb 2022 12:12:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644422916.git.yann.morin@orange.com>
 <20175_1644422945_6203E721_20175_189_1_2f2cfe45bc7a546997c16e84a6e617dc0752a731.1644422916.git.yann.morin@orange.com>
In-Reply-To: <20175_1644422945_6203E721_20175_189_1_2f2cfe45bc7a546997c16e84a6e617dc0752a731.1644422916.git.yann.morin@orange.com>
Date: Wed, 9 Feb 2022 12:12:11 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rrO+pLj1h=Me-HrVjQ3fezV4dD+cY9Tw3yvNq1xAbx3g@mail.gmail.com>
Message-ID: <CA+h8R2rrO+pLj1h=Me-HrVjQ3fezV4dD+cY9Tw3yvNq1xAbx3g@mail.gmail.com>
To: yann.morin@orange.com
Subject: Re: [Buildroot] [PATCH 4/5 v2] package/pkg-golang: allow packages
 to define download environment
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Wed, Feb 9, 2022 at 8:09 AM <yann.morin@orange.com> wrote:
>
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Currently, the golang infrastructure forcibly sets the package _DL_ENV
> variable, instead of appending to it, which prevents packages from
> providing their own download environment variables.
>
> We fix that by using an append-assignment.
>
> Note: when introduced, that variable was explicitly not documented, and
> is supposed to only be used by packages infrastructures. However, that
> variable exists, and it can be (ab)used by br2-external packages (most
> probably to ill effects, but heh!). We anyway leave it undocumented,
> like _ROOTFS_PRE_CMD_HOOKS.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Christian Stewart <christian@paral.in>
> Cc: Anisse Astier <anisse@astier.eu>
> ---
>  package/pkg-golang.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 35bcb1673b..69eae02830 100644

Reviewed-by: Christian Stewart <christian@paral.in>

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
