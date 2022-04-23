Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A009C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E9241972;
	Sat, 23 Apr 2022 15:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 802T6F0qR7tN; Sat, 23 Apr 2022 15:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD734193F;
	Sat, 23 Apr 2022 15:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1D301BF82F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D477440609
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVknaVXlIXJ3 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77EB8405F6
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:04:03 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l7so21611614ejn.2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x6LvviAZ/BzYEyubxOFEFCBttEyX84iSGuLUKvKsNHs=;
 b=anP2J6Yc6W0ACxjs2dut38DQVC5oYdQ1tZAzWajTlJ+iBNOO/Z+aZdWA6I47571jtU
 mGzmwliVVfTMqhMugNEb+5MJoc/exq1jJKw1qllbmRybGZtdFUUW6Md8CtZDae9iX+pP
 ew3VBkgcyh7Yw5479XenTGsqadRriwZ/pgIzvDNpjTJXemKO1g23tvQP/HlTX7qT3us5
 DCi/gHoayLXddliljpzQrIsgdY72/zJry/DpNHY4Z/gTZWWGBHE4b3b9HcbKfhFdDrzO
 4OublxleSUidG38Q9+QWZJ+6QkqZ6H2Rq+pWax3pHSuCwuoPwenqz+pXUq+SR9rpaOzM
 fwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x6LvviAZ/BzYEyubxOFEFCBttEyX84iSGuLUKvKsNHs=;
 b=3dNLz7pfDMMCqq/nhkf0ktfN24tEYdYfSa/jaxXvMHau1pJjtG/as5/Xd1mHbMMs5f
 ZhkMalGli30Egx1IrKFq24+G+lVWW9YdqMdtoC25cTNoDc+X2W3Ngd/mRuHUpZlc9Y0l
 tOCtYcIoGtwpOeFcUvQlbN7iSVsxJ7OEvT/TF6zFdjw+nVfbqw/gvRWSOHPatuiVtVvL
 zk5p2ZP/bq/zsm3oQK9bBQfeFPLrm5h/uUIZq/Wm/YeuqIpLUNNxq9GL2cQDA+UinaQp
 eVvlIclwVB+fmQVJRiolhcqUlheTZM9RXPHopGq+oI3GCje75wVNhDGISposFQ96HNAY
 sudQ==
X-Gm-Message-State: AOAM533XoXonCcnlj/TNE3eBqRxJHtdztiaHlki8Kz76WMPe1vLCGrEp
 DOlj1suIrzWGEs+vaSElWWDLbB171RHpPA==
X-Google-Smtp-Source: ABdhPJyHPemtprb+4ZOlFpT1PFOc0AwmLsRPrf7SMTKmpFZhq3hVmjXqvPvR6h7aZqMx0Rpmxvk/Ug==
X-Received: by 2002:a17:906:fb12:b0:6e8:88dd:efbb with SMTP id
 lz18-20020a170906fb1200b006e888ddefbbmr8910771ejb.323.1650726241355; 
 Sat, 23 Apr 2022 08:04:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b00422d1221747sm2333597edr.81.2022.04.23.08.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:04:00 -0700 (PDT)
Message-ID: <2e3987cb-527f-28c2-cd84-0564ebbb0fd5@mind.be>
Date: Sat, 23 Apr 2022 17:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418213451.845353-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418213451.845353-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: fix build with gcc 4.8
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 23:34, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 1.20.0 in commit f94ba5c31cf7f863e6fae996fc042a56e20118f3 and
> https://gitlab.freedesktop.org/wayland/wayland/-/commit/80164ef3005e8bb5f785082b97a75cab15444f82:
> 
> ../src/wayland-util.c: In function 'for_each_helper':
> ../src/wayland-util.c:373:2: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (size_t idx = 0; idx < count; idx++) {
>    ^
> ../src/wayland-util.c:373:2: note: use option -std=c99 or -std=gnu99 to compile your code
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3040c9a8cf08415a7f4338185f6dc7245c68c64c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../wayland/0001-build-set-c_std-c99.patch    | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/wayland/0001-build-set-c_std-c99.patch
> 
> diff --git a/package/wayland/0001-build-set-c_std-c99.patch b/package/wayland/0001-build-set-c_std-c99.patch
> new file mode 100644
> index 0000000000..69f728aa11
> --- /dev/null
> +++ b/package/wayland/0001-build-set-c_std-c99.patch
> @@ -0,0 +1,34 @@
> +From 40c275f642e3895aeb748403fcdfd92d7d875d65 Mon Sep 17 00:00:00 2001
> +From: Simon Ser <contact@emersion.fr>
> +Date: Mon, 10 Jan 2022 14:54:02 +0100
> +Subject: [PATCH] build: set c_std=c99
> +
> +Set explicitly the C standard to use to make sure we don't use
> +features not available on our target platforms.
> +
> +Signed-off-by: Simon Ser <contact@emersion.fr>
> +
> +[Retrieved from:
> +https://gitlab.freedesktop.org/wayland/wayland/-/commit/40c275f642e3895aeb748403fcdfd92d7d875d65]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index cab267e9..e9691ffe 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -5,7 +5,8 @@ project(
> + 	meson_version: '>= 0.52.1',
> + 	default_options: [
> + 		'warning_level=2',
> +-		'buildtype=debugoptimized'
> ++		'buildtype=debugoptimized',
> ++		'c_std=c99',
> + 	]
> + )
> + wayland_version = meson.project_version().split('.')
> +--
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
