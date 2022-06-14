Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A7C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D716068A;
	Tue, 14 Jun 2022 18:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fjqfc04D0ASL; Tue, 14 Jun 2022 18:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 186E360E70;
	Tue, 14 Jun 2022 18:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4906A1BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3899782FB1
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ix77683mJ7hf for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A4082FAE
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:47:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cn20so491435edb.6
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hh6vjdK0ynSoO/+YtVQAGIARIAc7IkCMWcHfWAKN5CU=;
 b=gXBqxmPpNxei1iHGKlDhQ50+NpRXSVKcWj+DcIh0MlGYOxsXy3QaHMwI0UJynkC9x2
 Dwx8H5tyOwE7M+dVfE+2SLpEpcKrzGAzX4fSHjIKtKGnmvedg7k5eWe5uXZ0Iv9Ke0ML
 OVdknHjGZb/lybngvtHJz+wvkran/KRoQ1UhApQV5oUf4uwqMo3t7dg9mDZPUjkuBhqm
 hGGAtdiPg5k4m7nSLSHyX+qXSqr+rU691GzdUG4Skz40+aYNLvdWvoNxpx2KAsvMfXjv
 53uuXjLOEJlg8K9/BlijP+Z30mUsFgwKzL/zucdjJrZPfDHNbeSGd8Dyaz1VeIkQ+z8u
 Cs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hh6vjdK0ynSoO/+YtVQAGIARIAc7IkCMWcHfWAKN5CU=;
 b=i/zQnXKvo4FZo/bdlRZi4x1u7j7GlQ8t1t36IOynbcXxWtjjtVMTvaKfaJiZ88ghfn
 l7tg3Nn60fb7jztOCOl4Yk1qE6O4jneVYAJzOGMlQ1wS6/7SbJyT6ginTU3aT+gZsAgg
 cU05+IzYLQQ096+MbVPusviK+5rGMd6TMLda9Wm9apxge/oQqlmjOz/ForU1qH7wYo/A
 sbaJN/oAbtFzIzs3zSlIySuXlH2n67O9mZWJzM5Sr7C5Y4Usn8SohxtN16fd57MXajbG
 3ygv52TYpPuksX+aSIc1HoSQgxymC4abJ0BP2uaKHH5IgPYYq2LydpZkhC1Zk8n57oht
 r+Kg==
X-Gm-Message-State: AJIora9aOefA7E17yyplVXo7E+627e+2IZSb8A68uQfC0fqfpGeWNXwO
 SvCQJ4ZLtlEQuw8UZOQ5Lvd2hw==
X-Google-Smtp-Source: ABdhPJx0OJi6kkmz2mJkmBjuV2mCE8PZuO3cfcFsknaj3B0wBwH9HcENUuseu9VVZUt+gbZTs5JzFQ==
X-Received: by 2002:a05:6402:3484:b0:42e:1f3b:4a4c with SMTP id
 v4-20020a056402348400b0042e1f3b4a4cmr7595262edc.326.1655232442746; 
 Tue, 14 Jun 2022 11:47:22 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fw37-20020a170907502500b0071579abcf3csm4182436ejc.111.2022.06.14.11.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:47:22 -0700 (PDT)
Message-ID: <e5057a67-610d-993f-6d67-6a4ec4ebae68@mind.be>
Date: Tue, 14 Jun 2022 20:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220611170118.1055111-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611170118.1055111-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/minetest{-game}: bump to version
 5.5.1
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



On 11/06/2022 19:01, Romain Naour wrote:
> Release announcement:
> 5.5.0: https://forum.minetest.net/viewtopic.php?f=18&t=27754
> 5.1.1: https://forum.minetest.net/viewtopic.php?p=410344#p410344
> 
> Back in 2021, the minetest project forked the irrlicht library due to
> lack of upstream release [1]. But the irrlicht upstream project is not
> really halted since a stable 1.8.5 version has been released [2] and
> there is still svn activity.
> 
> But the Mintest fork (called irrlichtMt) is attractive since:
>    - It use a CMake build system instead of hand written makefiles [3]
>    - Bundled libraries has been removed [4] [5]
>    - It allows to remove the NEON support workaround for bundled libpng
>    - It use git as VCS
>    - Improve the licensing information
> 
> This irrlichtmt is required since mintest 5.5.0 version but contains
> several changes specific to Minetest, so add irrlichtmt as additional
> sources using EXTRA_DOWNLOADS.
> 
> minetest:
> - Add zstd dependency for MapBlock compression [6]
> - Freetype is now a build requirement for mintest client [7]
> - gcc >= 5.x is now required [8]
> - remove upstream patch [9]
> 
> minetest-game:
> - Add new license files:
>      mods/keys/license.txt
>      mods/mtg_craftguide/license.txt
>      mods/weather/license.txt
> 
> [1] https://forum.minetest.net/viewtopic.php?p=393565
> [2] https://irrlicht.sourceforge.io/forum/viewtopic.php?f=2&t=52775
> [3] https://github.com/minetest/irrlicht/commit/6ce98dce7789c96dded00fabfe409356f954edfe
> [4] https://github.com/minetest/irrlicht/commit/67f1402410a5b90f11c2a2bd69ba5d73eb6e943a
> [5] https://github.com/minetest/irrlicht/commit/264f8b72c1dce7c209ac8daaf0484aa3af7740b7
> [6] https://github.com/minetest/minetest/commit/d1624a552151bcb152b7abf63df6501b63458d78
> [7] https://github.com/minetest/minetest/commit/76dbd0d2d04712dcad4f7c6afecb97fa8d662d6d
> [8] https://github.com/minetest/minetest/commit/a90b2a4d4f38e92b4016d9ac86e001398be729e7
> [9] https://github.com/minetest/minetest/commit/7c2826cbc0f36027d4a9781f433150d1c5d0d03f
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

