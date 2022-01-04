Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A443CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3499A81D34;
	Tue,  4 Jan 2022 17:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VD5wgfGvR5k6; Tue,  4 Jan 2022 17:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59DFF818E6;
	Tue,  4 Jan 2022 17:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13E9E1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EFE9818A1
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QweoDUpMFnXw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:50:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 030BE81ABA
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:50:41 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m21so152675480edc.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+DaCIG9Uj1t1BVaWBem0rxQrq3KmYYu2e/ry6STal58=;
 b=hV69Ew9VkfOXbR0EsjITFAet6+dYqlXj4oTqaECLd/cHzf9sUVFHKoOhJhr9ZPsQlF
 UpHLXgUQR5sC91WTb5FTcjthe5m/0o+uW90/kO8Jf9RJ+bfpIDoTPJFZko+MFrkW5w4u
 UgYehdklMFOJKTq+nYIZp+FbIbCB/BNpkeqA4C56vWDJQzT4as1jdHrv8u5BmEVOcdLU
 DL2V87vU64UKcD1Q202XMJYVKvrEZ516dmiraQLPetmrbVQn/K32tjAYWktJ9WhL9nqI
 I9R4wT0kdsh/EE4ZMlSzZxkebISoKZEfHNfkcPMDAwhiVT9U492aDmsW3aLPeTxGUjwu
 mOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+DaCIG9Uj1t1BVaWBem0rxQrq3KmYYu2e/ry6STal58=;
 b=tBcY/AgyBaHZBXuEpurDX4G0NM2nswL0zJApKgNVRl7zbOM0gKPfe2KLQH4mV11FcY
 JTO3DdNL7g9A6Y3S5Hd1f7khFsmO3adeBlA0ojpVasMYlrLXOR1SGLh5gvAZA0uTAiE/
 nz9Vm+5bGd5Np5rpADMJv9vnJOJAda0oI+WYiPnbtazh70Xus7izLYQHubWPACxXXSv5
 u0T+cdvSEnNWd5w6bmFhN4DPx+0KvpZLEe2f76rFIfeh9GwKjSfaf0SWwU9xcU7B1Vjn
 aN3JYUGepjgK/ekwn30XiLJiqK6x9J/bHSWqDmVX7EB7Pw0aYeDWAdRjh+Zd5FuBpbmD
 xxJA==
X-Gm-Message-State: AOAM530Y8wGF+X6SKrOd7kxQG8T/FLJeae1yeGakr+NMkOeXLLPxHWYH
 /Q4qq82eE1poHLiNyv/hJc9NTw==
X-Google-Smtp-Source: ABdhPJzg1x0R00xo99KBz5Lti8X2z63gQPqUQ+BjPnHkegficS4GDwa6lbdSN7c3w7rqk7PejWftMg==
X-Received: by 2002:a17:907:2ce6:: with SMTP id
 hz6mr12303636ejc.768.1641318640168; 
 Tue, 04 Jan 2022 09:50:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i10sm11675043ejw.113.2022.01.04.09.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:50:39 -0800 (PST)
Message-ID: <64cd02f8-a2b5-1f20-8198-ff522eb999e3@mind.be>
Date: Tue, 4 Jan 2022 18:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101223529.2111756-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101223529.2111756-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyalsa: bump to version 2.0.0
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



