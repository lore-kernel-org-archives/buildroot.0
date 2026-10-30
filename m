Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23497606A327
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i1kbd3sj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04BF340B51;
	Fri, 30 Oct 2026 15:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2_54yZ2Iqaa; Fri, 30 Oct 2026 15:25:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80B7F40B83
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373953;
	b=jkIAljanbP+2nsCdWjtcI69Erdr5i2ipgqWctidSA32KSbNFa1OxgzhjuQuWY76IT2ih
	 ebjvdUkyvI59YcBICY+453OpIRlmfynWG9345rHhf7hiGNPuHqL85JGtKPWCVaU/HhgjF
	 YyoY8pQFS5EIQ6jJABHxKXTQ6E+XrONpEcoJmnd3jLJuHwDpss86Hg6lMpQZmPnzqE+D3
	 FvnXjTcGb9XkojgGlZOtPivasx7rB3XJb95EUiszBulxZGvxAuchoWC8lp9abqO9C6pUT
	 xHPVBlQ6cAMSGnZ2eE5dbM18/l4l0EXRFLWk3tt+6viDGeGtAXanyfvwCpMCPHkU9Yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=frVGTbVmg2oVefUW6o8X5dCFvP12fykQYePKVgWUp10=;
	b=Y0yTHLb2f4JaupZlO8s0MY1yNqcFltv8joDca7r6D+vY+0aoPggQUzTbp7VyO1L5IMgk
	 DmsDNtDmc06jrqD35vPlNKf8G31JYvaVWSr8vBBc1EmqXFi14dvIlLFGCnCV2gGwRfQnx
	 inAL/sFAnewok5+gPb70lHf30L3205TGo2Ne/sIr3NFMevtmYi+L3ZYwtOK2/jp4Z32l1
	 ZaMeZ9yEeuLgvc4Dw98iXnG9tD0iFnhjJttg6bcB3Somuo8Va3mELPNizpy+al/aoeDry
	 qYjwrhd59QIU68E56FifC3LdnT411ZcP6mnngUC1P06ujuPj/6ZqRpDe/SqWpqO2wcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373953;
	bh=frVGTbVmg2oVefUW6o8X5dCFvP12fykQYePKVgWUp10=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1kbd3sjMPSUN713+Bdmf/FmcgcSAaMaMn8dgLncelJz0jQz7uVISBmkk+TAi/6wa
	 OpqFuPqoxsb6FdgbE1/D1QJQItjNvhKrD/BHDjhjUansHjTKrXnMFv5m78V8f3Dkd6
	 UBzZMftIqU9Qt/3+Dmb4EDNtxptXfqMIVKC+ljdrkU4Z1AyzJFEo+m0AN6mndNiUzr
	 AY/9w6R/zL09OaLacoweNdawk8MJk+LMXiWy+J4nXacMphGJLXy/sZ8yQ0zLTF6b+q
	 0Q/rcNtpD/f3ITgEx/J3U2hLSvT5EZT+RhscS9YVgU3Nap2sQReEQ3HRiHGdvQtJG8
	 q2XwM2eup/tEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B7F40B83;
	Fri, 30 Oct 2026 15:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32F85362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23CAD60AA2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d44NatmuhXXU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:25:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7FB9060A9D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373950;
 b=jtrPLTtM9lRVkbtuCYQneYdvtpzrjBoIGUgZm3gqM7bZdw0awj9JWJ2933mIOhINCcw6
 q/e7KSoydFU0lYRYRLomqasAEUW8G+HUcdiQA9Df7Cr3kViaq/XitKRqIFDko5AJ0WuvC
 HNWSeuybhEnNxvJXNCXgOaveq+UCMmZJtWQ4HVrqjvwo6/0dLr9pLYObahwW3ylQuI6Wn
 C55QQXCu05X16nqRrbx8p5BwibFGYiGcD/hrEzx2lbHLtHLr0NlcKs7e9Kqk/1AqQsVr2
 njg/oYOs/D+8Q4+IY/LkGq0syAHaSVKYUafYDInkl+7qj+jAc4htlpHw+uMWuGt40zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373950;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=jcc4l1b6H4njegH+JcfNAFqDcVEcVBMRCrBK/8HhadE=;
 b=Zbx34k+rWlsO6XnZacVC/bJNxkQ7QJoYqJ3h2GTpMySO33FjSlMYkJd7oyTScygvStvu
 tExFHs2RgETDnYbvg9cBQvcUzkTbGvfQvkBYm+2KPBzzUzem3IBbo3KOfGOkqmcJedvo6
 sgKhTkGxY8RfyuGTX5m0uKtFEwqO+F1woEORfjJ3NCc5cYMGOyf6qoTJ4aNn+9A4sOC6h
 Bi2WzypSlrVFVLW8xA2oZcTAH7qEt+lFJIseKdiRt7cbJZ3QjS8WqHAjXP8l9JPcKG32o
 PH64XkRKEmGAdRtrkat12cUhAEtB8LeQZHtLMBuo+9Q2UrJGIm4rJUAE7ppr50l2vVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CriFUWVl; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FB9060A9D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso790456f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373948; x=1793978748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jcc4l1b6H4njegH+JcfNAFqDcVEcVBMRCrBK/8HhadE=;
 b=KuxEJQy/3QK0yBhcJI1QhgPn9UP+kcwhHPOFTF7Xi64YSGfTmKmqmGlBC5AXz+0yCu
 N0HCejntOrdXgS7mVGGOHuVzEnfnrgxKA0kfWHT+4Xeruj7pGHL7StT7qO4kHuufTSx9
 +LYPY4Yz29rJ2A9EfoFTtMrqhkteYUWSmVUIoKzBra5VHp4XNz8r6mSAqU24dxBS30l0
 QYff6dSOHSSAqu0nnGjAZYFO+nyJjSIRoiEWr/L6Pcl0tq5+V01E31k0yzJLN0IFFQO2
 GtEyrktv1GJSkn5E3zbRbicAOG1PGDn/qfLUCKsgQQf0/lFWS4EcR/Ft7+Z8PIeTSGFU
 rt3Q==
