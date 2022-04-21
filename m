Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98711C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C7D84322;
	Thu, 21 Apr 2022 19:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6bTWn-Fw92L; Thu, 21 Apr 2022 19:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F69D84439;
	Thu, 21 Apr 2022 19:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0A21BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B594120D
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJu19mdTP2Wy for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 465C941290
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:19:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k22so8022878wrd.2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K4fvs4fVjybiBfOnyUluk1s0cM+DZp7QZ1SyBaowkNI=;
 b=TiFIsogGHyRRZ1ZvVagYTJNqN6kUQzgFWOxhYn5Qzjx2ZWS9RQRnRjSmZzbrhBhYp2
 hOJrwPIONj45zYX6Cc0X7RlJG+z+SzGy2IFxZKj7fP31ryC3rzUUK6HkP3TTrapsTApK
 GHAPWRx/NQFemyLmYEgTh9MupWS4IlXqiBLwjRZdUkVSDLzjv4RQ0mhudAb7KfMuwDle
 1caT//Fudkrvcp2/kQB3tZhOfeg6edx2DGeL/bgy/uXXDVr441ikApQH3hSsqg3ApLVD
 wU76l8QfykVKM38tvbgUEF3KX5Bz+05aFhNwLrod70ND28iBGhtRzE66UUKOHSlvFrDE
 SQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K4fvs4fVjybiBfOnyUluk1s0cM+DZp7QZ1SyBaowkNI=;
 b=68R+ewGo2Aswedw+geYAMTTl0S5gUu50FqveIrh4pyzsqExOLdEjHwVFjm0AOZ0SaW
 JMCUiy4O8BayDupxFn3rprXHep41fye60AihE1L/oj1z9Bm+AFI94c5Grc/L3hXzTid1
 aWGcrD7RhsbVg9nXlEiEt3JUr50XOy8RNbfOm6n6oToZaAt72Pr13EdPaZGS8YNEwxmu
 y48WJC0XCLftKbOyekxVqh4ry45EZZEbexs4QMCp/lcebnBFya+vNOuhjFG8cW//oBYa
 ZQdo0Hm6WvL8o7+p5gQ4vOI0qlmAO6ou6PCtjC2yvz3tx40r5v1rrD1n/DeQ6JPUT2+Y
 eQrQ==
X-Gm-Message-State: AOAM530+8gYkmNy0owXnk8plbhw6+9Kml82e5vniSYZG8fzwVA9QPyQe
 kP0M1QNcdbHavZY+Lm56HQ4qpw==
X-Google-Smtp-Source: ABdhPJz6+DdHmTVU49VnAw7AgPKWLUK2381tuMng7KKIC+gfzHTbxLnaSUDzfisd5QxTw/Z8OnY1Og==
X-Received: by 2002:a05:6000:156c:b0:20a:8397:6d28 with SMTP id
 12-20020a056000156c00b0020a83976d28mr839178wrz.363.1650568776481; 
 Thu, 21 Apr 2022 12:19:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bi7-20020a05600c3d8700b0038eb78569aasm2620529wmb.20.2022.04.21.12.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:19:35 -0700 (PDT)
Message-ID: <414ce8aa-6d93-d64a-e605-7ec0a3e7b350@mind.be>
Date: Thu, 21 Apr 2022 21:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220415164947.13025-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220415164947.13025-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/gnu-efi: fix build on mips64el
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



On 15/04/2022 18:49, Fabrice Fontaine wrote:
> Drop -Werror to fix the following build failure on mips64el raised since
> commit 11b347c03ab0b38389ec11b48f63236a3b4d6547:
> 
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c: In function 'FileDevicePath':
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efilink.h:145:46: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>    145 | #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))
>        |                                              ^
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efidevp.h:404:38: note: in expansion of macro 'EFI_FIELD_OFFSET'
>    404 | #define SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)
>        |                                      ^~~~~~~~~~~~~~~~
> /nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c:250:41: note: in expansion of macro 'SIZE_OF_FILEPATH_DEVICE_PATH'
>    250 |     FilePath = AllocateZeroPool (Size + SIZE_OF_FILEPATH_DEVICE_PATH + sizeof(EFI_DEVICE_PATH));
>        |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d19e57004c36f2904c5eea988e0c38fbdb557c7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0002-Make.defaults-drop-Werror.patch      | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/gnu-efi/0002-Make.defaults-drop-Werror.patch
> 
> diff --git a/package/gnu-efi/0002-Make.defaults-drop-Werror.patch b/package/gnu-efi/0002-Make.defaults-drop-Werror.patch
> new file mode 100644
> index 0000000000..79c847d178
> --- /dev/null
> +++ b/package/gnu-efi/0002-Make.defaults-drop-Werror.patch
> @@ -0,0 +1,48 @@
> +From 0e43bcb3876d4000790b0a6784453f333c1db701 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 15 Apr 2022 18:42:36 +0200
> +Subject: [PATCH] Make.defaults: drop -Werror
> +
> +Drop -Werror to avoid the following build failure on mips64el:
> +
> +/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c: In function 'FileDevicePath':
> +/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efilink.h:145:46: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> +  145 | #define EFI_FIELD_OFFSET(TYPE,Field) ((UINTN)(intptr_t)(&(((TYPE *) 0)->Field)))

  Ignoring this warning seems like a dangerous fix. I guess UINTN is 32 bits but 
intptr_t would be 64 bits on mips64, so the cast is possibly narrowing.

  My first reaction was: upstream seems pretty dead, let's just disable it on 
mips64. However, there seems to be a lot of active forks, and you just added 
mips64 a couple of months ago...

  So, I think it would be better to look for a better fix. Maybe one of the 
myriad forks has it.

  Regards,
  Arnout

> +      |                                              ^
> +/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/../inc/efidevp.h:404:38: note: in expansion of macro 'EFI_FIELD_OFFSET'
> +  404 | #define SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)
> +      |                                      ^~~~~~~~~~~~~~~~
> +/nvmedata/autobuild/instance-9/output-1/build/gnu-efi-3.0.10//lib/dpath.c:250:41: note: in expansion of macro 'SIZE_OF_FILEPATH_DEVICE_PATH'
> +  250 |     FilePath = AllocateZeroPool (Size + SIZE_OF_FILEPATH_DEVICE_PATH + sizeof(EFI_DEVICE_PATH));
> +      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d19e57004c36f2904c5eea988e0c38fbdb557c7e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + Make.defaults | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Make.defaults b/Make.defaults
> +index 47ed361..d43c3ff 100755
> +--- a/Make.defaults
> ++++ b/Make.defaults
> +@@ -168,11 +168,11 @@ ifneq (mingw32,$(findstring mingw32, $(GCCMACHINE)))
> + endif
> +
> + ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
> +-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
> ++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
> +            -fshort-wchar -fno-strict-aliasing \
> +            -ffreestanding -fno-stack-protector
> + else
> +-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
> ++CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
> +            -fshort-wchar -fno-strict-aliasing \
> + 	   -ffreestanding -fno-stack-protector -fno-stack-check \
> +            -fno-stack-check \
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
