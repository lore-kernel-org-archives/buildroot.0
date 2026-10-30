Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62127606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=No+hWPf5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4088E40BBA;
	Fri, 30 Oct 2026 15:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3Ls68iriq5a; Fri, 30 Oct 2026 15:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 608DF40BAC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373959;
	b=LlEqMM7BYAUjCk/yNjncIRhQAvsu4F3y54uqf6zHhmoxx5Q9hrcBTk6SOdXFxEBDcivY
	 ndglKS2e9dxJVnrWgC7Ug9wBSMHJNgBcpL8nl51Mkj6NfOqdCFTMQ4apm16KsPr7O0yVy
	 uBZM/3+9P0ZtQephBTFzmGxlialT9ugSVtc3ZyxElGYLK3vmoiK7zrsKohyx7HSk6eZQw
	 52TrumEqpuyHv9eoe5HcdhMQBqltUqqcC4ljSmql0fWWVOlFBkyYTmaeck2lSNG2Hh2jJ
	 FtdVhYNy5+lod6da8oKqEwVTpZz8nfTTMCmZDWJX8K6MeicpCb2rPyzLeFjcH7H0exA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WdaaUySSP6SZ27cjJ/4c/nse4vEHaIHwEjoGPOfI0+8=;
	b=M/R1hs3pfKuf5yglgshU8jGPIAVfXoQRZmeS17Ch43DWFCYspAXiqZ3zBFU5t595rsBk
	 UffgsNzOqPLdhUX7eeDfMvgp0DCvfa1mFFGlB0287h++9a3xflxgrLvkGddrVMEIEHVd5
	 cleQJRpyldOzepdnjgLuLlo/gTUIdPK30nFtG+gHJZ9+1aDVnYx3HHNCZfu7ucOsuaH53
	 +9Ny/elfVMHyedcETA6FpNTvIgmXV2A5k0zOWsnI4OZ7TzsdQnQxPSJPA9IzHCDZsfflc
	 ZeR171x/h/510sElDnI+3RiZdnjzWcqT8y1YMMwHeu3NsRWB8pqoyXBJ2Xg+7DctGPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373959;
	bh=WdaaUySSP6SZ27cjJ/4c/nse4vEHaIHwEjoGPOfI0+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=No+hWPf5JhV24r6N6ynH89k1OvRIqBLPO/rD6w839I6W6hGsLRwA9D73Q4EPUcX0m
	 s1xiwRaBXPArRVJrXmffhaPAk5+zNPnrqtsDKyKLQ49ZZkvMNq9ikHPcl203wK/mYC
	 fYKTuPwzs6gTnuX/JnQoB4OfV2dhCPzolCDUhq/SwbsWqb20Iwu1WR6yLq308JyLaz
	 IPeV0muziAT25QW7B1QCg1auoA9u7SG2YxJse+w/IwCqsMQUHkVtnFTfJuO+qrg+vv
	 7UoX094d+RDn8GsG+wSLzznKs7MAz6HYOkWbOMqyduOIkZnpLmjQvkkZph7hej39if
	 5qscMVooztFrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 608DF40BAC;
	Fri, 30 Oct 2026 15:25:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A003AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF36440B85
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9_nns465rxn for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 593B940B4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373952;
 b=fz9/HYMOlRhT+I8IZb2YHZdRnpZuHO/xhZYGrq9wOawfszbOiRH9lWqzqvh28XxWvt0C
 BtcnXJ0B/D4Eop0gLbCdtSetHdAgjxDIjURbyr4ABivQ1E9xF05YQbqvoBA0zm30jC+ZW
 FO+gBIfT+JWXKbdh7p+hkJ/oeLfqzAXIS8nMowLZHbQNSbDDONCfXGFctVhWXjDPvNzlc
 1Hm67lLd5jKD5ywWuwWDTAIZufXq9awLjxp8zZOcsj0HQ76ZsX9NsbIGXRRgtKQxHKZNB
 xbxk0rPTphOf51nY+mliECvmUhU7hYEarXdb8JlZxWbJIoAfAW5hF1JaFUCoYENlKSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373952;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Jabj1md4zOywu907ZbqDrM7rX8KqSUTp9N1Of/ermOA=;
 b=kH8uMKPz42lszkB1rPu7sPhfX6w6Yet4AlHEk/sQ93zSM1lHF24jNcMhd1s/Y9kpAi+x
 TY/kQV1TF4r4jnohruBVpUVp0cUXabk/7k6PI7pYAHA4q7vCHjoreOeEuUbPvl3lIUFNp
 IfMfif9OYu9ZL64gDAO2BefszGCE5+0NWWbcRuya5L8MdOIgO/zBtrUdsWpmc9L14ZHri
 H/BDyXkpvJd3xqfipAJPscNsrDU5PwaNHnssP+7ROKjZrG2XBRUCRnoVyBeIEdaBP1SyX
 WRiOLXASr/DGGZPaRDIHGmJriANFyQFphVhmmGQEGchQAiAZC1w4RkfGBSQYpezWI3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=G4Gk7vRb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 593B940B4D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so10433405e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373950; x=1793978750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jabj1md4zOywu907ZbqDrM7rX8KqSUTp9N1Of/ermOA=;
 b=1/hkxKf8bNKFjhTfTuXSMttgGBhjYNCCzsq9XU05MqZktoE7Pk5ji2YAUXfLpyS3PA
 WyjwZzFfii+R5R24QNbJk+O+cFWMOp5zhuSuKdR2PXu5O4i6UjUwO27yvC1keAcv8GMD
 Sxg/ER7k9yGT/Uq/XFWageHXlDlNBSkZ5B+wxcyGpWbxP04YFV28LNfvA4/24FK6QVu2
 bIgyIhcgZjjA3mpvrsfpVMro4UewgXSy7xzQcCHpNSelXnNJ0dDhgikjjEcB+n6EROTi
 v385hoJCwXDPyNT1L2LBfB24WLLmQ8k3E2EBCZsuuhrNjAsJCvTnf6xyVDIoH/Yptjg6
 rgOQ==