On 01/01/2022 23:35, Fabrice Fontaine wrote:
> - Switch to meson-package to drop first patch and disable examples and
>    utils
> - Drop second patch (already in version)
> - Update hash of NOTICE (empty new lines added with
>    https://github.com/tinyalsa/tinyalsa/commit/902b8c8f9fa5a2e1937007d7d5ee90f01790808b)
> 
> https://github.com/tinyalsa/tinyalsa/releases/tag/v2.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../tinyalsa/0001-disable-doxygen-usage.patch | 35 ------------------
>   .../0002-interval.h-add-missing-header.patch  | 36 -------------------
>   package/tinyalsa/tinyalsa.hash                |  4 +--
>   package/tinyalsa/tinyalsa.mk                  | 27 +++-----------
>   4 files changed, 6 insertions(+), 96 deletions(-)
>   delete mode 100644 package/tinyalsa/0001-disable-doxygen-usage.patch
>   delete mode 100644 package/tinyalsa/0002-interval.h-add-missing-header.patch
> 
> diff --git a/package/tinyalsa/0001-disable-doxygen-usage.patch b/package/tinyalsa/0001-disable-doxygen-usage.patch
> deleted file mode 100644
> index ed939fb9bf..0000000000
> --- a/package/tinyalsa/0001-disable-doxygen-usage.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Disable doxygen usage
> -
> -In order to avoid a dependency on doxygen on the build machine, this
> -patch adjusts the main Makefile to not build and install the
> -documentation.
> -
> -[Vincent: tweak patch for 1.1.1 version]
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -diff -rup a/Makefile b/Makefile
> ---- a/Makefile	2017-05-24 05:23:57.000000000 +0100
> -+++ b/Makefile	2017-05-25 10:35:20.781747053 +0100
> -@@ -11,14 +11,12 @@ export MANDIR ?= $(PREFIX)/share/man
> - all:
> - 	$(MAKE) -C src
> - 	$(MAKE) -C utils
> --	$(MAKE) -C doxygen
> - 	$(MAKE) -C examples
> -
> - .PHONY: clean
> - clean:
> - 	$(MAKE) -C src clean
> - 	$(MAKE) -C utils clean
> --	$(MAKE) -C doxygen clean
> - 	$(MAKE) -C examples clean
> -
> - .PHONY: install
> -@@ -30,5 +28,4 @@ install:
> - 	install include/tinyalsa/version.h $(DESTDIR)$(INCDIR)/
> - 	$(MAKE) -C src install
> - 	$(MAKE) -C utils install
> --	$(MAKE) -C doxygen install
> -
> diff --git a/package/tinyalsa/0002-interval.h-add-missing-header.patch b/package/tinyalsa/0002-interval.h-add-missing-header.patch
> deleted file mode 100644
> index c043145b55..0000000000
> --- a/package/tinyalsa/0002-interval.h-add-missing-header.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 685e530d8a0063134642371eaacd01fee2f62d85 Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Fri, 2 Jun 2017 12:19:03 +0300
> -Subject: [PATCH] interval.h: add missing header
> -
> -The ssize_t type requires the unistd.h header. This fixes build with musl
> -libc:
> -
> -In file included from ../include/tinyalsa/limits.h:32:0,
> -                 from limits.c:1:
> -../include/tinyalsa/interval.h:38:2: error: unknown type name 'ssize_t'
> -  ssize_t max;
> -  ^
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: https://github.com/tinyalsa/tinyalsa/pull/98
> -
> - include/tinyalsa/interval.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/tinyalsa/interval.h b/include/tinyalsa/interval.h
> -index 3f6f3dce5d90..068571df5a63 100644
> ---- a/include/tinyalsa/interval.h
> -+++ b/include/tinyalsa/interval.h
> -@@ -30,6 +30,7 @@
> - #define TINYALSA_INTERVAL_H
> -
> - #include <stdlib.h>
> -+#include <unistd.h>
> -
> - /** A closed range signed interval. */
> -
> ---
> -2.11.0
> -
> diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
> index d078bab597..f7673b1769 100644
> --- a/package/tinyalsa/tinyalsa.hash
> +++ b/package/tinyalsa/tinyalsa.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
> -sha256  ca2b89a68c33fba3c8bcaec96f32907e2ede0eb33688ae61d29ec49732158f6d  NOTICE
> +sha256  573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1  tinyalsa-2.0.0.tar.gz
> +sha256  ea22a4711f5250f88a4d7011fbc65367d1b02ac954dcc49f5b6d7c135e6537c4  NOTICE
> diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
> index bd9d9a00d0..b5c39e35d6 100644
> --- a/package/tinyalsa/tinyalsa.mk
> +++ b/package/tinyalsa/tinyalsa.mk
> @@ -4,30 +4,11 @@
>   #
>   ################################################################################
>   
> -TINYALSA_VERSION = 1.1.1
> -TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
> +TINYALSA_VERSION = 2.0.0
> +TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
>   TINYALSA_LICENSE = BSD-3-Clause
>   TINYALSA_LICENSE_FILES = NOTICE
>   TINYALSA_INSTALL_STAGING = YES
> +TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled -Dutils=disabled
>   
> -define TINYALSA_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
> -endef
> -
> -define TINYALSA_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) \
> -		-C $(@D) \
> -		PREFIX="/usr" \
> -		CROSS_COMPILE="$(TARGET_CROSS)" \
> -		DESTDIR="$(STAGING_DIR)" install
> -endef
> -
> -define TINYALSA_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) \
> -		-C $(@D) \
> -		PREFIX="/usr" \
> -		CROSS_COMPILE="$(TARGET_CROSS)" \
> -		DESTDIR="$(TARGET_DIR)" install
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