[snip]
> diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
> index 7eb57cb2a9..e78f865969 100644
> --- a/package/minetest/minetest.hash
> +++ b/package/minetest/minetest.hash
> @@ -1,4 +1,6 @@
>   # Locally calculated
> -sha256  de9e4410583c845c104b4be25f9d0b8743d8573c120149b8910ae2519f9ab14e  minetest-5.4.1.tar.gz
> +sha256  dc0ae5188ef351db85c38b27f38f8549b133ed82aa46daea6deee148aa3454f4  minetest-5.5.1.tar.gz
> +sha256  6d38dd7f3e3c8d768e1f5776b98dd5359b184c2e6740ddf733f4dc8615191bef  irrlicht-1.9.0mt5.tar.gz
>   
> -sha256  5bc4bb4ff369d5039bcfff5a83a378335240ca86c58299e7de25097153c70132  LICENSE.txt
> +sha256  d1d8a63f7f70d89a3a899f3b9fb5ca1ea7dbbd4eb449be2a7b2ff861b1f09192  LICENSE.txt

  I haven't double-checked why the license hash changed, and it's not clearly 
explained in the commit message, but I trust you verified it.

  Regards,
  Arnout

> +sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  lib/irrlichtmt/doc/irrlicht-license.txt
> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
> index e046ec2851..00173754c0 100644
> --- a/package/minetest/minetest.mk
> +++ b/package/minetest/minetest.mk
> @@ -4,12 +4,26 @@
>   #
>   ################################################################################
>   
> -MINETEST_VERSION = 5.4.1
> +MINETEST_VERSION = 5.5.1
>   MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
> -MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
> -MINETEST_LICENSE_FILES = LICENSE.txt
> +MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
> +MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
>   
> -MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
> +MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
> +
> +MINETEST_IRRLICHTMT_VERSION = 1.9.0mt5
> +MINETEST_EXTRA_DOWNLOADS = $(call github,minetest,irrlicht,$(MINETEST_IRRLICHTMT_VERSION))/irrlicht-$(MINETEST_IRRLICHTMT_VERSION).tar.gz
> +
> +define MINETEST_IRRLICHTMT_EXTRACT
> +	mkdir -p $(@D)/lib
> +	$(foreach f, $(notdir $(MINETEST_EXTRA_DOWNLOADS)), \
> +		$(call suitable-extractor,$(f)) $(MINETEST_DL_DIR)/$(f) | \
> +			$(TAR) -C $(@D)/lib $(TAR_OPTIONS) -
> +	)
> +	cd $(@D)/lib; \
> +		ln -sf irrlicht-$(MINETEST_IRRLICHTMT_VERSION) irrlichtmt
> +endef
> +MINETEST_POST_EXTRACT_HOOKS += MINETEST_IRRLICHTMT_EXTRACT
>   
>   MINETEST_CONF_OPTS = \
>   	-DDEFAULT_RUN_IN_PLACE=OFF \
> @@ -22,7 +36,7 @@ MINETEST_CONF_OPTS = \
>   	-DBUILD_UNITTESTS=OFF
>   
>   ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
> -MINETEST_DEPENDENCIES += bzip2 jpeg libgl libpng xlib_libXxf86vm
> +MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXxf86vm
>   MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
>   else
>   MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
> @@ -41,13 +55,6 @@ else
>   MINETEST_CONF_OPTS += -DENABLE_SOUND=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_FREETYPE),y)
> -MINETEST_DEPENDENCIES += freetype
> -MINETEST_CONF_OPTS += -DENABLE_FREETYPE=ON
> -else
> -MINETEST_CONF_OPTS += -DENABLE_FREETYPE=OFF
> -endif
> -
>   ifeq ($(BR2_PACKAGE_HIREDIS),y)
>   MINETEST_DEPENDENCIES += hiredis
>   MINETEST_CONF_OPTS += -DENABLE_REDIS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
