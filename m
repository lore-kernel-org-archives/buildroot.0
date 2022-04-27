Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ADDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96A581B10;
	Wed, 27 Apr 2022 19:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFYF8gWEN9wi; Wed, 27 Apr 2022 19:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABF1819B8;
	Wed, 27 Apr 2022 19:26:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E53D11BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3FAA60B52
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Rycshj4FD8h for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:26:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B15560A70
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:26:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j6so5307580ejc.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PJFn5gQp1uciG937RGrrnhgoFyoTBrg69aFePvZN/n4=;
 b=gUymxFEMDXd12AxKbfgWTMRbQQdSnndqo2ZsMC3HSSWN9XHFQYRMdQEIbfGd24Dym1
 OSL3Nk8x++BShrLfqmTcryZ54xM2QMF0/UXXlmw397to77dVrlfQDIbQeFWy726hFeRt
 UTCwvCCDVyUcPkYwjiVvcBBwuEoIHzpS/K4ca1GvDytckhSoD8RKmNtlWPfrW2oa9F9K
 bybE67UF1UzSHr0Yy8QK9ySRJaIi2gprl51oZNoMNMO7Ul2VlzUCdCBWqo0Y9uyuTuOx
 J3YF2ZDda4nKuy4jD5eQkBSAINqYDK2xs5kqvQtq7prOm97x3LlThVmocdpI55zH1xXo
 gVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PJFn5gQp1uciG937RGrrnhgoFyoTBrg69aFePvZN/n4=;
 b=3yF11GFaFK234hp8KBrdht6h15uhPomSXJYRv6SIR+dLfx63MFJeUm/BgtygRrZyxA
 vygcfwTUkpLQM3jWAFoDBAFaGAeEM9oCuCmsG1XGj8QV0gQTkHegDQA7m94/t5cWnOfQ
 qReM3b2GMQjoU/hpjF8MrIb8bS5N2RDfsV19Y7u4QjPFB3b2uSDSgIbqKgDqrdx5y69l
 0p5L+letW/0VUxSOtNyFlsT0Z6xPhjRzubXqMSibdj+AhxdUfocmeN82xTFt700baV6k
 pJwSxGpBqFLazLdRMoHO2J99Gi4JICmCDqQI+JlFUl/p6saBJI/oT9NF36C5gaMGNgij
 cLvA==
X-Gm-Message-State: AOAM531ihEidPOzU1j6XXogr+U9rb6OtUUG2y+WYT29pqR58PNvXx+F1
 Aa50OyVgDEeBvVL/sBqn6T3C+cmSZZMZ2Q==
X-Google-Smtp-Source: ABdhPJzIr/xYhBKsAx/MdRQ3YRdm1v0Jp00C7v8ZGREzKSqWWIQlhlvnULP1JoKAr/ilNKnNcHdx1Q==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id
 nd6-20020a170907628600b006da6e245e43mr27875435ejc.449.1651087610533; 
 Wed, 27 Apr 2022 12:26:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hb44-20020a170907162c00b006f3bd744275sm2755477ejc.181.2022.04.27.12.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:26:50 -0700 (PDT)
Message-ID: <fa4889f5-77f6-2406-5495-df83fb9fee48@mind.be>
Date: Wed, 27 Apr 2022 21:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220427052715.7642-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427052715.7642-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: fix iconv detection w/
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



On 27/04/2022 07:27, Andreas Ziegler wrote:
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
>   ...detection-when-libiconv-is-installed.patch | 71 +++++++++++++++++++
>   1 file changed, 71 insertions(+)
>   create mode 100644 package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch
> 
> diff --git a/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch b/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch
> new file mode 100644
> index 0000000000..6121bc9740
> --- /dev/null
> +++ b/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch
> @@ -0,0 +1,71 @@
> +From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
> +From: aeolio <git@aeolio.de>
> +Date: Wed, 20 Apr 2022 16:10:39 +0200
> +Subject: [PATCH 1/2] src/lib/icu: fix iconv() detection when libiconv is

  Remove the N/M (git format-patch -N).

> + installed
> +

  Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under the upstream 
project's license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

> +---
> + src/lib/icu/meson.build | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
> +index 59215e704b..972c1fda3f 100644
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
> ++  # an installed iconv library will make the builtin iconf() unavailable,
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
> +
> +From ee39af34199aa875e109f7002a401d6ebbd66c22 Mon Sep 17 00:00:00 2001
> +From: aeolio <git@aeolio.de>
> +Date: Sun, 24 Apr 2022 04:14:17 +0000
> +Subject: [PATCH 2/2] fix typo in comment

  Only one patch per patch file please. Though I don't see why you even need 
this patch.

  Regards,
  Arnout

> +
> +---
> + src/lib/icu/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
> +index 972c1fda3f..6e489876b8 100644
> +--- a/src/lib/icu/meson.build
> ++++ b/src/lib/icu/meson.build
> +@@ -19,7 +19,7 @@ if icu_dep.found()
> +     'Init.cxx',
> +   ]
> + elif not get_option('iconv').disabled()
> +-  # an installed iconv library will make the builtin iconf() unavailable,
> ++  # an installed iconv library will make the builtin iconv() unavailable,
> +   # so search for the library first and pass it as (possible) dependency
> +   iconv_dep = compiler.find_library('libiconv', required: false)
> +   have_iconv = compiler.has_function('iconv',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
