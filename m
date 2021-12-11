Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57D9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5792885244;
	Sat, 11 Dec 2021 09:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuaaw9stlGju; Sat, 11 Dec 2021 09:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F5C8523F;
	Sat, 11 Dec 2021 09:59:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C368C1BF25F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B28888523B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxVIp-c83cdl for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:59:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB3E885236
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:59:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w1so36920875edc.6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 01:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vfgarnxayv8DuMR0C+4NsTVt35IanclypYxY5QGS6lM=;
 b=fqOiyODxCYcCsf2J1iN1CcmraQf+0/qZ+lgQz0d2RnmjrW6Y4ZztDGSJR+iSg88t12
 fW1+CCjZaZg/K7J7j4EX2DDnooQJ9fSBk+djiSV53RMHl/lvB58VHatGPnaPtoCc7DQP
 wl6Z5JWz1x7KGtnAoqKLaNXZTb30fOlQBg5IrGQIyFjxd2R2+XPzoG1fC37rzcquNjs5
 nGuxp5VpINlQqbkTlqVN3LN12P/cD6fmy+KTcD1DsbkO3GmnZiIHz3qW99FImEoUhdPv
 gZjlFHuXFF5FsKZFJRZo/2m4kaYQxJR1RIfd35RD79ID1V38yi9P1irIJYBX6NwQOKz3
 HjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vfgarnxayv8DuMR0C+4NsTVt35IanclypYxY5QGS6lM=;
 b=1rrbSGRtfhQlWtbU2+GqGtQz8oZG8S6b/yA7Jlk7ShSd5jbiIIhT+KehoISXlsYrcK
 Lhhf2lwNScfOzqm43b4lUZnWGkxAwXILzx0a0oYWoKv+z21UqQnwEW9PHTKmCVHD0i/5
 tY9kv6W4x1h82vJKoL09JegMtlHNAb5S74mQp2ev4mko5qUiotKlePQxZmHalB/ieXyp
 //J2uDqBzhw43/mvWijGeIgj/0sfKwYysSNj8VXPr3zrlzcnn2ublHS16vKU0+T8syEb
 dJGc3ZPottgTLt6pdQ2SJpgqHPktbe0TJ2XOC5PnSGmt7eUzVAk47OBgaiGruegTQ32K
 cb/w==
X-Gm-Message-State: AOAM531zpuPg8qXY22a+ILu96m/VxrQGNmzZrseNs4DhZgxzyCmLCF+R
 z/P3/fPDZLQBDd4m01nkz0xS8w==
X-Google-Smtp-Source: ABdhPJxA1AIyZJkd4aRLFD2wXbkvQSkUX6JCtFtT5I2VncGZ/tj97hVv59jZEsTIW/ZmYnrzgL4crA==
X-Received: by 2002:a05:6402:26cd:: with SMTP id
 x13mr46824514edd.11.1639216743039; 
 Sat, 11 Dec 2021 01:59:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qb21sm2923507ejc.78.2021.12.11.01.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 01:59:02 -0800 (PST)
Message-ID: <b3cda53a-fcf8-db29-67b8-be1f03857d98@mind.be>
Date: Sat, 11 Dec 2021 10:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211119172659.291110-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211119172659.291110-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-nextpvr: bump
 version to 19.0.2-Matrix
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



On 19/11/2021 18:26, Bernd Kuhls wrote:
> Changelog:
> https://github.com/kodi-pvr/pvr.nextpvr/blob/Matrix/pvr.nextpvr/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
>   package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> index 53f25735c5..2a0c235af1 100644
> --- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> +++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  64b47658c0027a98465755cf422241f3d15810113a0fa9d0b819fb7da6670f8c  kodi-pvr-nextpvr-19.0.1-Matrix.tar.gz
> +sha256  c240c16a878f3b024c40728efe5b4f1ae19b74c4cb69875d5f9e415882838ee3  kodi-pvr-nextpvr-19.0.2-Matrix.tar.gz
>   sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> index 36a053dbd5..a453c4e62f 100644
> --- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> +++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KODI_PVR_NEXTPVR_VERSION = 19.0.1-Matrix
> +KODI_PVR_NEXTPVR_VERSION = 19.0.2-Matrix
>   KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
>   KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
>   KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
