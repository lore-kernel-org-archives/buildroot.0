Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A22C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5235941938;
	Tue, 29 Mar 2022 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrzTklIgSt9r; Tue, 29 Mar 2022 19:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D8241927;
	Tue, 29 Mar 2022 19:17:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F28EB1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAEB141927
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mego26_foOvO for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9236C41916
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:17:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id f10so8177286plr.6
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mbQjxcRP3uf4QnqRbbQa0ozG+NnFTH0da7dh60ngqLQ=;
 b=FnfAkPO76pwgLQh8lKqLjbHXwLpT5nLlj6Zj2VlLyZaG54iUMbwB1Mprrgr3G67kCp
 ZRUfBCk97brV59bvve4fpQ8CKZtEJWf1wVvlas2pUgjiuitypa2hE79pHzZaAQjy1+De
 7r4YJB6Nws/NVtZhRB+cmh7/WMZjhusthDaHv2eDxrRbPsp23mqx7uUjcxcKMu1TPv7+
 OeaFGonfBe3pSBsr8XXVfHxi4TvCITVaMQqYlXlia9pV06h2yfkjDnOR5zcCo88CcUu2
 jpJjaS0w/qkqahx0iS6OcZlLHvnB3UlzNihMjB5wXAyfvgNLUTSwaTOozLTWRkWvRnyr
 q5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mbQjxcRP3uf4QnqRbbQa0ozG+NnFTH0da7dh60ngqLQ=;
 b=hwpHS9MGVk31hxTQBl7A0B/LjUu03wocXLUI2nBmd1yX8HS8ycbxaZFHXBbRwUvAc8
 DJ5o43kILBMuFiBB4UE1x4b45aYMEedEE59QyTcB1JiUImr6xUJ2DDRTqDoztrc4lmP/
 nv+5Ab+eQbHW/hGY8YqvIot5CVh1GcbFBIMS/Yo/sHfYWw9+CBQ/KLqNWihvmemqGKJ8
 TM8bZ1SDLKWafD733KHYCqc5JoLsG4ueHIId3Sz6U/M0sb2ncyPiGonIi347Gx3MatsA
 OpTjdW44JPkGDR4lujUCYfVrDTguhrO3LoLYk0y+S22jU69CLu+T/1oaoF19huh74rIa
 wWlw==
X-Gm-Message-State: AOAM532TXFPyNkskk6ELL/HlcaRRb/LHqPXWS2REOCP4AJTyFqX/8+A0
 EdsDKSMe/G/RQtVHRg+pAuEUYqCG1olksA==
X-Google-Smtp-Source: ABdhPJxW2azmvVib8djPn+UIRbRkexuthtjzxgz8WOT02hBzHDduJhlFon0BjA+EJ5xt/FynKU+d1Q==
X-Received: by 2002:a17:902:eb88:b0:155:e31f:95fb with SMTP id
 q8-20020a170902eb8800b00155e31f95fbmr20357204plg.71.1648581472463; 
 Tue, 29 Mar 2022 12:17:52 -0700 (PDT)
Received: from smtpclient.apple ([2806:1000:8003:5c6c:78d4:5f4f:bbd6:8f9a])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a17090a0ac800b001c9e35d3a3asm1527683pje.24.2022.03.29.12.17.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 12:17:51 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
In-Reply-To: <20220329185059.943889-1-alseycmiller@gmail.com>
Date: Tue, 29 Mar 2022 12:17:50 -0700
Message-Id: <A770A102-397D-4194-B7CA-FA413C944812@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-cmake: allow overriding
 toolchain
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
Cc: s.martin49@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This change is necessary because if you specify the toolchain it will always use the GCC toolchain and C flags instead of the Clang cross compiler  and custom C flags. This is not an issue for host packages, only for target. 

> On Mar 29, 2022, at 11:50 AM, Alsey Coleman Miller <alseycmiller@gmail.com> wrote:
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
> package/pkg-cmake.mk | 25 ++++++++++++++++++++++++-
> 1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 3b1db35fb6..9b36ee2b47 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -57,7 +57,7 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
> 
> $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> -
> +$(3)_SUPPORTS_CMAKE_TOOLCHAIN ?= YES
> 
> ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> $(2)_BUILDDIR			= $$($(2)_SRCDIR)
> @@ -82,6 +82,7 @@ ifeq ($(4),target)
> #   documented as a standard CMake variable. If a package supports it,
> #   it must handle it explicitly.
> #
> +ifeq ($(3)_SUPPORTS_CMAKE_TOOLCHAIN),YES)
> define $(2)_CONFIGURE_CMDS
> 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> 	cd $$($$(PKG)_BUILDDIR) && \
> @@ -104,6 +105,28 @@ define $(2)_CONFIGURE_CMDS
> 	)
> endef
> else
> +define $(2)_CONFIGURE_CMDS
> +	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> +	cd $$($$(PKG)_BUILDDIR) && \
> +	rm -f CMakeCache.txt && \
> +	PATH=$$(BR_PATH) \
> +	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +		-DCMAKE_INSTALL_PREFIX="/usr" \
> +		-DCMAKE_COLOR_MAKEFILE=OFF \
> +		-DBUILD_DOC=OFF \
> +		-DBUILD_DOCS=OFF \
> +		-DBUILD_EXAMPLE=OFF \
> +		-DBUILD_EXAMPLES=OFF \
> +		-DBUILD_TEST=OFF \
> +		-DBUILD_TESTS=OFF \
> +		-DBUILD_TESTING=OFF \
> +		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
> +		$$(CMAKE_QUIET) \
> +		$$($$(PKG)_CONF_OPTS) \
> +	)
> +endef
> +endif
> +else
> 
> # Configure package for host
> define $(2)_CONFIGURE_CMDS
> -- 
> 2.35.1
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
