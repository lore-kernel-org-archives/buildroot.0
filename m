Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD28C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8170740B5A;
	Tue,  3 May 2022 20:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUgwVFSPZh65; Tue,  3 May 2022 20:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69D1140B4F;
	Tue,  3 May 2022 20:28:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F79D1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E2CF81493
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVgkTUUUQEHi for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:28:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22C8C83E2D
 for <buildroot@busybox.net>; Tue,  3 May 2022 20:28:18 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id i19so35498718eja.11
 for <buildroot@busybox.net>; Tue, 03 May 2022 13:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KaiWndRS2wUaCxXlbXpsIk+AtmCNUltk82d77yvH7zI=;
 b=BqYz0h2wSHaUbqPupr7rmzt4hK1IG7KaIpv9lvbO9zc1h702Xv5mIzv9H3FOSMZoBJ
 XxmP0AYqKck/FPh77S4aGAHg5tTjNFQNqFIFxPZcI6AvwJIT3Zpg3SOwVCkuHmfq8xyR
 mEp3B77JbeLF+N2w7MyqTnoNdM0vh3hWvNUI/Z5uk+QGAhzHK6XIV6Drb+GtqlFPVk5v
 dLSgapWZFG8fs9dq1vcBJd6dt9Q6pMfQxIsVNOVnG1avTt34WMPbThPUGou5CwbLBTsT
 98VA/HxnIdXfIt2PTdEzNzxUv8qW9K5ucvt4IWLWeo8t5Fc2oReCkN8UAZr1NomdYAV4
 BHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KaiWndRS2wUaCxXlbXpsIk+AtmCNUltk82d77yvH7zI=;
 b=aVCy3rEP3roaw6LCC9FgBtBDCn5p8dRrJ+G0p/YyySq3vvm4oNpEwTvwxiVu28wAvd
 U0zaSSdkKx/lIIvHF1oYu2aRTJ2Uy1CtjGQeeZOnq7YmFOAsOiLXf69m6KGdi+3imMA3
 Q2sPH8Wo+/RvajmtXRuOcnBDDdadI/GCt6DacEhT03E0PcrYIRyRNKC0+9QOC5TWZMrk
 6VnBb/5ddluOWr58k2q1Vk0dax0UuYDvhDGSpsExLR45wt+s6kdQGGF35YHzO0TzFrmi
 ppgzJd2/hYVFElbi88jXCrtyYQ+KYGPlPNsYRjJnITHoTNF6APiJbH7pzosdQ7Bv82y7
 Qtug==
X-Gm-Message-State: AOAM533JQgRLLCasHn0Kz81ha1Bj/2cJX7QvWJiyP7s1ry3wHhH2Hx0E
 sj3urzbNWUaFEHmcyXncWgR15uw07vflSw==
X-Google-Smtp-Source: ABdhPJxORypCPBvTv4BdQFKFeUtVsHrmyV3ZN/jYTy00Gsysqyg34k/JhWLfSk1uaoxWosb6Qy7z1Q==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr17032903ejo.469.1651609697165; 
 Tue, 03 May 2022 13:28:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hy25-20020a1709068a7900b006f3ef214db5sm4925671ejc.27.2022.05.03.13.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:28:16 -0700 (PDT)
Message-ID: <c137a177-983d-f1f9-60b5-8795572db839@mind.be>
Date: Tue, 3 May 2022 22:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220503051536.103523-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503051536.103523-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/freetype: bump to version 2.12.1
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



On 03/05/2022 07:15, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/freetype/freetype.hash | 6 +++---
>   package/freetype/freetype.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
> index 78d0ba20d..a558a3e84 100644
> --- a/package/freetype/freetype.hash
> +++ b/package/freetype/freetype.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.0/
> -sha1  fd1eb1a27f178808e1d8ccd82c71abfa5d0ebe13  freetype-2.12.0.tar.xz
> -sha256  ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033  freetype-2.12.0.tar.xz
> +# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/
> +sha1  5133eed28a7624ffabbf6d00aa3f68b841d62d80  freetype-2.12.1.tar.xz
> +sha256  4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f  freetype-2.12.1.tar.xz
>   
>   # Locally calculated
>   sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index 5c6b8c73b..36ef3cb52 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FREETYPE_VERSION = 2.12.0
> +FREETYPE_VERSION = 2.12.1
>   FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
>   FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
>   FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