X-Gm-Message-State: AFq9FYJ4E8AUuubvTpFamAmfK1Ln24zGemP2hns2ca8yETVQ9nATvfsg
 +u/nDLxTleGtYc0yzRX7CcTtMQ7wiJ0tgodH32PwlJkyxQGu1DWR9kGDyBxfKsj9R51Nlj4xI0h
 t4o6Wpcc=
X-Gm-Gg: AYBFou2uFbyln5IEWh5SHG1Zy0iG5TWVA8P8x8R8s1ZRWtWHpQ2Xd/RALldGLz5bCiC
 ykv0dSmDZzHco4ritqCkiYHVNJCN0071oPXUd3CZslcpioyJb1bfmrMECQr7n9jWluH1/hG8y9n
 PE+hQE1PillQQcwUoNuc9zetVnkRf3iSykGFDLSp9a9NNAswk3xtuwmvz2p4ZL+Vcs6e/jhFjbx
 jok0+CgXZVnz9fmtr9BR8T0H/I0rAzv7fDL8ySVboxQ2/xDGhcWHPoliPf1Vc90XIm+qHrewVym
 Hnt37wfzr3MUYGtre+G/iUIaZf0XZlPyr9+65i6P5kfTL/nBOKFna2uQWItjEO3EYRu+dujULMl
 3RpIAz8a5k8c9xtOYoT+HEQHgiIo5vsINFW1xGxPgH/dKmu7XFmCnu3FCPDV++Jl0jm6RG2ByGc
 DapZfOp6j334ct1SoLzmgcjVUffB5a5FXUu0Q7CstpB0eFoEYDwxyYSENWP2CGvygRNJs+1I2Vx
 PYxKVpGTqjTNZjmIvep0Lv+8KkliaJSHkKf7HXgPtO8iajLdJ6ENEYsxIWFywjIXt3/lTjzynmE
 7Iucd1+bC2b9DKmwlIPVTJ2Zc/K8m0RtidaNCmdMQB7Z/XVK6moLGWp+NvRvgapdumkcMMMn
X-Received: by 2002:a05:600c:4188:b0:4a2:d80:a044 with SMTP id
 5b1f17b1804b1-4aa8a7ac714mr102273235e9.8.1793373950095; 
 Fri, 30 Oct 2026 08:25:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b723cdsm3801511f8f.12.2026.10.30.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:47 +0100
