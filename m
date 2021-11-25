Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EF224036C;
	Thu, 25 Nov 2021 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6HRe95QD6cU; Thu, 25 Nov 2021 19:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AA99401D9;
	Thu, 25 Nov 2021 19:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8734D1BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7725C80DD2
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pt8sLr4YU5o7 for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9B5B80D55
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:55:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t5so30059252edd.0
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 11:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fb3W4J5OqMMBeJ0ACM8dX8US8RFIQeuQ9J+zPI/ZqMQ=;
 b=P1HaX8ODGJqhus4rxQSvxuQCTTLL7iQYyDasXkF6bz8pkL8fdbxWk7yaNEkSwb7Kx1
 3LMLQ/IKyAJ0atHmkcANiEoQd7bUurs2squ+8fIZAr91c4c9oEgPHrQ4uQNxM22QUZdD
 X/hIaWtcr9tBodI816bH0sfqEDK0mn1wPaXmuElmfY/hxfP79wiLEGQXqi9C+7keHv2G
 ZPG7Pzr4LeotVyN7K7gN4aEeFUoigxhZ/PSxTOkKqYkgtDyXNADnsMedBBsPUucrdVwd
 YcQdu10oMrT+yOUFwrGgpX6tt2CjhVF1p3IFVO/qpGTzMSfYeGkBeach1w83H3rkUiXp
 GVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Fb3W4J5OqMMBeJ0ACM8dX8US8RFIQeuQ9J+zPI/ZqMQ=;
 b=uZuHqpYLYFN6Nw1mAaLr1ogohhLgAQ9QWKDKGXVW2/86LY0BhWBhTQTBfzG1N2PE00
 QZNQ50m1ghlEtcwzPCNL0WD6sFlbe0CDOsaHll0796HXnk88O0IPT0qAgwGLaYqvG09s
 UgTdQoH2jyayfQsVfXLBh3BJ2DnuknpPetpVShML74dLEKmMXGPVYPeGnAiLPiTUIkkl
 msFejOEaEvMXYi0S8YM8iYvwklfHpEmMmGoGWt6CL/XEU55A+6ilztQryPFzhTn4/Bha
 rLaD9F5A51eT76W1y3uSaI+ZguOqWnSKBvwEnb5FvV9FzxfhoWconCC723xOt9NiVq6c
 U32A==
X-Gm-Message-State: AOAM530gFkUuOnkainRplzkS4DKF0DD4UT2c4l/olW9nU86PHut1+UpX
 9/k6W9HAT6oNpIsdySmISsKATe/ISX3SKA==
X-Google-Smtp-Source: ABdhPJzhiaCLFLIOge9QYQaJLBTIKcq5/jN3rWBtfJApKRebVDDMeZgvRjdAJzaRdYl2GDob2tiDmg==
X-Received: by 2002:a05:6402:4311:: with SMTP id
 m17mr41408257edc.103.1637870104826; 
 Thu, 25 Nov 2021 11:55:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b11sm2969361edz.50.2021.11.25.11.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 11:55:04 -0800 (PST)
Message-ID: <751a2d4f-b8ae-a004-06ca-942ea17b60e6@mind.be>
Date: Thu, 25 Nov 2021 20:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211122222621.3539653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211122222621.3539653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nss-myhostname: rename
 MYHOSTNAME_SET_NSSWITCH
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
Cc: Vincent Prince <vincent.prince.fr@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/11/2021 23:26, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied this and the other 5 rename patches to master, thanks.

  Regards,
  Arnout

> ---
>   package/nss-myhostname/nss-myhostname.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
> index 08683a542b..b1bdca8ef1 100644
> --- a/package/nss-myhostname/nss-myhostname.mk
> +++ b/package/nss-myhostname/nss-myhostname.mk
> @@ -10,11 +10,11 @@ NSS_MYHOSTNAME_LICENSE = LGPL-2.1+
>   NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
>   
>   # add myhostname after files if missing
> -define MYHOSTNAME_SET_NSSWITCH
> +define NSS_MYHOSTNAME_SET_NSSWITCH
>   	$(SED) '/^hosts:/ {/myhostname/! s/files/files myhostname/}' \
>   		$(TARGET_DIR)/etc/nsswitch.conf
>   endef
>   
> -NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
> +NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += NSS_MYHOSTNAME_SET_NSSWITCH
>   
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
