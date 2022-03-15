Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB22C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4625060B79;
	Tue, 15 Mar 2022 20:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKkXOcVLB9Jl; Tue, 15 Mar 2022 20:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7A160B06;
	Tue, 15 Mar 2022 20:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8431BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B9A041553
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNRgp_xgRlGS for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23D68402A2
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:15:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w25so236221edi.11
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IMb6T0OQVaEI1o3QPh+JIwUAyGmxYhpooiPWBMJGGMo=;
 b=VtWywffEgbjBvWzz7k4K1tiYq/D08oPZ/zjMWs4l8WEa7je5FVtPgLUsT7lw8HJJqC
 SvdzFw3tfdeGSfeI9AbR/YsemIVW9IViHCSORPlm/o738z7FxpQVFoNCVth+g9/z9+qf
 OTtWJiEy5L+tYBZEeplwMnsI2RVtJOrGkp1zYuBTZSLJfUUK1CnbyiSELLBPdnD+Ue7Q
 9v0AO+F3rfw4UCAiF+cn06WgO9kvY6hGqcrSqsbtsDGTyVfaQzDb3B2HLYELxWUOxj8L
 f/ugGknKIoEeH/68Msi1tKCzUWf8qlEFXjAKjSpc3mMPhdZQjbMuhtmP8uBnpt8xYwx3
 7xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IMb6T0OQVaEI1o3QPh+JIwUAyGmxYhpooiPWBMJGGMo=;
 b=yH5GDC1agc+ko8CFbA8rHQfXoW15oVArHlAqOPsCJWSMQSpLh0eexGlrujQSXGm0wj
 Ri27B4US9AndNeCvRIFBQ5P0tnpt6Z1PwfY0M2rxA7Xc0NVNDKka+6tSxbjhKSUdi90B
 4nsoDsIvyqpuu3ZWIAa1aXphxkgVQy7y016iT9wSeZ+rEG6YPCmlCC5USPAPnXNmRoKh
 g81M4Roc1jm+AvA/g3Z7Bhg0qgcinySGWw2DLl8KDiIeP2+yhpimyK7W8je0WKQcewXe
 QZBIO0fmepTHg2vlVInH4dLPuD6wYluAuAHURGfSj4Jge/FaX29BpvS99RUb3IgPAMf1
 a9UQ==
X-Gm-Message-State: AOAM531q/20H87f+ov5LOBLi7basrELY+wLd7yShNVN3cDan6mtZ7Npl
 R5kV3PiOjv4NOKtRekjfjaKCEA==
X-Google-Smtp-Source: ABdhPJxz7GhQupivI52hr1hRH2AXb2VXZDwpgOEFH4MaInDIhKpP7Fcy+TiwZoP97qtzHoj1SIiUdg==
X-Received: by 2002:a50:f08c:0:b0:418:7206:c306 with SMTP id
 v12-20020a50f08c000000b004187206c306mr14319718edl.132.1647375335398; 
 Tue, 15 Mar 2022 13:15:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm8270ejm.200.2022.03.15.13.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:15:34 -0700 (PDT)
Message-ID: <add94dcf-3d7d-3e3d-c649-e741fba604a3@mind.be>
Date: Tue, 15 Mar 2022 21:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220224231609.1097793-1-aperez@igalia.com>
 <20220226161444.2221042-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220226161444.2221042-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH/next v2 1/2] package/bubblewrap: bump to
 version 0.6.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/02/2022 17:14, Adrian Perez de Castro wrote:
> This version includes a new feature which allows specifying multiple
> seccomp filters. There is now a Meson-based build system as well, but
> for the moment the build recipe keeps using the autotools based one.
> Release notes can be found at:
> 
>    https://github.com/containers/bubblewrap/releases/tag/v0.6.0
>    https://github.com/containers/bubblewrap/releases/tag/v0.6.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/bubblewrap/bubblewrap.hash | 4 ++--
>   package/bubblewrap/bubblewrap.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
> index 88aba150cd..c3bf4d8212 100644
> --- a/package/bubblewrap/bubblewrap.hash
> +++ b/package/bubblewrap/bubblewrap.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/containers/bubblewrap/releases/tag/v0.5.0
> -sha256  16fdaf33799d63104e347e0133f909196fe90d0c50515d010bcb422eb5a00818  bubblewrap-0.5.0.tar.xz
> +# From https://github.com/containers/bubblewrap/releases/tag/v0.6.1
> +sha256  9609c7dc162bc68abc29abfab566934fdca37520a15ed01b675adcf3a4303282  bubblewrap-0.6.1.tar.xz
>   
>   # Hash for license files:
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index 5f3d95e826..1ca2029700 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BUBBLEWRAP_VERSION = 0.5.0
> +BUBBLEWRAP_VERSION = 0.6.1
>   BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
>   BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
>   BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
