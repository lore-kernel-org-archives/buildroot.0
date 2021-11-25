Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AEDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 807C98247F;
	Thu, 25 Nov 2021 19:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kDIPjjxGP-l; Thu, 25 Nov 2021 19:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B396281B70;
	Thu, 25 Nov 2021 19:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CED91BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7874D400A4
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sd8UJhOpmU3x for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:49:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A2204019F
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:49:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l25so29526584eda.11
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 11:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6104Js0bWW8evq4ZiEClK7Hsxu5kdze4nFZt7j26Hkw=;
 b=di8Ovj8bQwDRTYVSq2rD3TRcQvUOmfMJj7UHr/J5q49Dn559AfAXufLYGZ3A7xCAeu
 LAFSLa5/uZQSNoHCXwN7M7XJ1qM8BcAww9FUPoUhkLmGUYTStkdY/HcY90HMbu0+IPE/
 1KA0VbTpHDvMR1JVJz2Vhg2ridjWSMbY4PahgVcOQiFzduRfZECrJ7MnchbrOQ0YNKnE
 /Xbna495afGI1lg8rj/KgHSHnT4ZMv3t0yy1Fg1fVIxh5ocd3mp5fEX0Tci3Ab1HKnrQ
 mDrK4BR/MWWJxhQc9Y3OxQ2xEmwc5cLhjLBMCkkR4JgHl6C2y6bUJ0oLuRbdwIaUDBWy
 9TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6104Js0bWW8evq4ZiEClK7Hsxu5kdze4nFZt7j26Hkw=;
 b=osUCT3QJCE79NCXYAYo2Mm+X8CYhh2+meHuQxpzaUdE4j4+7gVMiadgNX7YaimZqSn
 WuIz2VTvIZbEhwyM61WGpW2BLltRBOZiFGH+3IwuzRW8wENzLQJKBgLA5CLkZKkhz+Tf
 deY8hNr3OlO2aMEXHROiUhv4Tx2prgB0AN5qoG9Ybme7Uc+5GdVnysjE5O6kl4fl3xBz
 m1jAV0LyZrU4npGxbEG56usbqWA51jzDqgHS9sktLOPTspnyX/tw8mWDgSSZqf1TcyO6
 s/Kmwai+b6ztUoxlb9NlQLhGpSMgkAJhtIIGtdmhAX0h56ckXi2D7OoHoJRO0WDpXxFB
 jVZw==
X-Gm-Message-State: AOAM532+J70mI6RPNfET6aJN3ys8JgBRM6wfd5OSDBR05+qtu3UBEYuB
 StbvrOWOOyo69VpWyXWZr20TJQ==
X-Google-Smtp-Source: ABdhPJzeE9BoCVE0fF5uVRIA77WA4hrOCjFw0JY/jkX3tv+9mMh3qYcOla3fHSno6qmlQlrdagfN1Q==
X-Received: by 2002:a17:907:a40c:: with SMTP id
 sg12mr33937649ejc.408.1637869774146; 
 Thu, 25 Nov 2021 11:49:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id mp9sm2211970ejc.106.2021.11.25.11.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 11:49:33 -0800 (PST)
Message-ID: <75ac0a06-6cbc-20cb-fcb3-b2c5807562e3@mind.be>
Date: Thu, 25 Nov 2021 20:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211122224407.3646031-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211122224407.3646031-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: fix CVE-2021-43618
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



On 22/11/2021 23:44, Fabrice Fontaine wrote:
> GNU Multiple Precision Arithmetic Library (GMP) through 6.2.1 has an
> mpz/inp_raw.c integer overflow and resultant buffer overflow via crafted
> input, leading to a segmentation fault on 32-bit platforms.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...z-inp_raw.c-Avoid-bit-size-overflows.patch | 27 +++++++++++++++++++
>   package/gmp/gmp.mk                            |  3 +++
>   2 files changed, 30 insertions(+)
>   create mode 100644 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
> 
> diff --git a/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
> new file mode 100644
> index 0000000000..0003f342c3
> --- /dev/null
> +++ b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
> @@ -0,0 +1,27 @@
> +# HG changeset patch
> +# User Marco Bodrato <bodrato@mail.dm.unipi.it>
> +# Date 1634836009 -7200
> +# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
> +# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
> +mpz/inp_raw.c: Avoid bit size overflows
> +
> +[Retrieved from: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
> +--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
> ++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
> +@@ -88,8 +88,11 @@
> +
> +   abs_csize = ABS (csize);
> +
> ++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
> ++    return 0; /* Bit size overflows */
> ++
> +   /* round up to a multiple of limbs */
> +-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
> ++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
> +
> +   if (abs_xsize != 0)
> +     {
> +
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index 5e16ef1916..9b402767fd 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -14,6 +14,9 @@ GMP_CPE_ID_VENDOR = gmplib
>   GMP_DEPENDENCIES = host-m4
>   HOST_GMP_DEPENDENCIES = host-m4
>   
> +# 0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
> +GMP_IGNORE_CVES += CVE-2021-43618
> +
>   # GMP doesn't support assembly for coldfire or mips r6 ISA yet
>   # Disable for ARM v7m since it has different asm constraints
>   ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
