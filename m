Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679E6C43217
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 130A161CE6;
	Sun, 12 Dec 2021 14:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mULZ5uYbR_lY; Sun, 12 Dec 2021 14:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7027661CD9;
	Sun, 12 Dec 2021 14:51:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1981BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3269A42432
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tx0D74L7XtOn for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D86342042
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:51:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e3so45123901edu.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JVHyXLk3SAbrwJrbW7rAOcsbLFUf+/LZpjhoVxaZkZ4=;
 b=AByUpTn85jRrKuNyBqvQz+j3Vx48uQ86khxGTYi8egoa+24nfQwwv9KH9Js8SL0PC3
 uX7iNAnUiU/pt3BlJnYZX46rxkEJnaunb5OzOpHY7De3PP+PVmV9DV/TSVNZoPARQV6m
 qVoqJCOMxmNkojc/F1VD2D+uMlpibzFn2Qp0uAcZHylCKhOWboWkKlYvL+gproUPDzeZ
 Z6rN15WDnwjBipwzjUCV2Ca7F4GkKRfTCbEo7LD2SQTfObeppC6ePZ8oAVkrn94grzKc
 TbZdV5s7HPdb99bk8IUnjUsopuzdDqhlioo+xKGq4TRJZ+Ru52cEVGXNyKobKkSGi8uR
 vvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JVHyXLk3SAbrwJrbW7rAOcsbLFUf+/LZpjhoVxaZkZ4=;
 b=OP4lLASpuZTNVrFvc0YHxOKC5vHYt7uDoMLR3CHOuXkHh1oWYZlf3bdiEhgQAQuTOZ
 BqLK7G8xM0C4mAZhk7xVaOOOHMi6Zk2kNyhpbi6ZMY3MWlcb+r84GitGJeoM9zjS2XMe
 Wjvbk14i0B1DNOYf7cRBYQmZ66GpOF3+CN117CJJUtehsTHNYb4MmTryM2D9IU8mhBAu
 gHIWsJCXTmt9kyC72jsZD6xgV04CO4XrwPBX0TGT/q10wWFpnt6jvKjl9C4F7EgOtPtP
 ueNM+MYcXx9pkfxNe2Ji3tH2UYNx5uTREkocbAaEbSep1/txOtmIqllBVw/enl2VfAux
 b2ZQ==
X-Gm-Message-State: AOAM532Y07uB8EGjXBbRCSZDcXRrtT6MlsxY6zjdy6B7rgR62HI1NH5/
 bmKdNNI29ih9LIEERoPf8XiEVA==
X-Google-Smtp-Source: ABdhPJxVDhDsitNV8A/dgEPXLMDw7NtgqABPiviuHPHOorIiD3KFJmQEO/VVVJjy56AkBv+tB78WwQ==
X-Received: by 2002:aa7:cdd9:: with SMTP id h25mr55497712edw.130.1639320677505; 
 Sun, 12 Dec 2021 06:51:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j4sm4778477edk.64.2021.12.12.06.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:51:17 -0800 (PST)
Message-ID: <e8eb73f8-79d5-910d-009a-ac2da1c6de8e@mind.be>
Date: Sun, 12 Dec 2021 15:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211180803.18456-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211180803.18456-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.5
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



On 11/12/2021 19:08, Fabrice Fontaine wrote:
> https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.5
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
> index b4f9e09b32..4844606c59 100644
> --- a/package/pcsc-lite/pcsc-lite.hash
> +++ b/package/pcsc-lite/pcsc-lite.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  8a8caac227e0a266015298dda663e81576a0d11d698685101e6aa6c9fdb51c4b  pcsc-lite-1.9.4.tar.bz2
> +sha256  9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08  pcsc-lite-1.9.5.tar.bz2
>   sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
> diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
> index 2536a49e5d..a7db105987 100644
> --- a/package/pcsc-lite/pcsc-lite.mk
> +++ b/package/pcsc-lite/pcsc-lite.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PCSC_LITE_VERSION = 1.9.4
> +PCSC_LITE_VERSION = 1.9.5
>   PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
>   PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
>   PCSC_LITE_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
