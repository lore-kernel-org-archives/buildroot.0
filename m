Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E21BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F29BC4051B;
	Sun, 10 Apr 2022 14:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reGo8UgCYnSQ; Sun, 10 Apr 2022 14:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D794017A;
	Sun, 10 Apr 2022 14:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91FD51BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8005760BD6
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoA3hQkklIXg for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:38:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18B6560A6C
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:38:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i27so26029324ejd.9
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=srapRLtp6SsAK9MC6WVrXvew/9mQTdBjiz+cZ50Et3k=;
 b=Ch0ls52dcPXWMWMPQvrTEILqdq8LJQGOUyCNjERkdug6EgNfeTQL8Ctq7EANRUGHzs
 jc07Bgo8eHgIzhEDqV2fRofxTMfY80ePazDefl5rIhNAn7Xsm9Vb8A6y7EyY44Q2iK/z
 DVbXrPhvBZcwe8MqRbcvdWq/JrI44yJJk303PiHoV44981H6Fcyl4L5L/12uAJennAYa
 Lyw3kUKEY9dfYXoqZLyr34FDpaZhV2tAtuO0/gxlFF1DnMe60taBFxOu8kzZs+dJ1W2T
 0va+a7nrZo8oCuXrG/i9YxQfJuFDMDWF4xkJV8sOW3DcZEf3y4ZMjLgd6WyLH6MLfghl
 rEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=srapRLtp6SsAK9MC6WVrXvew/9mQTdBjiz+cZ50Et3k=;
 b=CsRuQMRvOHaPMvfnhQrdABF8ZTUaZJPLJrKTfA866FwAXqMfRr+stjhhE2lDDpXjNq
 n7fTOts17mBKxUB4BFEFbaqvYDuYV+Df7HgoUB+X8G45OHAWuAgyGZttXOmx1qQHYxk5
 ynP0ooyPZx8UUHtLlod9KRboiL/WUZV+aMrNHskpV9S3AhkLZb55TrVRfkdtpWrSN+ej
 MKYjvlPyMVaQr+SWH4Rd1VphXRBpZxNoyXXciQfReBH7Mvv7EPSkpMtJskjm/sFwyPS9
 XaM0ckmD4O5hvvjMyYjrMtpDJTwhcJgQmiZoBMUiKWzp8zbpfOwhcjrIwYYwCkFpI5Ym
 nOLQ==
X-Gm-Message-State: AOAM531ix5Hzkh6bBY8lDnjLZrmZr2ZcjPWpbS1AMm4bBRGGsXUFPNwT
 3zNwLvqOU2lY+7TZtAyT/YYolQ==
X-Google-Smtp-Source: ABdhPJzoiHcvhP/KTI8szUm1S8pONLlFjCYxos43da+hQZ01YsMni1KlENYgKhep3p6GxrojFv4v9Q==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id
 nd20-20020a170907629400b006e10ea474a3mr26216246ejc.168.1649601525026; 
 Sun, 10 Apr 2022 07:38:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a170906434100b006e7efa329fbsm7985068ejm.109.2022.04.10.07.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:38:44 -0700 (PDT)
Message-ID: <d788b1e6-1b87-fb07-204a-4a54a544cef5@mind.be>
Date: Sun, 10 Apr 2022 16:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220404004138.563732-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404004138.563732-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: support additional host architectures
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



On 04/04/2022 02:41, James Hilliard wrote:
> There are host toolchains available for non-x86/x86_64 architectures,
> add them as supported along with their toolchain hashes.
> 
> Note that the gcc riscv64-unknown-linux-gnu arch needs to be mapped
> to the rust riscv64gc-unknown-linux-gnu arch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rust-bin/rust-bin.hash | 24 ++++++++++++++++++++++++
>   package/rustc/Config.in.host   | 11 ++++++++++-
>   package/rustc/rustc.mk         |  4 +++-
>   3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index 9f8788a295..bac2f21c5c 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -1,6 +1,30 @@
> +# From https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
> +sha256  0a80900aa160de4292b1174e25f183bd88f6c2fbb3056a59fcb4d658c70084cb  rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz
>   # From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
>   # Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
>   sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
> +sha256  01d2e69ed06fbc05a779a7d09f99d0b54a0d10fef9a7dcd0ea07866d57900ca2  rust-1.58.1-mips-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
> +sha256  0b8fafb75e06ba9d4ca58f2cde3179a677908aed8be64e798fc107135839c480  rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
> +sha256  00216feea0a6468e9ce57c7d3ad50e22fe888dfc9aabc34128e1f4b02c5a09b9  rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
> +sha256  f6f870875d9adbe5a8b7bb6f61c44b6c54381e5dff50b4d2cdce50d18a8a541e  rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
> +sha256  45bf988d0337095a4d30bb237d552e3420b4381e208624f0d956e1caf6b90207  rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
> +sha256  488e30e926d1835c0140a01bff4d3fe6499be1e89e5c740b2ceace892ab4c2e6  rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  48cf31128a54551330f9c094f69d274adaab1ac506869dd65353aaea5bcbf33f  rust-1.58.1-s390x-unknown-linux-gnu.tar.xz
>   # From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
>   # Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
>   sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index 80d1d1a3d8..4ea66c2d2d 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -1,7 +1,16 @@
>   # All host rust packages should depend on this option
>   config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>   	bool
> -	default y if BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	default y if BR2_HOSTARCH = "aarch64"
> +	default y if BR2_HOSTARCH = "mips"
> +	default y if BR2_HOSTARCH = "mipsel"
> +	default y if BR2_HOSTARCH = "powerpc"
> +	default y if BR2_HOSTARCH = "powerpc64"
> +	default y if BR2_HOSTARCH = "powerpc64le"
> +	default y if BR2_HOSTARCH = "riscv64"
> +	default y if BR2_HOSTARCH = "s390x"
> +	default y if BR2_HOSTARCH = "x86"
> +	default y if BR2_HOSTARCH = "x86_64"
>   
>   # The pre-built Rust standard library is only available for a number
>   # of architectures/C libraries combinations, with different levels of
> diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
> index 0513dd0b40..b2cc131ee9 100644
> --- a/package/rustc/rustc.mk
> +++ b/package/rustc/rustc.mk
> @@ -11,7 +11,9 @@ ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
>   RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
>   endif
>   
> -ifeq ($(HOSTARCH),x86)
> +ifeq ($(HOSTARCH),riscv64)
> +RUSTC_HOST_ARCH = riscv64gc
> +else ifeq ($(HOSTARCH),x86)
>   RUSTC_HOST_ARCH = i686
>   else
>   RUSTC_HOST_ARCH = $(HOSTARCH)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
