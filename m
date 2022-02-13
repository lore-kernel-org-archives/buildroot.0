Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31006C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA6A60BF1;
	Sun, 13 Feb 2022 15:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upJyy_WfzMte; Sun, 13 Feb 2022 15:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7D660B94;
	Sun, 13 Feb 2022 15:33:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A3E1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D293640493
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYSeslU6BCLr for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:32:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A11C340484
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:32:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y17so21655552edd.10
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dT8W/WZUvuoac9GLRT5bzs0Rm7OjC42qQVb/O+aubKQ=;
 b=MvvWe/fpKB1QJmT/pRuExZPGRRH1H2GMLh6MUmkLEUHluy0QJkobt6BfIOGnGfY9eo
 icL0QcDRfr+8VVAxpZ1tf4j/TxL8tLuvIOL/MHQToX0wlH4cTl8PL/+A/3PmsDmj4g3j
 SJbskfJ8D0NdEF+ClYoR+bD+GyzvZ8oKEjqoncWsCxzdU0bpl4fYJCVNQUVCX1hejpWp
 5GX8B1rB2HTXZUohnNurD+eiTGhAx06zBABHoRLKMqyue54DWTr6LE4Z+5+AKitn7UDz
 qkavgX7L9UQrpAjCfHEMAEPo/i3qXJdMvnDhmoHR8F3I3NShS28p2YtWz+SuUWybqimY
 BZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dT8W/WZUvuoac9GLRT5bzs0Rm7OjC42qQVb/O+aubKQ=;
 b=V7Rk982TFuR/dl+ivd7jwyhYnClqNOGw96WqoK3gi/LDHT2ullQ8SKkSz/TWj7/Dpv
 R1P0AC1t8QXPhrqWBS9ferEY5LXFYOTnZKH8riCAuf2qmMCH+PsNAT9LLAARJ0Qv149S
 c3FUDv1+yVpEqIbuY+UCX8v4LVEXqc1nMsDpmqbHCJ2umyN7nH5u2jJ1nyL3L3rYuROQ
 blT428Rl2xfYC4m5esdZJo73ivSTTsjOrdlMGzuM6N3JvFzrwTpaSS09xFaoWpbMgf5z
 XDhrksjKOdHrwHB69BjSifAtKKUCIvg0J+yJw3t1tzdTTMXwCJZHH5hewm+V0gj45Ptp
 esiQ==
X-Gm-Message-State: AOAM531qW4LKGIJprzabarfJpdZ49rzAK51WPkptnb70YwgwHyIswSdG
 H+PzEzYPNVu+xG1FtO1BmuNhcQ==
X-Google-Smtp-Source: ABdhPJxUsLjo45uTmwVem80btEHMnjAIwJCh0BLdPfDYhnQUrJs0kPfnauvy8aTvaAFn2QSdKxUs4A==
X-Received: by 2002:aa7:ca4d:: with SMTP id j13mr11694937edt.400.1644766357866; 
 Sun, 13 Feb 2022 07:32:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 24sm2092457ejm.163.2022.02.13.07.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:32:37 -0800 (PST)
Message-ID: <6b41c65a-8655-229b-2832-23c2fa7c1c1e@mind.be>
Date: Sun, 13 Feb 2022 16:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206224521.3204040-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206224521.3204040-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.75
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



On 06/02/2022 23:45, Giulio Benetti wrote:
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
> index 819c272a30..07fb340c33 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_74_RTM/src/SHA256SUMS
> -sha256  88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056  nss-3.74.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_75_RTM/src/SHA256SUMS
> +sha256  fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582  nss-3.75.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 537f6dd9b6..a9549e48dd 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.74
> +LIBNSS_VERSION = 3.75
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
