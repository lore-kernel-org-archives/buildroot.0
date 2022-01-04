Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42A4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D65817FD;
	Tue,  4 Jan 2022 17:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAbUNIf0rese; Tue,  4 Jan 2022 17:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651F081839;
	Tue,  4 Jan 2022 17:50:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFB1E1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA4660B94
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGUf95RwHSDO for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 696D460B91
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:50:26 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o6so151533661edc.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JaL04ByrRn17VRgnhY8AfKEcgpvA5ciT7SqNqmx/TS4=;
 b=f1TOrcQ2pJ6umVTBedNGKLQYcpH54cTO1y47pB3IwXAOQtt+PlhGBEGf6zh8jTjNcA
 YwDpoAioSrlneCt7puAw6BVaubSKrT7eHCPKSK3h77ZTUK/OF8TPIeJhaBrniCIDJXj6
 8kejWxPRDVgQStd54ZvPUuV4XnK+q5PbMkpumm84+/7sGwmDKiXXvjUyhEOtmJKgN+Ca
 mGcmgErGpu81ZD3ezsQYUcOpQI0u7wIE5ISJWd3cQI3AbjujIyvFHr60H3D3xqWMrSRl
 fU5BqjALmGizb5M54nSGxHsRsbaS6poPgASP9GfNmmxYDyO6XfJqO1FpcxvlLuOLcYay
 uSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JaL04ByrRn17VRgnhY8AfKEcgpvA5ciT7SqNqmx/TS4=;
 b=1DYJap0uXXbUIfKYkhOKcD1grQs9W9FdKiOIUlRIpVtftXz358DMq0lXCPAFGNao9F
 XfF+ijA1jVsGF/PSN9O19aD2agHMyVsRU33UGpTJM8LPZ99GAk5HifyKxuwvw+Rgks7+
 Zp+UdWcEFYEPZz45vox7ZuutWViE+NF7XwmmcYHFZbaReGVUYkRtZPMAjSp9V84/uEQL
 cn5Yhm/FvpqQhLcwvWv1po2+Unp9eUPHXGu6ho1zgSnL+oCKdtdRnQ96IAC4B6ZqW8hk
 bdRbljHq08mLtUaABET4Pbp5S4y/TmzFW4DT7axYhNnV6F7DqTDYC7WSzXdpCDrvMgn2
 zJPw==
X-Gm-Message-State: AOAM530YfGB8abvHCbtMyThnGHP6uktZRU8qjDTvzBESGWGRw3secciL
 sUsbFEkFKcy4z/xKAcDYW6pfHQ==
X-Google-Smtp-Source: ABdhPJyCC5emoDfvzchpnnKmovgPqx/WvYeD5/MFsTdKll7SIJtW6bUQtc6h+uuT9ni8pMe2M0yh5w==
X-Received: by 2002:aa7:c54f:: with SMTP id s15mr49897383edr.240.1641318624559; 
 Tue, 04 Jan 2022 09:50:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hq29sm11882171ejc.141.2022.01.04.09.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:50:24 -0800 (PST)
Message-ID: <1b540313-e49f-e282-3db5-b9e51076c280@mind.be>
Date: Tue, 4 Jan 2022 18:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101221425.2059395-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101221425.2059395-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: bump to version 0.8.1
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



