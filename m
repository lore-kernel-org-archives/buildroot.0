Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43755C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB37040258;
	Sun, 13 Feb 2022 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKi5J2Dv1b3Q; Sun, 13 Feb 2022 15:33:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE4B4024A;
	Sun, 13 Feb 2022 15:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9CF71BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E8B402FD
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_syXs3VD8aZ for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F01EE4035A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:32:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hw13so4157958ejc.9
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/kHKHOxFVH+/tTCBhWxRr2FKq47w5M7+cnHaw7m6tEM=;
 b=YP17pYSx7m9nhVi9o6l7XRTAFmKwq/TG1H7oBOjBFeoQhixLXWrf9WyXHOmEpjR9/M
 yP5bSGNm2/V9JTmQR1m2Jv51bQD5RcwdamTTZ80cJ5kTZhmCyPtVGzzhS/p20iJSjM5y
 Jit+XLzw8yXdf+9zK8UfG9DRc+D/0BQl+OiQwhqt/INUSOxYlAWjL2tAUyLVYqj7NdJ6
 TFUhWmCkotbvy/TmBUHN2wOuP6O5Co1NtIN37MyjVJkkDROq4oYXj/HjnexATcWNhHEi
 pqON19kwKsrzEOS64qbSgUaxXgld/Kyirml9Rz+Bm02seqaAcCQWPNG2SMEne28c3LP7
 uCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/kHKHOxFVH+/tTCBhWxRr2FKq47w5M7+cnHaw7m6tEM=;
 b=uzZBDqljgx8r/NDWk/20jaAylKwrlbFhI7yvgA2/xbxVa4uuc5MRVDDspvFeYbm+HU
 nklnlrAWXF7DUzkSuIjMrv8Gp1r2RD8jMK23k8HxklKZqy9xS5FVMKUA5p9rZsLSSuWb
 3eDdgQU67MLq4m7sJj61mEjzgN7e6IjxtxtoaThaeM2FBlS5mIWdwl7IJelAF3C42tjv
 tD630KCOG3GqX/uDdUYx4ri7Vo1FU4/+eVNDUCagufrooTQeNNXggR/fI9/xM2cc2VaH
 fMX/WKHIHF6cUBLgL+OnpBG4OoAiOqqLM/yygvPHxOgBwOnHBsWlmYhyS/mLqcyA3M+D
 cjNQ==
X-Gm-Message-State: AOAM531L51s9u80db4QjAZWlZSS/NCvF0sNvJ3RmWweMo/HgC7gp8Lcl
 LwK4ss2iJA56a4jZizVqySYSDLwD7VjEbg==
X-Google-Smtp-Source: ABdhPJxT7/bPfiTXSMDVgcWl50ilQZngVTH4JHBC8rE7zNt34aPQZxNvieUevlTVoYg7XkD6hy0KpA==
X-Received: by 2002:a17:906:77d7:: with SMTP id
 m23mr8176844ejn.384.1644766338226; 
 Sun, 13 Feb 2022 07:32:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c10sm9525676edr.6.2022.02.13.07.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:32:17 -0800 (PST)
Message-ID: <a6b88abf-16bf-3d23-62a9-58ffa41a89d7@mind.be>
Date: Sun, 13 Feb 2022 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206225902.3349344-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206225902.3349344-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.3.2
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



On 06/02/2022 23:59, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

> ---
> This patch superseeds this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220131175341.4091688-1-giulio.benetti@benettiengineering.com/

  If you mark it as superseded yourself, there's no real need to say it here. 
But you should probably have given it a v2.

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 1615933a6e..61f2865563 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd  harfbuzz-3.2.0.tar.xz
> +sha256  1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503  harfbuzz-3.3.2.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 67eab359c6..1f5dfa8822 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 3.2.0
> +HARFBUZZ_VERSION = 3.3.2
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