X-Gm-Message-State: AFq9FYIHCqw0lz9EToJ7gWxtgLR/v8kMm06+AhzyHmXnabZclTos0Sa8
 bt0prp6BEplk0ANgti3EBdv8ysusLmOv1aZL5wvFRaE0tUm+xibnvU9jmWjagSTTnd1CoZH4rsq
 Fg7h4RFU=
X-Gm-Gg: AYBFou2JAuaHZTna+/JPlxULez8K523NqH7S/mcBa1Sc1s+KS3niTHFL7vhc7OZ0Xy7
 Wliso78Hn5O9tAAySHf56yLMjsYlutzk3sn+4ru5spwIdkJimasqdwF9HOIyFYjliSeHIzW5KWi
 6vUYp3Yzhw8zzoqp/Jn3zqYulffNeFql1N/eOLwdOHFtRMWkyuX5ag+pYnpY+2BRMH69b1dtD7y
 MKn+eY9tUV8csjzLkYlAfxx+SFYrr5QkkTgNNawzZ01cOXlhsHhzwXWDBj18jC219vDbr3yvIon
 hrYN22YKSFQD5nP9qQvZsbvlp2Wm9HhkC5ZcN+I9ud4hSb67IfWiAx9Q2Cr8K8ahV9Nhy99T6ji
 OVLgsTmvsw9ApZLJOi3zDNj2L1r6nvRa+LxiOVHS96pLcNnsye4er5C+hK8u2g4I1vpme45XCsI
 ivJ/nLZOG6vdP4FbJ5nZQA5eWbaJLhDTYBv+ohq7qOUhrWOsK2RBjqWPpe+h6498D5hsApMsqPm
 7my7vl+ol6V+EuGB2o/QVBQ6sT8i6NxoFwaD8w7dCzBe3JdBC4Dx+FkFJCl4KzCXjr3weO/5WHw
 Mk25rgd1vljaKVBOi+XTPy9hXhxyJ25xj/W5oPfuKcVPMfjIx8I1Jsxjiur7n4y5AKCglYiX
X-Received: by 2002:a05:6000:230e:b0:48d:f831:2681 with SMTP id
 ffacd0b85a97d-48e6e515fe6mr6422605f8f.38.1793373946236; 
 Fri, 30 Oct 2026 08:25:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b9eaeesm3873460f8f.49.2026.10.30.08.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:43 +0100
