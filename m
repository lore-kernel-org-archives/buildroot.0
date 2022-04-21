Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E039C41168;
	Thu, 21 Apr 2022 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZEtfLC0wdN9; Thu, 21 Apr 2022 20:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D323A41182;
	Thu, 21 Apr 2022 20:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 305811BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1625241095
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mxby_Oiy7HFE for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9330411C6
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:55:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h25so2252053wrc.13
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aq02UaL6Ow3UzfdvnPjbY5JvuA8JNP2TlUOECtu6b8E=;
 b=TzsmdYbN3J4kQUO6PDT+GgRfaIscxUUswYLa0TFuSXJsy0F+QU0k8PQ1LuQhJon1i+
 aDciP2FoX0BIuHxJY0Yp0r/gMFRRc6E27Zy4MCn9jGlgs08ImXpeKRkpIDH9KWAjP6os
 p8v9qNjWiQPT6Aqa9gTH+VCKI9extuFYLH8Ba/88wWE3qbcT2GZbU48fYh4VmV8In35b
 4dFEgZVFWfn/h48vKndHyD3Rn9G3ZQ7aT3aMhArMXuMzuXC0ixvD/PuCINZsNKVBpUm0
 1jv0fs9Ej/40a4J8WYMXiHPw2+Xr8QnqfCNmTaCVWlvqI7ymPJcfVEx1/vvncnLIPP5E
 sKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aq02UaL6Ow3UzfdvnPjbY5JvuA8JNP2TlUOECtu6b8E=;
 b=h8aylAQSRkWF0c3LLiP88125Ye7N7Z836YZjtPqIALXU/wd6WHCIxkiCLAmWXQ3HkE
 KXNlIQ3lxe9LfJ6dN8kt22Jblz8YwicXlulf9cenPIw/PC0D4sdyC1kzG6erVlCNafrT
 F+gPW5Z6esP29LJEmC0fzYzBlS6/lF87vNTMnUpCgFBpGRU3OQJaQSu2h/LQad4ZKoCW
 zE/gVMP8/fzAoUr0HPrWczzv+MboJFxZ7TEWHA+LouUf1jkHxzvCAaOi4xk6NGJJb9Ag
 4FxUSX05RtkAdXHJYdlthp3YFAINO4HZHLfJ11vuCCd3u1HHWOo3zPjdo9Jb+e3AjRTP
 vbyA==
X-Gm-Message-State: AOAM533jK3zRdlE2LPhPehW86NV2JKIQtJpnGjCPLBgNr2kCrA1HUKPV
 qTM3lI1XwHuVuscRUhWIznhFp+SMSdqvpQ==
X-Google-Smtp-Source: ABdhPJwtn6XSQPWVpYWicY+jSQ0kAAPXYjd9/bD8nTU4iJkej5qx9BDBmctyB9E1lt2vpUcAHRacuQ==
X-Received: by 2002:a5d:64e4:0:b0:20a:91e4:c0f9 with SMTP id
 g4-20020a5d64e4000000b0020a91e4c0f9mr1021493wri.55.1650574527081; 
 Thu, 21 Apr 2022 13:55:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d598a000000b0020a9493bdddsm99691wri.40.2022.04.21.13.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:55:26 -0700 (PDT)
Message-ID: <1270056e-42cc-268e-257a-b9c1e437fdc6@mind.be>
Date: Thu, 21 Apr 2022 22:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220417205241.396289-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417205241.396289-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/minizip: fix build without C++
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



On 17/04/2022 22:52, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 2.5.3 in
> commit fd03e8192f1b4d5eae9a9458c5a06bebfa95fb7c and
> https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
> 
> CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>    The C++ compiler
> 
>      "/usr/bin/c++"
> 
>    is not able to compile a simple test program.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...1-CMakeLists.txt-fix-build-without-C.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> 
> diff --git a/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> new file mode 100644
> index 0000000000..b0cb6a6c1e
> --- /dev/null
> +++ b/package/minizip/0001-CMakeLists.txt-fix-build-without-C.patch
> @@ -0,0 +1,41 @@
> +From 4e7899f3d0533f83b7230ffa787087b65ddd45c0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 5 Apr 2022 18:20:14 +0200
> +Subject: [PATCH] CMakeLists.txt: fix build without C++
> +
> +Fix the following build failure without a working C++ compiler raised
> +since version 2.0.0 and
> +https://github.com/zlib-ng/minizip-ng/commit/d383a5f2fca127d24407ff26adce579d63b85310:
> +
> +CMake Error at /nvmedata/autobuild/instance-20/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
> +  The C++ compiler
> +
> +    "/usr/bin/c++"
> +
> +  is not able to compile a simple test program.
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4452bc35b41414a5e8a0e9831b0854228df5fba4
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/zlib-ng/minizip-ng/pull/621]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index fef46c3..83adaf3 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -661,7 +661,7 @@ endif()
> + list(APPEND MINIZIP_INC ${CMAKE_CURRENT_SOURCE_DIR})
> +
> + # Create minizip library
> +-project(minizip${MZ_PROJECT_SUFFIX} VERSION ${VERSION})
> ++project(minizip${MZ_PROJECT_SUFFIX} LANGUAGES C VERSION ${VERSION})
> +
> + if(NOT ${MZ_PROJECT_SUFFIX} STREQUAL "")
> +     message(STATUS "Project configured as ${PROJECT_NAME}")
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
