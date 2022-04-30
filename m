Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A276415A6;
	Sat, 30 Apr 2022 18:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpAjc0ZiFXrV; Sat, 30 Apr 2022 18:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4F1415CB;
	Sat, 30 Apr 2022 18:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1983F1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 155B34156F
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDlPrkFbv8gH for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8168E4155E
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:43:52 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k23so21066468ejd.3
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3LKoPddTtnjdFTarngm2C+d1ReQ/ac1vTD+7ILgtnuY=;
 b=O4TFgzytmAONPsqrSX0Gywdt6WyLsI5O36ozIO+PcF0nVakYK2dkhO9LKLM00iBUKD
 WHuiGLo+A8oxIxYqDGTl9bq1GHI7rzWox8ChT7LxYfQLAZrBfnq7XryGXFhAQrSJntKR
 oDqBor8fthaMeAugTzVxoloxB/ZtFroZG45DKKuSDyu7PZ5CqUQlQRwLQa8wJ2CqdvAV
 OCTrhpwuP+22BhjapdZrtxfH8rDrluzhBxVygzEErcyAMEIY/RZCEoNNhH/fSGW4laiA
 y2TnMLmtfFflm6LoR2cylQucK/bL3XFR5MWtj8YqW8YPdxdoF8dhk1NMEFi7I3mXJB2O
 bivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3LKoPddTtnjdFTarngm2C+d1ReQ/ac1vTD+7ILgtnuY=;
 b=wmyCA0vXwE2EpTF5+MtjIhSZo67m85ggJ7Tys64wufng05eXVt0tT9rXFyJwLVx6pQ
 UzuLAKW4rWSK4uF+b1CKq6PLrMO5eeZZuZqNs7ZH02Nmtss1BdT0VC4zC6nuPKZut5Vo
 aNIpmDetR8fchhlyquRkBo3qAuIDQbpAcOXyVLYNevfE7HCCSc1WJeE5plcXMCNfRZ5h
 zAd0kV0yEtf/fIyR1PfnE20KL135SPZOOWP7oyPGT7PSaf904GkncawIYh6yZBSqoFw+
 JURHuqt/98Zt8v8oTZ1NJHNclI0QpQQeV0jLpSzUvjaqRQ7+K772dcvSayRtMrzQ/6wE
 YT4Q==
X-Gm-Message-State: AOAM531bbUKdb++dXAwjmLicsvZ6XGmwfPbFrfclN/alHSrcbRhG1ns/
 D6ohvNwrlss6s0qssxmqxh1h44ulkSbCsg==
X-Google-Smtp-Source: ABdhPJz9acxzNZcySJBLVPbstc+LmoW6HibiysXY9E5IxUa1CUwf/X2wGeEuW3Yj3dpoMSOXzjmDPQ==
X-Received: by 2002:a17:907:3f1c:b0:6f3:98ab:4735 with SMTP id
 hq28-20020a1709073f1c00b006f398ab4735mr4875910ejc.547.1651344230391; 
 Sat, 30 Apr 2022 11:43:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a056402038400b0042617ba63c9sm4413015edv.83.2022.04.30.11.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:43:49 -0700 (PDT)
Message-ID: <9cf624c2-6e87-f664-08ae-6920968fe152@mind.be>
Date: Sat, 30 Apr 2022 20:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220427200838.2896323-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427200838.2896323-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: disable tests
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



On 27/04/2022 22:08, Fabrice Fontaine wrote:
> Disable tests to avoid the following build failure on mips32:
> 
> [9/10] Compiling C object tests/try-syscall.p/try-syscall.c.o
> FAILED: tests/try-syscall.p/try-syscall.c.o
> /home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
> ../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
>     34 | #   error "Unknown MIPS ABI"
>        |     ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-meson-add-tests-option.patch         | 54 +++++++++++++++++++
>   package/bubblewrap/bubblewrap.mk              |  3 +-
>   2 files changed, 56 insertions(+), 1 deletion(-)
>   create mode 100644 package/bubblewrap/0001-meson-add-tests-option.patch
> 
> diff --git a/package/bubblewrap/0001-meson-add-tests-option.patch b/package/bubblewrap/0001-meson-add-tests-option.patch
> new file mode 100644
> index 0000000000..32836f925d
> --- /dev/null
> +++ b/package/bubblewrap/0001-meson-add-tests-option.patch
> @@ -0,0 +1,54 @@
> +From 34ea0ad841d6f9167db391c08e6cd51471fed6be Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 3 Apr 2022 11:27:06 +0200
> +Subject: [PATCH] meson: add tests option
> +
> +Allow the user to disable tests, for example to avoid the following
> +build failure on mips32:
> +
> +FAILED: tests/try-syscall.p/try-syscall.c.o
> +/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
> +../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
> +   34 | #   error "Unknown MIPS ABI"
> +      |     ^~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/containers/bubblewrap/commit/34ea0ad841d6f9167db391c08e6cd51471fed6be]
> +---
> + meson.build       | 4 +++-
> + meson_options.txt | 6 ++++++
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 5b63aa64..9277ac4e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -152,4 +152,6 @@ if not meson.is_subproject()
> +   subdir('completions')
> + endif
> +
> +-subdir('tests')
> ++if get_option('tests')
> ++  subdir('tests')
> ++endif
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 2fa3a8c3..a136a3c3 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -38,6 +38,12 @@ option(
> +   description : 'enable optional SELINUX support',
> +   value : 'auto',
> + )
> ++option(
> ++  'tests',
> ++  type : 'boolean',
> ++  description : 'build tests',
> ++  value : 'true',
> ++)
> + option(
> +   'zsh_completion',
> +   type : 'feature',
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index 5875b0d6e2..81456e9e0d 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -17,7 +17,8 @@ BUBBLEWRAP_CONF_OPTS = \
>   	-Dzsh_completion=disabled \
>   	-Dman=disabled \
>   	-Dpython=$(HOST_DIR)/bin/python \
> -	-Drequire_userns=false
> +	-Drequire_userns=false \
> +	-Dtests=false
>   
>   ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
>   BUBBLEWRAP_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
