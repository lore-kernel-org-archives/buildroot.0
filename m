Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FACC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6305415F1;
	Wed, 15 Mar 2023 09:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6305415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTe3fes_7gj2; Wed, 15 Mar 2023 09:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896F241714;
	Wed, 15 Mar 2023 09:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896F241714
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E93F81BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C29AD60B6E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C29AD60B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbcwB7-5T3Oo for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:15:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CFDB60A81
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CFDB60A81
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 09:15:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i9so7604186wrp.3
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 02:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CKgWh0DPhbKfk0Hq5T21cjyhvyxZcwS0qyi3U4/H+OE=;
 b=tSbve+bmOuHh3d6rpgWpFGjYd70Gp6NA8urvgXn1FUZgN8IYvAZfp3F8enRLyU14TJ
 PItTT+/G1BllS3JguMhakgOH/2K28zO+7f32+dI/2HNdJYWtbyBOrhSyBHnC4sl38w5T
 QJqxjS2WL25eK5A0TPcU+BO3Bn+mUFXuN/4Y7inc0IJb2Yvp43cZVAKkEUQ2VPqxyZlq
 HICzwS2pu90O2/q6BQc5Oo85yz9rCNDYICfizE1OWmP6olndFcAWPv8ZHhi6pNbMjE6S
 xUEXJ72wptA+3KPHqt8bPVIpdv4X33QDUFZEKPAU/CpBgoinH5H+Bvhn8ztxzBGN3b5R
 ORPg==
X-Gm-Message-State: AO0yUKWAXKa3dxY2TTmqqK48Vh/DVS0TTqCTye58Oyx4yo/wTHeN7u2f
 FoYrhFyFbt8a+jXLGdAjV1DiXw==
X-Google-Smtp-Source: AK7set8xj+XQBch0SKSmCijj0aqe92ilYidloHCnrrHBHuz5rH4aTfYynBmBJVjM73pVdBuiYc+9Sg==
X-Received: by 2002:a5d:644b:0:b0:2c7:1e16:57cf with SMTP id
 d11-20020a5d644b000000b002c71e1657cfmr1357614wrw.67.1678871723436; 
 Wed, 15 Mar 2023 02:15:23 -0700 (PDT)
Received: from [10.5.2.223]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d4d0d000000b002cfe1377fb1sm4010643wrt.70.2023.03.15.02.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:15:23 -0700 (PDT)
Message-ID: <68ca2145-8902-ca9a-d2a5-e46ef99b06e8@smile.fr>
Date: Wed, 15 Mar 2023 10:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
 <20230314134058.73f5f35d@windsurf>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
In-Reply-To: <20230314134058.73f5f35d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678871723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CKgWh0DPhbKfk0Hq5T21cjyhvyxZcwS0qyi3U4/H+OE=;
 b=O1Hb2yeY1e8ovN9WSGANl21CX1rWWMMY4U3NgMmgtEAcR/iA53FMBv/19/7ecfZEJL
 XM0Tt8+eZ25T6VIDIyFTwj+jIDxorTa/JDicC2xX4QRSaxWdF8772sp+RAkLvBgDcZwO
 2psRvijRDaUR1+EYFKuE28Rk068SHnfv3awnDFRC/8Waw96OxXPy7IxlLn6vhKaW4GSc
 OmHtMi0Kbnh5qvNOlP7TppAc9UcO47yQ90UL5CSL+VPmFHYIRbP+CcEei4BUjppDVdzK
 JVvlMOdnAMMJynH2pleODTKNDpGaJgsh7enOHUu5F2R3IXk+AKPO13754Co/HMqHSxlh
 KPeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=O1Hb2yeY
Subject: Re: [Buildroot] [PATCH 1/4] package/uutils-coreutils: new package
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
Cc: Sebastian Weyer <sebatian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> It would be good to add the upstream status of this patch here. Was it
> sent upstream? If so, a link?

I created the patch myself. Since I removed a dependency in the project's
Makefile, I assume it would be hard to upstream and rejected by the maintainers.

> We like to have a blank line followed by the URL of the project
> homepage, at the end of the Config.in help text.

Alright

> Nit: space after #

Done. Wouldn't it be good to have check-package pick that up in that case?

> We also need a hash for the license file.

I forgot about that

> There is no dependency on host-rustc ? How can the rust compiler be
> available prior to building this package then ?