On 01/01/2022 23:14, Fabrice Fontaine wrote:
> - Drop first patch (already in version)
> - Refresh upstream status of latest patch
> - Update hash of LICENSE and add cli/COPYING:
>    https://github.com/Cyan4973/xxHash/commit/85e1ea2ab0d90463b804f4a65b0f67d99718c6f8
> 
> https://github.com/Cyan4973/xxHash/releases/tag/v0.8.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...h => 0001-fix-man-page-installation.patch} |  0
>   .../0001-fixed-man-page-installation.patch    | 31 -------------------
>   ...efile-add-dedicated-install-targets.patch} |  8 ++---
>   package/xxhash/xxhash.hash                    |  5 +--
>   package/xxhash/xxhash.mk                      |  4 +--
>   5 files changed, 8 insertions(+), 40 deletions(-)
>   rename package/xxhash/{0002-fix-man-page-installation.patch => 0001-fix-man-page-installation.patch} (100%)
>   delete mode 100644 package/xxhash/0001-fixed-man-page-installation.patch
>   rename package/xxhash/{0003-Makefile-add-dedicated-install-targets.patch => 0002-Makefile-add-dedicated-install-targets.patch} (94%)
> 
> diff --git a/package/xxhash/0002-fix-man-page-installation.patch b/package/xxhash/0001-fix-man-page-installation.patch
> similarity index 100%
> rename from package/xxhash/0002-fix-man-page-installation.patch
> rename to package/xxhash/0001-fix-man-page-installation.patch
> diff --git a/package/xxhash/0001-fixed-man-page-installation.patch b/package/xxhash/0001-fixed-man-page-installation.patch
> deleted file mode 100644
> index a9f68db4b4..0000000000
> --- a/package/xxhash/0001-fixed-man-page-installation.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6 Mon Sep 17 00:00:00 2001
> -From: Yann Collet <cyan@fb.com>
> -Date: Fri, 6 Aug 2021 15:29:32 -0700
> -Subject: [PATCH] fixed man page installation
> -
> -[Retrieved from:
> -https://github.com/Cyan4973/xxHash/commit/e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index b8552a9f..556a32a0 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -498,10 +498,10 @@ endif
> - 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
> - 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
> - 	@echo Installing man pages
> --	$(Q)$(INSTALL_DATA) xxhsum.1 $(DESTDIR)$(MANDIR)/xxhsum.1
> --	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
> --	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
> --	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
> -+	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
> -+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
> -+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
> -+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
> - 	@echo xxhash installation completed
> -
> - .PHONY: uninstall
> diff --git a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
> similarity index 94%
> rename from package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
> rename to package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
> index 0607c8ee82..17d34a0823 100644
> --- a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
> +++ b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
> @@ -10,13 +10,14 @@ This is especially useful on embedded systems where dynamic library is
>   not always supported by toolchains
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/Cyan4973/xxHash/pull/665]
> +[Retrieved from:
> +https://github.com/Cyan4973/xxHash/commit/db9c199e99f7b4d419647b1ef49c547fc2547516]
>   ---
>    Makefile | 18 +++++++++++++++---
>    1 file changed, 15 insertions(+), 3 deletions(-)
>   
>   diff --git a/Makefile b/Makefile
> -index 8d4fcd2..5fe7297 100644
> +index 8d4fcd21..5fe72972 100644
>   --- a/Makefile
>   +++ b/Makefile
>   @@ -505,11 +505,14 @@ libxxhash.pc: libxxhash.pc.in
> @@ -68,6 +69,3 @@ index 8d4fcd2..5fe7297 100644
>    	@echo xxhash installation completed
>    
>    .PHONY: uninstall
> ---
> -2.33.0
> -
> diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
> index feb5000808..2c99236a45 100644
> --- a/package/xxhash/xxhash.hash
> +++ b/package/xxhash/xxhash.hash
> @@ -1,3 +1,4 @@
>   # locally computed
> -sha256  7054c3ebd169c97b64a92d7b994ab63c70dd53a06974f1f630ab782c28db0f4f  xxhash-0.8.0.tar.gz
> -sha256  9da63520e9293d82c4b1613be5c84058cadb82b02f5972179bad13731d589910  LICENSE
> +sha256  3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c  xxhash-0.8.1.tar.gz
> +sha256  553d0035773ddd1590045f8fdc3a4c6ead31e36336721aeca8421e88ed1c9f80  LICENSE
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
> diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
> index 3e7f3244b3..a8f8d1d179 100644
> --- a/package/xxhash/xxhash.mk
> +++ b/package/xxhash/xxhash.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -XXHASH_VERSION = 0.8.0
> +XXHASH_VERSION = 0.8.1
>   XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
>   XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
> -XXHASH_LICENSE_FILES = LICENSE
> +XXHASH_LICENSE_FILES = LICENSE cli/COPYING
>   XXHASH_INSTALL_STAGING = YES
>   
>   XXHASH_TARGETS = xxhsum
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
