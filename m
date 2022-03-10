Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDFEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE9260BBC;
	Thu, 10 Mar 2022 21:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msWQX-xYdOQq; Thu, 10 Mar 2022 21:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87ADF60B09;
	Thu, 10 Mar 2022 21:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3541BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB0A408AD
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_Qa0tD7bcSe for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21A7140878
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:22:19 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id yy13so14979425ejb.2
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j5OZ0n5+H7m7lvK7sVg1HSVoxvO/yr8rDigvmHsWmRQ=;
 b=I+Elnm8vsJ5GMRo8iRRz34iOhDv3zcjOmnIEUkMYTnEZNK615Ee5cxKnCBihUcLU4D
 q5QbL73QRuGTu0t4NePQVAAXtXRtr0J9bnKEQDQ8d0KDmM++eT0KISWBVxLPIVgJDfKT
 XWCO/yEA2wtQXD2mzWhgp9TKnjrYY35Fg24EcdVzguFXZAwft/7tNyHN9WuTtogXcV7u
 z5gBXaq/N1QisAqWbME+ozbDDTsEsPnybmHdWxZ2pg2j5XjDLP1TM9bs2tdghXjIO5wB
 QpGQ0lw+gQvHcwyigF4tNBkrI6Vg/F0sY9b2zqKZBQrGUkc7ub3V0Ey1bO9SOw9Q54pZ
 BPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j5OZ0n5+H7m7lvK7sVg1HSVoxvO/yr8rDigvmHsWmRQ=;
 b=IL8ePNnDDLFzKQgB2NQwftdoFhC0yhfeqDgi1rN57SXOliYa/+SScKafAMq8lTHYgB
 1PxmtxVOMdvxkrfMahDIMhmJLwmSwkMk579idTdpAKIFH6LL3SsN4ni+KBzx5Sn+rxH+
 yM3lB2VtFBoCCgK6wY1F35RRtmA+4MOB06i1mOdZSTUQOpU7f2Yw9CbTkOOk82OHorF9
 Vribz1SvGMSGyc71uit0z4AY3eC2DtTo/hMOYxW+ssuPe5rsQyXbC6DQABwDtmQaMprv
 RX/WZfkR9XAiaxVNALi/oY3Gi7Ac5+OGRmfbx3T9BGYpKAuFO7nAkwwGHDcpyqRXvEsD
 RAKg==
X-Gm-Message-State: AOAM532UzE7z2TxDumFWZBrUWfBFl8+SVIlA7wOzhZFJY0gI8Sr8Fvt9
 j4ql4tOZXhpQOlfQraR8igliAw==
X-Google-Smtp-Source: ABdhPJyEA85TUARi1baHTpXIMuAy/NiMXhqv8ussEZIk4cC766u81vuhiZsjAi++25dqeHWryFtIuA==
X-Received: by 2002:a17:906:4108:b0:6db:6b07:34c3 with SMTP id
 j8-20020a170906410800b006db6b0734c3mr6172126ejk.407.1646947338167; 
 Thu, 10 Mar 2022 13:22:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170906468700b006da636fdbe3sm2149554ejr.105.2022.03.10.13.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:22:17 -0800 (PST)
Message-ID: <60819f52-11e9-40e0-b3ec-b399c1c7b1fa@mind.be>
Date: Thu, 10 Mar 2022 22:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220206212028.1786742-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206212028.1786742-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: bump to version
 d16bf02a11953dcac01dca73e6f3778f293adefe
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 22:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5base/qt5base.hash | 2 +-
>   package/qt5/qt5base/qt5base.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 396f5044ff..1b9ff43ab2 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  269ae20ed74cb949420ac3abac0bdef3b65501ea47c9312c01e8f9073baf24fe  qtbase-53a047c212af7fbded6505651f648172f9d7a34d.tar.bz2
> +sha256  96b1c96041ae7b5186c94f231979217bd50e3c0a4caeba32982faa8054a6d113  qtbase-d16bf02a11953dcac01dca73e6f3778f293adefe.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index d8a0bf1d16..37ad9c652c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5BASE_VERSION = 53a047c212af7fbded6505651f648172f9d7a34d
> +QT5BASE_VERSION = d16bf02a11953dcac01dca73e6f3778f293adefe
>   QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
>   QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
