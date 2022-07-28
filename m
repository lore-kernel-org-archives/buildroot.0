Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C381C19F2B
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC229405CE;
	Thu, 28 Jul 2022 21:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC229405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOpao3n8pScT; Thu, 28 Jul 2022 21:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC756405A7;
	Thu, 28 Jul 2022 21:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC756405A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB40A1BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C62ED60AF0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C62ED60AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pns5vm14xPdp for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABF760AE0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AABF760AE0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:08:07 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so3834627fac.6
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LC+GBq9VUHaNTejP2nE4iiEczUtpAcaCrWtPzKWiDMo=;
 b=ZnqTzqMFrUChN58J0n7SfSd7poFsRjOQQvWtbX6k3z7L/NK6KFb+O0TcrgWqlOULnB
 BOenwBjZySh4u423lppztKHpNx1g6aklvghEHPlg4DFF5R3Zbt83hzap2KwP/qodaarV
 CHHGJZrMFsmfjdaf0Rirdwq/xuoRNL9pwegYjMqHfAmtI/m6JcI9rtZlAQBZirr71MJd
 VJUPFSKiEr4Y7n8ZqGVoSwArkcGM8PrVSTQ8D05oxBggGw9A4ZR4SQH3paq2pJeEJgDw
 2X5nA3gRqQomBfai7GI2sJO/+il7iTQWuPu+Z26625l0lhr20gQhrlNwj5Ot5DtK25Di
 pErA==
X-Gm-Message-State: AJIora83hEy2hkfsWjMWQawaHw3xOwFTIhPbsugnjFuLXPT0hkIL8CUi
 ootycDFnybElJbmIvdzMBFfsHbPHBfrwJunR33ddJUIlasRCBw==
X-Google-Smtp-Source: AGRyM1vn6TFSpZfADVUC47Mp2uTRSa+Gd2JJ8TouykwFUYRhRfRhwkLfeuKsOpLEoyPhqBD4sdONEIHxJ9kIsUSEqZ4=
X-Received: by 2002:a05:6870:3282:b0:10d:7164:c66e with SMTP id
 q2-20020a056870328200b0010d7164c66emr250742oac.147.1659042486345; Thu, 28 Jul
 2022 14:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220727083753.935654-1-romain.naour@smile.fr>
In-Reply-To: <20220727083753.935654-1-romain.naour@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 28 Jul 2022 15:07:54 -0600
Message-ID: <CADvTj4pSAe_nAr993-GpCGUdsz2RcQa8n+ECme3tvhQwne6s5Q@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LC+GBq9VUHaNTejP2nE4iiEczUtpAcaCrWtPzKWiDMo=;
 b=dgu4LDETM+xFL6xq+g0syJvfkY4Z4LZKS0EEuVlaRDCUTh0b8tfJTbk3M0JsJ4EWs4
 jv2iomEaynk5D/KCVKKKMiCep8pS7LNZMPqE8mrVJDBeCS6e8Uw3z0drF/wwtja52FZF
 24bOTUXCuk8qlMeTj+VzC0hRQEOr0uN712YnjsDZtNsrAUYxJLV2eJtULqiW8ldf14WG
 jiupEsbpa6vMr6NrLK4mu5zCUdsIik5O5p4CBy4QxWNBctO1TlJz6SHiEkNw+nJLAUxO
 +Hs4VHi2NA5lpShI4XRkiJUYpmO79yGuOLPkGAlmxouOqnI8VLdlwT9mOnW+GzvSNwk6
 Zo4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dgu4LDET
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 2:38 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> While building host-rust with a musl based toolchain without C++ compiler,
> the build fail since libunwind bundled in rust sources needs a C++ compiler.
>
> cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system

AFAIU rust should be able to use normal(ie non-llvm) libunwind which doesn't
require C++:
https://github.com/buildroot/buildroot/blob/master/package/libunwind/libunwind.mk

>
> Note: the issues can't be reproduced with a glibc based toolchain
> without C++ probaly due to extra steps required to support musl libc.
>
> We could add the C++ dependency direclty to host-rustc but it would
> requires adding the C++ reverse dependencies to all rust packages.
>
> Instread, we add the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> only when a musl toolchain is used. So we can still install a prebuilt
> rust compiler but without the rust standard library (rust-std).
>
> Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS option but
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some
> BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.
>
> Fixes:
> http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v3: add a global C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS (Yann)
>     update comment to use "C++ cross compiler"
> v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>     after James's review and discussion with Thomas and Arnout
> ---
>  package/rustc/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fec8726aee..822de68dbb 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -110,11 +110,15 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>         default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
>
>  # All target rust packages should depend on this option
> +# Note: With musl based toolchain, we need a C++ cross compiler to
> +# build host-rust some target libraries (libunwind) from llvm source
> +# code bundled in rust sources.
>  config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>         bool
>         default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
>         default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>         default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> +       depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
> --
> 2.34.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