You're correct. Initially I created it as a cargo-package and therefore the
host-rustc dependency was implicit. When changing it to a generic-package I
forgot to add it again.

> Is PREFIX= needed at build time ?

It isn't, I should've put more thought into that. I changed it to how you
suggested it now.

Best regards,
Sebastian


On 14/03/2023 13:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Mar 2023 13:15:03 +0100
> Sebastian Weyer <sebastian.weyer@smile.fr> wrote:
> 
>> This package is an implementation of coreutils written completely in rust.
>>
>> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> Thanks for working on this!
> 
> 
>> diff --git a/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
>> new file mode 100644
>> index 0000000000..0540d9becb
>> --- /dev/null
>> +++ b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
>> @@ -0,0 +1,29 @@
>> +From cbec6b8ee3c4418f8f04760678ec655f05e79220 Mon Sep 17 00:00:00 2001
>> +From: Sebastian Weyer <sebastian.weyer@smile.fr>
>> +Date: Fri, 10 Mar 2023 10:52:00 +0100
>> +Subject: [PATCH] GNUMakefile: remove dependency on build during install
>> +
>> +When we call install we already built the application so we don't want
>> +to have to rebuild
>> +
>> +Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> It would be good to add the upstream status of this patch here. Was it
> sent upstream? If so, a link?
> 
> 
>> diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
>> new file mode 100644
>> index 0000000000..76ce5b174d
>> --- /dev/null
>> +++ b/package/uutils-coreutils/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_UUTILS_COREUTILS
>> +	bool "uutils-coreutils"
>> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>> +	help
>> +	  uutils is an attempt at writing universal (as in
>> +	  cross-platform) CLI utilities in Rust. While all programs have
>> +	  been implemented, some options might be missing or different
>> +	  behavior might be experienced.
> 
> We like to have a blank line followed by the URL of the project
> homepage, at the end of the Config.in help text.
> 
>> diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
>> new file mode 100644
>> index 0000000000..b4855222fd
>> --- /dev/null
>> +++ b/package/uutils-coreutils/uutils-coreutils.hash
>> @@ -0,0 +1,2 @@
>> +#Locally generated
> 
> Nit: space after #
> 
>> +sha256  5bc773bcbc66851aa17979df44224c66c0b5323044c3c9cefb925b44ee9cd81b  uutils-coreutils-0.0.17.tar.gz
> 
> We also need a hash for the license file.
> 
>> diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
>> new file mode 100644
>> index 0000000000..37a647a1f0
>> --- /dev/null
>> +++ b/package/uutils-coreutils/uutils-coreutils.mk
>> @@ -0,0 +1,23 @@
>> +################################################################################
>> +#
>> +# uutils-coreutils
>> +#
>> +################################################################################
>> +
>> +UUTILS_COREUTILS_VERSION = 0.0.17
>> +UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
>> +UUTILS_COREUTILS_LICENSE = MIT
>> +UUTILS_COREUTILS_LICENSE_FILES = LICENSE
> 
> There is no dependency on host-rustc ? How can the rust compiler be
> available prior to building this package then ?
> 
>> +UUTILS_COREUTILS_BUILD_OPTS = PROFILE=release MULTICALL=y PREFIX=$(TARGET_DIR)
>> +UUTILS_COREUTILS_INSTALL_OPTS = $(UUTILS_COREUTILS_BUILD_OPTS) install
> 
> Is PREFIX= needed at build time ?
> 
>> +
>> +define UUTILS_COREUTILS_BUILD_CMDS
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(UUTILS_COREUTILS_BUILD_OPTS) -C $(@D)
>> +endef
>> +
>> +define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
>> +	$(TARGET_ENV) $(MAKE) $(UUTILS_COREUTILS_INSTALL_OPTS) -C $(@D)
> 
> I think we will prefer to not have BUILD_OPTS/INSTALL_OPTS but instead:
> 
> UUTILS_COREUTILS_MAKE_OPTS = \
> 	PROFILE=release \
> 	MULTICALL=y
> 
> define UUTILS_COREUTILS_BUILD_CMDS
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> 		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D)
> endef
> 
> define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
> 	$(TARGET_MAKE_ENV) $(MAKE) \
> 		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D) \
> 		PREFIX=$(TARGET_DIR) install
> endef
> 
> (assuming PREFIX= is only needed at install time)
> 
> It does the same, but the above suggestion is a bit more idiomatic in
> Buildroot.
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