Message-ID: <20261030152545.1905680-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260719125334.1772882-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libepoxy: needs dynamic library
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
> dependencies to gl/egl which revealed that libepoxy needs a toolchain
> with dynamic library:
> 
> ../src/dispatch_common.c:166:10: fatal error: dlfcn.h:
>  No such file or directory
>   166 | #include <dlfcn.h>
> 
> This patch disables static builds and propagates reverse dependencies.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9d5/9d56cb52eb57df61184e26cea9604f1521d135f4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/434f04d604de12c7a4dcad4a605b0c5219d7319c
> 
>  package/libcamera-apps/Config.in                  | 2 +-
>  package/libepoxy/Config.in                        | 4 ++++
>  package/libfm/Config.in                           | 4 +++-
>  package/libgtk3/Config.in                         | 4 +++-
>  package/libgtk4/Config.in                         | 4 +++-
>  package/menu-cache/Config.in                      | 6 ++++--
>  package/pcmanfm/Config.in                         | 4 +++-
>  package/qemu/Config.in                            | 8 ++++++++
>  package/virglrenderer/Config.in                   | 5 +++--
>  package/vte/Config.in                             | 4 +++-
>  package/webkitgtk/Config.in                       | 2 +-
>  package/wpebackend-fdo/Config.in                  | 2 +-
>  package/wpewebkit/Config.in                       | 2 +-
>  package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 5 +++--
>  package/xscreensaver/Config.in                    | 4 +++-
>  15 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index fa41d1be2d..a7f37e3e52 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>  	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # libcamera
> -	depends on !BR2_STATIC_LIBS # gnutls/libcamera
> +	depends on !BR2_STATIC_LIBS # gnutls/libcamera, libepoxy
>  	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
>  	select BR2_PACKAGE_BOOST
> diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
> index 4b23497d46..269b43be85 100644
> --- a/package/libepoxy/Config.in
> +++ b/package/libepoxy/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBEPOXY
>  	bool "libepoxy"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	select BR2_PACKAGE_XUTIL_UTIL_MACROS
>  	help
>  	  Epoxy is a library for handling OpenGL function pointer
> @@ -10,3 +11,6 @@ config BR2_PACKAGE_LIBEPOXY
>  	  OpenGL entry points at runtime.
>  
>  	  https://github.com/anholt/libepoxy
> +
> +comment "libepoxy needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> diff --git a/package/libfm/Config.in b/package/libfm/Config.in
> index 9537a723ff..e4d6528db5 100644
> --- a/package/libfm/Config.in
> +++ b/package/libfm/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBFM
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
>  	depends on BR2_USE_MMU # libgtk3, libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
> +	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
>  	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libgtk3
> @@ -26,11 +27,12 @@ config BR2_PACKAGE_LIBFM
>  
>  	  http://wiki.lxde.org/en/Libfm
>  
> -comment "libfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  comment "libfm needs X.org with an OpenGL backend"
> diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
> index 52ee50db49..7717afdac2 100644
> --- a/package/libgtk3/Config.in
> +++ b/package/libgtk3/Config.in
> @@ -1,8 +1,9 @@
> -comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libgtk3 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
>  
> @@ -19,6 +20,7 @@ config BR2_PACKAGE_LIBGTK3
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on !BR2_STATIC_LIBS # libepoxy
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>  	depends on BR2_PACKAGE_HAS_LIBEGL || \
> diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
> index 3daa676169..958742ae43 100644
> --- a/package/libgtk4/Config.in
> +++ b/package/libgtk4/Config.in
> @@ -1,9 +1,10 @@
> -comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "libgtk4 needs an OpenGL(ES) EGL backend"
> @@ -18,6 +19,7 @@ config BR2_PACKAGE_LIBGTK4
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on !BR2_STATIC_LIBS # libepoxy
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>  	# Even in the case of X11/OpenGL, libgtk4 needs epoxy built
> diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
> index e61ca447c1..3e7137c7a8 100644
> --- a/package/menu-cache/Config.in
> +++ b/package/menu-cache/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_MENU_CACHE
>  	bool "menu-cache"
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
>  	depends on BR2_USE_MMU # libglib2
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBFM_EXTRA
> @@ -11,6 +12,7 @@ config BR2_PACKAGE_MENU_CACHE
>  
>  	  http://wiki.lxde.org/
>  
> -comment "menu-cache needs a toolchain w/ wchar, threads"
> +comment "menu-cache needs a toolchain w/ dynamic library, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
> index a4522d88f4..7e411b22ac 100644
> --- a/package/pcmanfm/Config.in
> +++ b/package/pcmanfm/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PCMANFM
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
>  	depends on BR2_USE_MMU # libfm
>  	depends on BR2_INSTALL_LIBSTDCPP # libfm
> +	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfm
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libfm
>  	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libfm
> @@ -22,11 +23,12 @@ config BR2_PACKAGE_PCMANFM
>  
>  	  http://wiki.lxde.org/en/PCManFM
>  
> -comment "pcmanfm a toolchain w/ wchar, threads, C++, gcc >= 4.9"
> +comment "pcmanfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  comment "pcmanfm needs X.org with an OpenGL backend"
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index bfb8ccea88..20a7fa3db7 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -115,6 +115,7 @@ config BR2_PACKAGE_QEMU_SDL
>  config BR2_PACKAGE_QEMU_OPENGL
>  	bool "Enable OpenGL"
>  	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
> +	depends on !BR2_STATIC_LIBS # libepoxy
>  	select BR2_PACKAGE_LIBEPOXY
>  	help
>  	  Say 'y' to enable OpenGL accelerated display frontend support.
> @@ -126,9 +127,13 @@ config BR2_PACKAGE_QEMU_OPENGL
>  comment "OpenGL support needs an OpenGL and/or OpenGL EGL backend"
>  	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>  
> +comment "OpenGL support needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_QEMU_VIRGLRENDERER
>  	bool "Enable virglrenderer"
>  	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
> +	depends on !BR2_STATIC_LIBS # libepoxy -> virglrenderer
>  	select BR2_PACKAGE_QEMU_OPENGL
>  	select BR2_PACKAGE_VIRGLRENDERER
>  	help
> @@ -147,6 +152,9 @@ comment "virglrenderer needs virgl, venus, or a DRM backend for guest accelerati
>  	depends on BR2_PACKAGE_QEMU_VIRGLRENDERER
>  	depends on !BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
>  
> +comment "virglrenderer needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_QEMU_FDT
>  	bool "Enable FDT"
>  	select BR2_PACKAGE_DTC
> diff --git a/package/virglrenderer/Config.in b/package/virglrenderer/Config.in
> index 281d99b22f..70b2944664 100644
> --- a/package/virglrenderer/Config.in
> +++ b/package/virglrenderer/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_VIRGLRENDERER
>  	bool "virglrenderer"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # needs gcc >= 4.9 for __sync builtins
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # libepoxy
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBEPOXY
>  	help
> @@ -107,8 +108,8 @@ config BR2_PACKAGE_VIRGLRENDERER_VAAPI
>  
>  endif
>  
> -comment "virglrenderer needs a toolchain w/ gcc >= 4.9"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +comment "virglrenderer needs a toolchain w/ dynamic library, gcc >= 4.9"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_PACKAGE_VIRGLRENDERER_HAS_BACKEND
>  	bool
> diff --git a/package/vte/Config.in b/package/vte/Config.in
> index 8a231a21af..af6bfae890 100644
> --- a/package/vte/Config.in
> +++ b/package/vte/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_VTE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
> @@ -22,12 +23,13 @@ config BR2_PACKAGE_VTE
>  
>  	  http://github.com/GNOME/vte
>  
> -comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
> +comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, threads, C++, gcc >= 10"
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>  		BR2_TOOLCHAIN_USES_MUSL
>  
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 3a4c3ed792..6e9d1d9188 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -28,7 +28,7 @@ comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL,
>  
>  config BR2_PACKAGE_WEBKITGTK
>  	bool "webkitgtk"
> -	depends on !BR2_STATIC_LIBS # wayland
> +	depends on !BR2_STATIC_LIBS # libepoxy, wayland
>  	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
> diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
> index bd0ab5421e..0e59b8df1a 100644
> --- a/package/wpebackend-fdo/Config.in
> +++ b/package/wpebackend-fdo/Config.in
> @@ -4,7 +4,7 @@ comment "wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic librar
>  
>  config BR2_PACKAGE_WPEBACKEND_FDO
>  	bool "wpebackend-fdo"
> -	depends on !BR2_STATIC_LIBS # wayland
> +	depends on !BR2_STATIC_LIBS # libepoxy, wayland
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
>  	depends on BR2_USE_WCHAR # libglib2
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index c4ee5a27f7..f7c0ad45f4 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -31,7 +31,7 @@ comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>  
>  config BR2_PACKAGE_WPEWEBKIT
>  	bool "wpewebkit"
> -	depends on !BR2_STATIC_LIBS # wayland
> +	depends on !BR2_STATIC_LIBS # libepoxy, wayland
>  	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_HOST_GCC_AT_LEAST_7 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> index fb23fc1fdf..e5adb73663 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>  	bool "xf86-video-amdgpu"
> +	depends on !BR2_STATIC_LIBS # libepoxy
>  	depends on BR2_USE_MMU # libdrm
>  	depends on BR2_PACKAGE_HAS_LIBGBM
>  	select BR2_PACKAGE_LIBDRM
> @@ -10,6 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
>  	help
>  	  AMD GPU video driver
>  
> -comment "xf86-video-amdgpu needs GBM"
> +comment "xf86-video-amdgpu needs GBM and a toolchain w/ dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_PACKAGE_HAS_LIBGBM
> +	depends on !BR2_PACKAGE_HAS_LIBGBM || BR2_STATIC_LIBS
> diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
> index 2bed8f4765..80fb1550f3 100644
> --- a/package/xscreensaver/Config.in
> +++ b/package/xscreensaver/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_XSCREENSAVER
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
>  	depends on BR2_USE_MMU # libgtk3, libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
> +	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
>  	select BR2_PACKAGE_GDK_PIXBUF
> @@ -30,11 +31,12 @@ config BR2_PACKAGE_XSCREENSAVER
>  
>  	  http://www.jwz.org/xscreensaver/
>  
> -comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
> +comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads, gcc >= 4.9, OpenGL backend"
>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		BR2_STATIC_LIBS || \
>  		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
