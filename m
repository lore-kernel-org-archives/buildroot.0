Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3240C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609A682735;
	Mon,  4 Apr 2022 19:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8L7tXsEH2JW; Mon,  4 Apr 2022 19:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FAA8274E;
	Mon,  4 Apr 2022 19:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15E081BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03D6A60761
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOLNo8lukZtO for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:44:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBF9E60670
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:44:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qh7so12147001ejb.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RlwQFOXHVTX+Htvr5GVX/s4O2jcViZxSyFnJDidoyQo=;
 b=MSZli4znwiVaF6u5js+7c1hSiPUo8Xip2TjOdVV2qg21J0XrhzJBC/pBysIRemf4hs
 n/o2vQ6gqwyfE652ZnER3SrHTk3ep7oauQtwER0Z9vELrrvD1q6D6FMbMgfpDcpK/1zX
 DjuovgLJs0R2IUFaEXT3X6akEdukTIhGT+F5DbA6AQ+OFB9s9PZjeY4jMwBQ0NNOPuEy
 M4aj4yl47cNRW8ZLZ/vA++dAL1AAWOGfxvLkMdRHxe/FVK8q0Y0w9LHlD+XuzuO/hJrG
 6VG2Dy27RetSLJMph8xh1mkEk/xfIvziBHwEDmPpUCn3Fo3bI9KlDQQVP5jQ3BzUXecC
 2+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RlwQFOXHVTX+Htvr5GVX/s4O2jcViZxSyFnJDidoyQo=;
 b=d7cZWSoLKfZPjPKUYExMyE+4D0CuWaJolTJrrKr719JLT0z2g9B2XNTDG13o+ntWF6
 i+Q/HXZn9ytIK2efeK4qV3pQX3JIz2B4r7S8x+3xxPcv1cZn2Su5ZsMeyhHG66UyECiH
 ctCEYLaHVMsriOtDWhYDlgApJQxXKvXkkeeaZjNQ/hWr3+6XBLNdwcOoREmix9979hbd
 weLq/O3t/kSDV2sfmJ1zVFwJMA5u4vVm8enqIPQwcp9Iiq6u1+UNMVDzOl+diov/BtN1
 rp0MFnh9u+Yu0VRyc+YIbtePPwVfx0lp2YFR7U3/EWsc/AiNRdUyXB/UqzLIDnyoCR7x
 UNPg==
X-Gm-Message-State: AOAM533jx0Omb0ny4Dp+BjFoGpjvLAKkw4wlzTmrVMh8opGc7QXaIK1a
 QdCHJ/qzVp8OIG2Uyg8sLsfmGgc2S7OqGQ==
X-Google-Smtp-Source: ABdhPJxsChkSVYVasBT/sJ852jzuK5VLJ7IKU1CiwcY7/xydpx5/ipEKfGMLjXNp0LMLYv6S12hWsA==
X-Received: by 2002:a17:907:728e:b0:6e7:edf7:f0a4 with SMTP id
 dt14-20020a170907728e00b006e7edf7f0a4mr1665240ejc.497.1649101454747; 
 Mon, 04 Apr 2022 12:44:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ec10-20020a0564020d4a00b0041a68df1a71sm5655053edb.77.2022.04.04.12.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:44:14 -0700 (PDT)
Message-ID: <adc5ab63-9fd2-7038-89e7-78402bade2ce@mind.be>
Date: Mon, 4 Apr 2022 21:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403121327.3234177-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403121327.3234177-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: fix build with libiconv
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/04/2022 14:13, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit 47acda3a95bd4310f884e741f20785d374af7b22:
> 
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libpsl.so.5.3.2.p/psl.c.o: in function `psl_str_to_utf8lower':
> psl.c:(.text+0x1584): undefined reference to `libiconv_open'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8f012331acd3edb96a69d374436884679add8860
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...dd-libiconv-dep-to-meson-build-again.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
> 
> diff --git a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
> new file mode 100644
> index 0000000000..72f50aa593
> --- /dev/null
> +++ b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
> @@ -0,0 +1,60 @@
> +From 5b63816e82287808e81b8603a528af3cc6fab354 Mon Sep 17 00:00:00 2001
> +From: Zhao Zhili <zhilizhao@tencent.com>
> +Date: Thu, 7 Jan 2021 20:59:17 +0800
> +Subject: [PATCH] Add libiconv dep to meson build again
> +
> +Build success on macOS and ubuntu.
> +
> +[Retrieved from:
> +https://github.com/rockdaboot/libpsl/commit/5b63816e82287808e81b8603a528af3cc6fab354]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build     | 14 ++++++++++++++
> + src/meson.build |  2 +-
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index f248171..fb2de31 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -20,6 +20,7 @@ libicu_dep = notfound
> + libidn_dep = notfound
> + libunistring = notfound
> + networking_deps = notfound
> ++libiconv_dep = notfound
> +
> + # FIXME: Cleanup this when Meson gets 'feature-combo':
> + # https://github.com/mesonbuild/meson/issues/4566
> +@@ -86,6 +87,19 @@ endif
> + if libidn2_dep.found() or libidn_dep.found()
> +   # Check for libunistring, we need it for psl_str_to_utf8lower()
> +   libunistring = cc.find_library('unistring')
> ++  found_iconv = false
> ++  if cc.has_function('iconv_open')
> ++    libiconv_dep = []
> ++    found_iconv = true
> ++  endif
> ++  if not found_iconv and cc.has_header_symbol('iconv.h', 'iconv_open')
> ++    libiconv_dep = [cc.find_library('iconv')]
> ++    found_iconv = true
> ++  endif
> ++
> ++  if not found_iconv
> ++    error('iconv implementation not found')
> ++  endif
> + endif
> +
> + if host_machine.system() == 'windows'
> +diff --git a/src/meson.build b/src/meson.build
> +index 0d1dcdf..746bf44 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -19,7 +19,7 @@ cargs = [
> + libpsl = library('psl', sources, suffixes_dafsa_h,
> +   include_directories : [configinc, includedir],
> +   c_args : cargs,
> +-  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps],
> ++  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps, libiconv_dep],
> +   version: lt_version,
> +   install: true,
> + )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
