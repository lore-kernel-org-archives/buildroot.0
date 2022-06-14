Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E57CCA47B
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AF860EC6;
	Tue, 14 Jun 2022 18:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEYqZjAp_r0Y; Tue, 14 Jun 2022 18:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2AC60E70;
	Tue, 14 Jun 2022 18:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD96C1BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAC3A60E70
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrTbPihA9A5K for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:45:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF67B60A78
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:45:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h23so18863447ejj.12
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZiQ6bGzit4jsCmUfh/HW0gUJ0aXkDoGAU0WVl45HIwk=;
 b=JmeGlIi4IePy5qMD0kF44zIW1IjbEM+zvr+jTj2f/gE5mfRxzpkf6XDkAq3ufLTBpB
 13h48A+FdGAMd4Z+d5dsHCmHqg8BXtfjDblQfdEaa1YoKHB96m4W9wri122y5a+dKlNy
 9PLlidewndNo9lo6oCHNDqMcT9WswDdFlbIkTp1V9YTGOGMB9GcMqAQiGuwZ/mPX37P7
 efZjhz5W9s7XwvhIdLIWcdkwvKynZJPEnLVIwV4tzOJUMAy/af6rm9YopxxSTN3fCqXE
 6Gf856yDIGYseNG+XghEaymGAP0G3BshU+jDupCr4O5g7RyiR1o3mI5xBsw8p8hf84rY
 YKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZiQ6bGzit4jsCmUfh/HW0gUJ0aXkDoGAU0WVl45HIwk=;
 b=XnvPlCxhBsTPyugEjmGmEnLWH0O0womW7qoIGJg79z2Rf6PhbtbIIERuln8c5HdfOB
 zIYUPdFaBy5qzaBLuXzgPzxh7fUGiAlGM0xdudfcVfuqkiYsWMABjALWwd7wdh40c6IY
 Ie8n/f60OLkd/ej2GYM4V+i1uBNHF0vWbWwyJypTVg04yNLt0oBTKlUU30RwNB4xcMQv
 aI1XXT4AGUCjwS7HOD/ZBRuhKL4TEE9wD1bQMmQeIPL9c6CpvuM/hUXYeeMKPkboIfBI
 ELf9mKjPmHQESHjHqamEn9QeUKCThUI7MiPdkhsFS8Xi2pkBndOTYrCr1PSRPG62LHYO
 j3pA==
X-Gm-Message-State: AOAM5323gVInEdTfZ7k/6pAUl4SZ32dhQMZXtWqqrC4OZGBArW1/Tixq
 xW99DobyPFnccz6rtT2naloIfg==
X-Google-Smtp-Source: AGRyM1vaBHvwbe4ZY6m4hqM9alfgA9380OFcXvVR54FlLxwbXP2ON9eoJsEyfc3UOCecx7pkha/S8Q==
X-Received: by 2002:a17:907:2d24:b0:711:d584:f118 with SMTP id
 gs36-20020a1709072d2400b00711d584f118mr5685565ejc.238.1655232333123; 
 Tue, 14 Jun 2022 11:45:33 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 q4-20020a50aa84000000b0042617ba638esm7601384edc.24.2022.06.14.11.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:45:32 -0700 (PDT)
Message-ID: <946385ba-a194-313d-120a-0f80cc515677@mind.be>
Date: Tue, 14 Jun 2022 20:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220611125752.355351-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611125752.355351-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.8
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



On 11/06/2022 14:57, Fabrice Fontaine wrote:
> https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.8
> https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pcsc-lite/pcsc-lite.hash | 2 +-
>   package/pcsc-lite/pcsc-lite.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
> index 10a8d92fa7..340a9edbea 100644
> --- a/package/pcsc-lite/pcsc-lite.hash
> +++ b/package/pcsc-lite/pcsc-lite.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  fdb3fe8f68049019523801909b2a336d0d4ee315edafe363c30d375e3706537a  pcsc-lite-1.9.6.tar.bz2
> +sha256  502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50efe3420d1b2289  pcsc-lite-1.9.8.tar.bz2
>   sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
> diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
> index 5bf9ce7f30..ad34bb4b90 100644
> --- a/package/pcsc-lite/pcsc-lite.mk
> +++ b/package/pcsc-lite/pcsc-lite.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PCSC_LITE_VERSION = 1.9.6
> +PCSC_LITE_VERSION = 1.9.8
>   PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
>   PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
>   PCSC_LITE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
