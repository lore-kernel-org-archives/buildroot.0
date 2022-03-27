Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BC1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502E581D7C;
	Sun, 27 Mar 2022 15:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVOVKpLGXlyg; Sun, 27 Mar 2022 15:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B8981B6D;
	Sun, 27 Mar 2022 15:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0B9F1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E039D4099B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIF-gCihkUmO for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EACD940993
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:45:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a8so23963686ejc.8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TG/7hlL1s9wCocNJX2wU+xNGrrfvul8w6hmUhV4U2uA=;
 b=QzQ0R6Uu5O/81wErXaS8Av+ZfNKxDMM/KMmXgV5J5fYSR5I/+MiigOkV/dwSqrNPv4
 ZbbPts48LxKk+XLKw2awhdn5Xnuim2uxqiVhMSVk1v5KcY6MQjKT11xMHDQC8kaOdztf
 /STSXdjUWc+FM6sJTZ20a3HFhsDM9rtDKKxE9V359pLqjFPFmHUAvNxEVKNrc11ZbFCU
 RWLbmwIDs1xtn8NiGu6s15qJExWkLBkZg3dcfJxL30fu868NKN5CrBL3kl5HqbcVhith
 PXXGtkFSfTKlfL0vbP2trCnn1i01L1ajvs0vDzSDxSFYZljCQjr5wBUqQHJga2ff2URP
 uBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TG/7hlL1s9wCocNJX2wU+xNGrrfvul8w6hmUhV4U2uA=;
 b=GqqNVocOYIbGsVJaEv98lC0RAm9ulf3LUDoFI7JCnCzh2nOYThPeTJQfzXr4kwCLwx
 2IMU5+J3t6QWCycDHm+6NxoEzmg0mY/vlYv3+YuGLdNw7Nw9u1lsolbl9Q7tB+tUOBIP
 VkvR+9ODM154BfF6Dcxm6Z+GBOTnOZOm0fjZ6E7pxphdPmtuYh2pPjLKk7RCd/8wKOL/
 YlzNpawyD16MWebX5sDqx7Fa5QRYgtWI8/bWtjUFvv/if46fwBkIuJESd/yNH0SKshHp
 2rorKvLiMTlSj+aXY37UvSGrXacgL+a2nXto2mI9ewWr5ktliw2XVz4KFhQK/YZ+57vB
 2U5A==
X-Gm-Message-State: AOAM533OwyAVi99PQu31ImBnD4g93mMlZkqU66wYi4CF/X91EggonBy+
 hi1oqh+8OJMeYXg/pCbVAqYN9KSaV//Rtw==
X-Google-Smtp-Source: ABdhPJy4/EXG/ypQ6tJvIjatrxJyVO4sqAewHJ2i3qMLLG+5rDYv2WODNL1Ms4c56LJY9TOS+lb1Gg==
X-Received: by 2002:a17:907:3f12:b0:6df:e7c1:9afb with SMTP id
 hq18-20020a1709073f1200b006dfe7c19afbmr22491003ejc.84.1648395936160; 
 Sun, 27 Mar 2022 08:45:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 eg6-20020a056402288600b0041919c78082sm5853496edb.87.2022.03.27.08.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:45:35 -0700 (PDT)
Message-ID: <11ba0b58-3127-0d3d-7d40-d6a63877deeb@mind.be>
Date: Sun, 27 Mar 2022 17:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20220319061115.1641-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220319061115.1641-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.6
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2022 07:11, Andreas Ziegler wrote:
> Remove 0002-lib-alsa-Error-add-missing-include.patch, the upstream fix is part
> of this release
> 
> Change log:
>    https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.6/NEWS
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...2-lib-alsa-Error-add-missing-include.patch | 25 -------------------
>   package/mpd/mpd.hash                          |  2 +-
>   package/mpd/mpd.mk                            |  2 +-
>   3 files changed, 2 insertions(+), 27 deletions(-)
>   delete mode 100644 package/mpd/0002-lib-alsa-Error-add-missing-include.patch
> 
> diff --git a/package/mpd/0002-lib-alsa-Error-add-missing-include.patch b/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
> deleted file mode 100644
> index c45a087a54..0000000000
> --- a/package/mpd/0002-lib-alsa-Error-add-missing-include.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 3856224df9160c201bc6d224aa927e7c358e3269 Mon Sep 17 00:00:00 2001
> -From: aeolio <git@aeolio.de>
> -Date: Tue, 14 Dec 2021 09:01:23 +0100
> -Subject: [PATCH] lib/alsa/Error: add missing #include
> -
> -Downloaded from upstream commit:
> -https://github.com/MusicPlayerDaemon/MPD/commit/3856224df9160c201bc6d224aa927e7c358e3269
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - src/lib/alsa/Error.cxx | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/lib/alsa/Error.cxx b/src/lib/alsa/Error.cxx
> -index cd351f37d1..8ceb4417ca 100644
> ---- a/src/lib/alsa/Error.cxx
> -+++ b/src/lib/alsa/Error.cxx
> -@@ -29,6 +29,7 @@
> -
> - #include "Error.hxx"
> -
> -+#include <stdarg.h>
> - #include <alsa/error.h>
> -
> - namespace Alsa {
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index 56f88490cf..b09140abf5 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  f22c2c25093a05f4566f9cd7207cfbcd8405af67ed29a989bcf8905f80b7a299  mpd-0.23.5.tar.xz
> +sha256  cbc5928ee3ee1ef7ff6a58f6ba4afaee16c07e9eb42d0107bcc098010f4f26ed  mpd-0.23.6.tar.xz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index a55e4adde2..12da36098f 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   MPD_VERSION_MAJOR = 0.23
> -MPD_VERSION = $(MPD_VERSION_MAJOR).5
> +MPD_VERSION = $(MPD_VERSION_MAJOR).6
>   MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>   MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>   MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
