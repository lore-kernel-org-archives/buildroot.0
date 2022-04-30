Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E163C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1952381B14;
	Sat, 30 Apr 2022 18:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJmWn2RncamE; Sat, 30 Apr 2022 18:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1488881A99;
	Sat, 30 Apr 2022 18:49:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1791BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE27D817BA
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKyOOZj2sPcJ for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1B3A81757
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:49:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z99so12481081ede.5
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rqpiC1OFuSWKrpobVVttKSt5AbxvAUcDaORXV4vstb4=;
 b=HcagUhsXb0dSd5Gd+X1i4oOPdufbUb+k4U6y6W5Hr3a8s+foeuCLjMJD3fNVs/FKDu
 2t3kA9IHfE5yBKumJZizjuEMAgFehmEUN4ZoQOm5WsP6er/kltDGyaRybvEqB7Hsl37X
 j9r8s/AQsP8vifXA7nFydZJ0T927zbRE/nWwRZP9nBUsXrg+9YpNVyjw4hqY91WGPD+k
 EbQhl97GGvtJNubwjjhbuqTQAWtgmA/ok6IkB3JEnvCRgvuyNEfdVCvwOJMl3qNVihy+
 TK1EDGH6KhKuY+dT1hvCEzV8kJcXQT3PA+LFhtIMnYRjFRmC/NQ6A/gk20OZNl59qSbH
 XWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rqpiC1OFuSWKrpobVVttKSt5AbxvAUcDaORXV4vstb4=;
 b=3bscurj5FdFog84c5KiAAxM6bU29/jYpX6R7rer4mA28rvkP/P+rkCInOQiXMp2VLD
 IeuXIO46f13l0pLG8d1gbnTyaVEOj+WgYd8cmcTB1vBJ0uCQUiPPnntELea4jDQU4O+o
 Mw97sj77CE2TZfO3LXYWLlYgyl4GfKhmwHiPIzGBSa3wrkGnohOPwohV2EXmpV2HiOq+
 0H3IlK1x3TWR2zTgKr20dbpt/9ZntP7MC2/Kc1BI78q3jcipoMhIgX9Ug7DdgTddHQ+Y
 uTb6BmmApGfUqaZpDauMd2irj4T3yO05Qj/CYAK+OCG5CdCgPPJ7ifTGI2qhH8g5Aznw
 J+qA==
X-Gm-Message-State: AOAM5310hrRetBVA+hAW/OumN4MPdvturyBs7H73QU4NyK9zvGP6YSQe
 G478O4qto5j7dx0ncZvoP7hN6Q==
X-Google-Smtp-Source: ABdhPJx1a01//EW2LjUOLUFLpHZkJqfzmuQlHlZywzO5cXGFFMSw8RtwTLz098a7oONyrdYTRokCJQ==
X-Received: by 2002:a05:6402:4252:b0:426:3f66:9599 with SMTP id
 g18-20020a056402425200b004263f669599mr5381679edb.193.1651344542070; 
 Sat, 30 Apr 2022 11:49:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170906844400b006f3ef214da4sm1888400ejy.10.2022.04.30.11.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:49:01 -0700 (PDT)
Message-ID: <ac50a71d-8d63-453b-c8c6-1a6bae135815@mind.be>
Date: Sat, 30 Apr 2022 20:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <fa4889f5-77f6-2406-5495-df83fb9fee48@mind.be>
 <20220428061031.3443-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428061031.3443-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mpd: fix iconv detection w/
 libiconv installed
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2022 08:10, Andreas Ziegler wrote:
> Fix build failures caused by meson failing to properly detect iconv() when
> libiconv is installed and a missing link dependency.
> 
> Upstream pull request:
> https://github.com/MusicPlayerDaemon/MPD/pull/1515
> 
> Fixes the following build failures:
> http://autobuild.buildroot.net/results/7a0/7a0fe4e9248ed96a5c4934361de16e0b59a51d50/
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
> changes v1->v2:
>    extract patch from git w/o numbering, fix typo, add signed-off-by
> 
>   ...iconv-detection-when-libiconv-is-ins.patch | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
> 
> diff --git a/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
> new file mode 100644
> index 0000000000..63742c0cbe
> --- /dev/null
> +++ b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
> @@ -0,0 +1,55 @@
> +From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
> +From: aeolio <git@aeolio.de>
> +Date: Wed, 20 Apr 2022 16:10:39 +0200
> +Subject: [PATCH] src/lib/icu: fix iconv() detection when libiconv is installed
> +
> +Signed-off-by: aeolio <git@aeolio.de>
> +
> +Fix typo in comment

  I've also put the upstream link in the patch itself, and applied to master, 
thanks.

  Regards,
  Arnout

> +
> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> +---
> + src/lib/icu/meson.build | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
> +index 59215e704..972c1fda3 100644
> +--- a/src/lib/icu/meson.build
> ++++ b/src/lib/icu/meson.build
> +@@ -12,17 +12,23 @@ if is_windows
> +   icu_sources += 'Win32.cxx'
> + endif
> +
> ++iconv_dep = []
> + if icu_dep.found()
> +   icu_sources += [
> +     'Util.cxx',
> +     'Init.cxx',
> +   ]
> + elif not get_option('iconv').disabled()
> +-  have_iconv = compiler.has_function('iconv', prefix : '#include <iconv.h>')
> +-  conf.set('HAVE_ICONV', have_iconv)
> ++  # an installed iconv library will make the builtin iconv() unavailable,
> ++  # so search for the library first and pass it as (possible) dependency
> ++  iconv_dep = compiler.find_library('libiconv', required: false)
> ++  have_iconv = compiler.has_function('iconv',
> ++    dependencies: iconv_dep,
> ++    prefix : '#include <iconv.h>')
> +   if not have_iconv and get_option('iconv').enabled()
> +     error('iconv() not available')
> +   endif
> ++  conf.set('HAVE_ICONV', have_iconv)
> + endif
> +
> + icu = static_library(
> +@@ -31,6 +37,7 @@ icu = static_library(
> +   include_directories: inc,
> +   dependencies: [
> +     icu_dep,
> ++    iconv_dep,
> +     fmt_dep,
> +   ],
> + )
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
