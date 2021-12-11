Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F671400C8;
	Sat, 11 Dec 2021 21:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTt4UHU3auLD; Sat, 11 Dec 2021 21:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B0F540173;
	Sat, 11 Dec 2021 21:07:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220191BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFD36111B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54mtmK4Y1brF for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:07:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BED5661114
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:07:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x15so41158587edv.1
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TEEDnhthVSlFiCn8yilXFqAvNkU2Ct5KXRrQPvMtBh4=;
 b=hPeE+UWFLXwKGAox34iEKYwhIP1UAUN50jcaw8t1puhOFrQ2YdmuxquyTFdPB+OI/p
 h5DSUONjPiISaZL3ssriY6fJ6Dbhfv/ZCIsEVd0COlOEP40sabLzkIXA5K3/Vyx7I3p1
 unUlMxEK1thpGhKcCrk/TFyQwaPobHUtIR8gc8Xgpau/+uvX+bs+2jabe/uAP0nl95CW
 KuuOJrw9HkBQtvDsBAAwgR+3xFBOh5+9ZhfO2QSGIOq4hEa0F1V+/gYwolCaKokwoHFS
 jZcx3EkBjujNnNJQB1Ouhf33wmu6aVPIqH1Z9O5nah6l3SQpgsNqLQnqcpqrdZsXV0GM
 0XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TEEDnhthVSlFiCn8yilXFqAvNkU2Ct5KXRrQPvMtBh4=;
 b=7DdbFeGKPxjwqnsqjaHGk9TMmn1HhKHr3rSeUmcqoPR5BMF0AXFMgwbAS7JOgbL2L5
 JJ/jockuLMusrl9scmaiHoxYpn5alVaOkXTWMuAVedD/+vPo6PlWrneMZ9T0nlQYz3e0
 hrpUzkEkh9MBzqshDU1UYpGflaNteL4QKHWTHJ4R+DdFUOu1Icvd6SCAa3DF6IhXP4Ft
 IrDoAEt1dvqnanyX6XA4aiHrIHK9Iq8ol2LVlMNNaWbHsq4p7doSFvTiEuCiBufZS2wS
 wzAuq668MXOvat5j/ZlNKF9+J7nJMZLx1l8tfIPx7akaQ6RRA1JRnne5Ky6GIiPnumBJ
 xMRQ==
X-Gm-Message-State: AOAM5301F8vZk4xELYNCxWOAUQf+3irl0l2NsJ7l7qEMbGmesc87Iyuy
 t9yya/E5G2EL8UYjbpMvCvpYpARmWsamRhiUj70=
X-Google-Smtp-Source: ABdhPJyFhECiq78cgvF1fiX1lpiugkve5y3hrXy5R2Dy3vNeGDwREz8GNczfZXosryFaMBXcW+PEEQ==
X-Received: by 2002:a05:6402:26cb:: with SMTP id
 x11mr48931928edd.149.1639256838907; 
 Sat, 11 Dec 2021 13:07:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o8sm3767651edc.25.2021.12.11.13.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 13:07:18 -0800 (PST)
Message-ID: <22fb5b61-77ea-3581-4ba5-05ecfccb632e@mind.be>
Date: Sat, 11 Dec 2021 22:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211206190216.798637-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211206190216.798637-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/12/2021 20:02, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/tvheadend/tvheadend.hash | 2 +-
>   package/tvheadend/tvheadend.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index 49b102cf8d..db06af53b7 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  903f05c6b6e8dfc2ed7df19ec9b63733a5e38caeca1269cc9bb99d46659d8907  tvheadend-637844055c186e981495da711e4887806f656c98.tar.gz
> +sha256  11eeca461e74fbe8306916933cab96d35a99fa89d81e26126e194875c41b6fad  tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6.tar.gz
>   sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index a50f74a074..27443307da 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TVHEADEND_VERSION = 637844055c186e981495da711e4887806f656c98

  I don't know what happened on your end, but this is not the version we 
currently have, and AFAICS we never had this version...

  Regards,
  Arnout

> +TVHEADEND_VERSION = b8710206eb073c72b142bce95846b77a0ffa34a6
>   TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>   TVHEADEND_LICENSE = GPL-3.0+
>   TVHEADEND_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
