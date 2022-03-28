Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7EAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE73F415AA;
	Mon, 28 Mar 2022 19:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxre8992oKWV; Mon, 28 Mar 2022 19:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D42410BB;
	Mon, 28 Mar 2022 19:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6801BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CD8260C02
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jl8q7hz1kcly for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 913FB60899
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:55:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id pv16so30951432ejb.0
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Vg6uG/Kc8uQ64zh1BjTgereIMxZOchPg+Z2kgiqc9h8=;
 b=FNM5+7k3w2DEmpAAHi/QLr/+oTa7bQKisR925w0mhPXYxK7sWM60/vi01ESppz1ZQL
 R9b5Q4Q9WYNlezZyoBDt4Y1KUVK6EdUTGjSzRm6AZ5DBb+pCOusi+1eqzMsTO336BrGB
 3fsNhxs7WJZYTjnuYP5mdKAW99Lzy3y6W8/OiY+9E9/iVhSpeD4Pq13tLVlCYGJ4fJXg
 0NiZ4ju/0FCqSB5bCugCOQG95ARk4zxB8DQ9Bk45Y1jNm0mkZeMVuQ9+BXOT2O+x6eQQ
 yZeeHKpyXlSZf+0yDtJrcMLw3wXOwSeq5yK5gznNbBi99sn50EdGVjM/OmIjSQTVe+Oo
 89Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Vg6uG/Kc8uQ64zh1BjTgereIMxZOchPg+Z2kgiqc9h8=;
 b=fYDkjSc0bKM1t+CaJGVaCKu6Pe4qFJI/xZRXMd1aJpo1RUhoI55vCyuRdWXK6XmOjE
 Si9BUfyGuJZbjwA90kJy76CI9SZKFMVICJyofeDs05Mdm8Aq4soLCj9ptZiIeNE4r0nJ
 5a7bcKRnAh3DAXqjtYx/lVNNXp7tWbZgbFAwKnKGj1vwxpXaF46nC8PxmPimONoTUQzU
 IIonGpKVL4tuZ8lafgVdHHTzjJSNsbGL6VroQZ6286D32T3wHa9XMkoc5b4SuecQUYzS
 7oF+1F0k4crfSbRe8/EJu9JJHHXFNHk1JNd+10gL70i5Rc6zjID5DzrghzaseCq25Ro8
 F5mQ==
X-Gm-Message-State: AOAM532scK/WdGVdZbLPkmQmet/Jnqi7V08qP79D7Hbn0pIbL788lJ2o
 NTPeYfdV8guS9ATaESbvn4BiIQ==
X-Google-Smtp-Source: ABdhPJxkpP9U9OmIXWzLCXTZex/zRS/QGfW3/jMkLU9/dh/lZdJ8WPA+6MDabsSlgTlg/Gjpl1IPBg==
X-Received: by 2002:a17:907:6d23:b0:6d9:ac9d:222 with SMTP id
 sa35-20020a1709076d2300b006d9ac9d0222mr30299674ejc.595.1648497340811; 
 Mon, 28 Mar 2022 12:55:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l4-20020aa7c304000000b004192b7825a2sm7094730edq.12.2022.03.28.12.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:55:40 -0700 (PDT)
Message-ID: <d9ea6ca6-eb82-e5f9-f447-658bab42a915@mind.be>
Date: Mon, 28 Mar 2022 21:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220327203218.1331528-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327203218.1331528-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/matio: security bump to version
 1.5.22
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 22:32, Fabrice Fontaine wrote:
> - Fixed heap-based buffer overflows when reading (crafted) MAT file
>    (CVE-2020-36428, CVE-2021-36977)
> - Update hash pf COPYING (year updated and contributors added:
>    https://github.com/tbeu/matio/commit/a3730c09797372a5919140b4618f217bb54bd1a1)
> 
> https://github.com/tbeu/matio/releases/tag/v1.5.22
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/matio/matio.hash | 6 +++---
>   package/matio/matio.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/matio/matio.hash b/package/matio/matio.hash
> index 4dd05dee07..4634074ca0 100644
> --- a/package/matio/matio.hash
> +++ b/package/matio/matio.hash
> @@ -1,4 +1,4 @@
> -# From https://sourceforge.net/projects/matio/files/matio/1.5.21/
> -sha512  b00bcad807e6a7e10afa656eb77a0e3e9fb08d9cecc3e94ba41ef91ce60367d6686e6d387a874bbb83eb2f895d4a97caac554a70e7f5f6f5cb750052702d411c  matio-1.5.21.tar.gz
> +# From https://sourceforge.net/projects/matio/files/matio/1.5.22/
> +sha512  33fd3991413e94dfc9aba13ffd08b09ddcbdb9dfa579124d981449e195a8c61a3dc95b55e46bba360d48456c117cf36403af1c3448689c26b8aea5fa9cf38323  matio-1.5.22.tar.gz
>   # Locally computed
> -sha256  69143d4a8f1933022bb909327df1ce812dd2420ed57949812dd8f370856bf2a1  COPYING
> +sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
> diff --git a/package/matio/matio.mk b/package/matio/matio.mk
> index 236466d4d9..d282852d37 100644
> --- a/package/matio/matio.mk
> +++ b/package/matio/matio.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MATIO_VERSION = 1.5.21
> +MATIO_VERSION = 1.5.22
>   MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
>   MATIO_LICENSE = BSD-2-Clause
>   MATIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
