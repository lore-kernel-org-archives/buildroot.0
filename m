Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE51C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D689960AA0;
	Fri, 13 May 2022 21:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UqGQl5Sblrv; Fri, 13 May 2022 21:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D211760A6C;
	Fri, 13 May 2022 21:57:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB1E81BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8EBF401C9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbgSkvRzNO4u for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:57:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA3C94015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:57:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so18595166ejb.8
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=mt1iaLz22I593IUpTlpD5qu07UWjfaJEAKs/vWNDpB4=;
 b=ISMacubT56A9YBZdggkz+Q6Bgz02xXRlc5uIv5rzdpsI5sqZcXNcATLVuDMPmJfy0/
 t5dmzNrNG0fgdKhk+cfBHiXY4hjNUucWG0IRCiWaH3gsfci1w/8qAohGqInznYZxRKe8
 YlwOd+58oBTPZQZsEVmyn4YqTq+lUdD8g28TL0I0X8sRxGPIj0Du7g+sGRLbmd59ygNu
 N7ge2Lopx36NtaMCgJwm7nq9QvXo92CQ725j2EKhK8IqfvdQsv+aowNYsDvdwXFGsoua
 gxo/It8QHom9TeBR8w0VpQN1A+uKKBM1ycwBtFQe/UJmToKo2fcrC2LX3f8ROiS9QU4q
 skeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mt1iaLz22I593IUpTlpD5qu07UWjfaJEAKs/vWNDpB4=;
 b=2oraqP8p9XrYMoBfeygyUDBjKTki+laMyCDbYMzk/EUjny0xxrQ1Gt4vAVimMegeVr
 Hm+1SZ9dVlLhb0PFw0a5KSrdKWRBj8NdRPWrMZde4g4U5QjC0uhXBILhzoyQRuhKeCqs
 9V1QDa2xTPZmKGpeQ/8Tth6SGybKHGDK/9CHH0sU2JfZIT+6nGR9Z5/XuoHFBUuebzwO
 a+5YkOTA2GkzuS1FNJiyNmPzIwXEFmsgZ1aNCCWYWw5h0EyUXCsSwS34HvLWhyGAuSnb
 Tkja9UxtkzRxoqpSTq8EhsRwshesbW47EtVqUMVAkXJNUEqNm4Tyrvmaadm/1TwGR5bb
 3bBQ==
X-Gm-Message-State: AOAM532Pp7gHw8n3N5qy0NTODCLaXCn+qS8OvFUayZH0TLCVDMD2OXxK
 L0Ky4Ol37E9zmJ4XUBAm2d6ursV9RHbRrA==
X-Google-Smtp-Source: ABdhPJxiYyiIJ3aI7oEIbp0CbYulTWPqhHl1HIwsviLnSFxQbKUhqd2hx7Duhr1WEkOon5vgPmf1lA==
X-Received: by 2002:a17:906:6a18:b0:6f4:c4b2:d2b with SMTP id
 qw24-20020a1709066a1800b006f4c4b20d2bmr6110370ejc.378.1652479038159; 
 Fri, 13 May 2022 14:57:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hz13-20020a1709072ced00b006f3ef214de9sm1160413ejc.79.2022.05.13.14.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:57:17 -0700 (PDT)
Message-ID: <4c98d451-d6e5-65e6-f6e6-527d91111f7b@mind.be>
Date: Fri, 13 May 2022 23:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220509113649.37846-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509113649.37846-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/dmalloc: Add patch to fix powerpc
 build
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



On 09/05/2022 13:36, Joel Stanley wrote:
> Fixes the following build failure on powerpc64le:
> 
>   http://autobuild.buildroot.net/results/1f84facd106abdd59be87b9f6e1eb24bcef0a846
> 
>   Assembler messages:
>   Error: missing operand
> 
> The code will fail to build on any powerpc platform with optimisation
> disabled as package contains incorrect syntax behind !defined(__OPTIMIZE__).
> 
> The patch has been submitted to the project:
> 
>   https://github.com/j256/dmalloc/pull/113

  I've added this to the patch itself, that's where you should put this.

  Applied to master, thanks.

  Regards,
  Arnout


> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   .../0002-return-Fix-PowerPC-assembly.patch    | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
> 
> diff --git a/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
> new file mode 100644
> index 000000000000..8df66a74ce21
> --- /dev/null
> +++ b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
> @@ -0,0 +1,53 @@
> +From 6d87fc890c3de81ee33baf25d7c3c86532f26060 Mon Sep 17 00:00:00 2001
> +From: Joel Stanley <joel@jms.id.au>
> +Date: Mon, 9 May 2022 20:27:58 +0930
> +Subject: [PATCH] return: Fix PowerPC assembly
> +
> +The original assembly used suspicious syntax. However, due to the
> +!defined(__OPTIMIZE__) guard this code was rarely built.
> +
> +There nothing to stop the compiler using r0 between the two asm blocks,
> +which may have been the cause of the note mentioning it failed when
> +build with optimisation enabled.
> +
> +Write a single asm statement that places the result in the given
> +location.
> +
> +This builds for powerpc64le and passes tests.
> +
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + return.h | 13 +++----------
> + 1 file changed, 3 insertions(+), 10 deletions(-)
> +
> +diff --git a/return.h b/return.h
> +index 55b9369fe12d..fafbe3754f0f 100644
> +--- a/return.h
> ++++ b/return.h
> +@@ -260,20 +260,13 @@ asm void ASM_GET_RET_ADDR(file)
> + /*************************************/
> +
> + /*
> +- * For Powerpc 603 based system running LynxOS 2.3.1 using gcc/gas.
> +- */
> +-#if defined(__powerpc__) && defined(__GNUC__) && !defined(__OPTIMIZE__)
> +-
> +-/*
> +- * This won't compile if "-O2" is used, but it seems to work fine with
> +- * "-O0".  I'm no assembler expert; I was happy enough to come up with
> +- * something that works at all...  :-)
> ++ * For PowerPC using gcc/gas.
> +  */
> ++#if defined(__powerpc__) && defined(__GNUC__)
> +
> + #define GET_RET_ADDR(file) \
> + do { \
> +-  asm("mflr 0"); \
> +-  asm("stw 0,%0" : "=g" (file)); \
> ++  asm("mflr %0" : "=r" (file)); \
> + } while(0)
> +
> + #endif /* __powerpc__ && __GNUC__ && !__OPTIMIZE__ */
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
