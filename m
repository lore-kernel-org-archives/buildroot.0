Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B3460D66;
	Sun, 10 Apr 2022 14:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KM-9CWPmqB5; Sun, 10 Apr 2022 14:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6B060D55;
	Sun, 10 Apr 2022 14:51:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9CD71BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F2F40119
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ee3QzAdciqW1 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:51:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCE22400F1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:51:26 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p15so26064628ejc.7
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qTiOyd80rHKr7vxYGpZ0/9WYCJaMd+kkLBjukgAWHk4=;
 b=EqjaHcasoUlxibageMNnWKlB77Zmt2RIfT+tCQAARQTUix5YOpJJLS1HYGQdT/LV+o
 f+cJSF7MI2M0aosYncZlGJ5j4cFvDnXu843lQLx/8LP5AMo3rxfhnu3hfrDiREE/bTzV
 8RgDDK4HHPHoPbhGXBldaNT17W5eZE4IKmwvT4I1iCbyKvSezCHYXMzYKD+QRvuTWZm2
 HTZm3cgn4gOuekL3/xfYWUz+EEnxWWC4HA4P52lK4PGe8wmSN9lhe1HGHEQM0IGlbDsi
 rTyFj2np4nzzTILeq53Zd+3WBU5RagMKLpgO4232D66IOsXFSknFAsVctetYbxyYnyf3
 Ppjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qTiOyd80rHKr7vxYGpZ0/9WYCJaMd+kkLBjukgAWHk4=;
 b=boL9RNzhEbvzPLEA2zvGbE5bFWiVCxieaptTasX0HGdQzV6W+5sKJtx2EHX1dcIl3S
 0vdIpkB1bmdRtvqkbHaiM/NHTPIeAKRWr+KF8rDgGvTOd7Dkuq+0650ki7FLspW0ONjf
 bWp73hqxPKfI7z0zWNoA4bCf//+SknmlVqdDYbqpCQMo/sTI3/pTutoTEDfC/x+Wt3TL
 h2cwBtN2HChrvwyKj2GatKYTzCi3wg7MsAG1kCb8TAH2i/NeCxLc4aoPdc5y9IH5hepi
 wF16lnh6Li9DmgPsIz4eIv69lEi4wy7Dzo3snC1IhY/oNL/Opv4WsruVYDhh3EreLew5
 vJ3g==
X-Gm-Message-State: AOAM5309YUYLvnEGTrMG5MLjdRbW2zSIop4JTGSjhEysDKoJtpWNdhh9
 6t/1zHsi0kjxQe84iaxwBl12qw==
X-Google-Smtp-Source: ABdhPJzZVxjSlyURRV6raEyJiB2PS1/dDDnOYrrgoo/NHu2g8+Rf9lFZDvbdYCeUofA3/2kmz1vDsg==
X-Received: by 2002:a17:907:a42a:b0:6e7:c4b2:50b5 with SMTP id
 sg42-20020a170907a42a00b006e7c4b250b5mr27134428ejc.138.1649602284928; 
 Sun, 10 Apr 2022 07:51:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7dc42000000b00418ef55eabcsm13464525edu.83.2022.04.10.07.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:51:24 -0700 (PDT)
Message-ID: <4b756b29-78ac-a731-4b3b-fc78875d8314@mind.be>
Date: Sun, 10 Apr 2022 16:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220405002202.1772332-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405002202.1772332-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.77
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 02:22, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index b4b8be11f6..04e81e6b84 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_76_RTM/src/SHA256SUMS
> -sha256  1b8e0310add364d2ade40620cde0f1c37f4f00a6999b2d3e7ea8dacda4aa1630  nss-3.76.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_77_RTM/src/SHA256SUMS
> +sha256  825edf5a2fd35b788a23ff80face591f82919ae3ad2b8f77d424a450d618dedd  nss-3.77.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 2f7a265136..57df104d6c 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.76
> +LIBNSS_VERSION = 3.77
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