Message-ID: <20261030152549.1905776-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719125334.1772882-2-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libepoxy: needs threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
> dependencies to gl/egl which revealed that libepoxy needs a toolchain
> with threads:
> 
> ../src/dispatch_common.c:168:10: fatal error: pthread.h:
>  No such file or directory
>   168 | #include <pthread.h>
> 
> Fixes:
> https://autobuild.buildroot.net/results/dc2/dc27a008af73c7676e4f54e4846d87f9d5aef98e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/434f04d604de12c7a4dcad4a605b0c5219d7319c
> 
>  package/libcamera-apps/Config.in | 2 +-
>  package/libepoxy/Config.in       | 5 +++--
>  package/libfm/Config.in          | 2 +-
>  package/libgtk3/Config.in        | 2 +-
>  package/libgtk4/Config.in        | 2 +-
>  package/menu-cache/Config.in     | 2 +-
>  package/pcmanfm/Config.in        | 2 +-
>  package/wpebackend-fdo/Config.in | 2 +-
>  package/xscreensaver/Config.in   | 2 +-
>  9 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index a7f37e3e52..3c3ac7eaf6 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>  	bool "libcamera-apps"
>  	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
>  	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost, libepoxy
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
>  	depends on !BR2_STATIC_LIBS # gnutls/libcamera, libepoxy
>  	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
> index 269b43be85..6ff0c6072f 100644
> --- a/package/libepoxy/Config.in
> +++ b/package/libepoxy/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "libepoxy"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>  	help
> @@ -12,5 +13,5 @@ config BR2_PACKAGE_LIBEPOXY
>  
>  	  https://github.com/anholt/libepoxy
>  
> -comment "libepoxy needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "libepoxy needs a toolchain w/ dynamic library, threads"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libfm/Config.in b/package/libfm/Config.in
> index e4d6528db5..abb35ca3dd 100644
> --- a/package/libfm/Config.in
> +++ b/package/libfm/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBFM
>  	bool "libfm"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
>  	depends on BR2_USE_WCHAR # libgtk3, libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
>  	depends on BR2_USE_MMU # libgtk3, libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
>  	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index 7717afdac2..9715254ea8 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBGTK3
>  	bool "libgtk3"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
>  	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libepoxy
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on !BR2_STATIC_LIBS # libepoxy
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index 958742ae43..c1f3928b8a 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBGTK4
>  	bool "libgtk4"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
>  	depends on BR2_USE_WCHAR # glib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
>  	depends on !BR2_STATIC_LIBS # libepoxy
> diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
> index 3e7137c7a8..a84f807625 100644
> --- a/package/menu-cache/Config.in
> +++ b/package/menu-cache/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_MENU_CACHE
>  	bool "menu-cache"
>  	depends on BR2_USE_WCHAR # libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2
>  	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
>  	depends on BR2_USE_MMU # libglib2
>  	select BR2_PACKAGE_LIBGLIB2
> diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
> index 7e411b22ac..5250176c1f 100644
> --- a/package/pcmanfm/Config.in
> +++ b/package/pcmanfm/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_PCMANFM
>  	bool "pcmanfm"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
>  	depends on BR2_USE_WCHAR # libfm
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libfm
>  	depends on BR2_USE_MMU # libfm
>  	depends on BR2_INSTALL_LIBSTDCPP # libfm
>  	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> index 0e59b8df1a..5dfbf678b6 100644
> --- a/package/wpebackend-fdo/Config.in
> +++ b/package/wpebackend-fdo/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
>  	bool "wpebackend-fdo"
>  	depends on !BR2_STATIC_LIBS # libepoxy, wayland
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2, wayland
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> index 80fb1550f3..5763f12601 100644
> --- a/package/xscreensaver/Config.in
> +++ b/package/xscreensaver/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_XSCREENSAVER
>  	depends on BR2_PACKAGE_HAS_LIBGL # libglu
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
>  	depends on BR2_USE_WCHAR # libgtk3, libglib2
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
>  	depends on BR2_USE_MMU # libgtk3, libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
>  	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
