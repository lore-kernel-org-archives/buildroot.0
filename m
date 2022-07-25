Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CD5C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 18:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F53419BB;
	Mon, 25 Jul 2022 18:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F53419BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5b2jv4BUnlt1; Mon, 25 Jul 2022 18:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D642419B1;
	Mon, 25 Jul 2022 18:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D642419B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8D11BF380
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9588B833D3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9588B833D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dk3qxwqpRXMj for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 18:41:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B358336F
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65B358336F
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 18:41:35 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id l188so2897626oia.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 11:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+o0V6woBK3VyCd1wkXgfWIXKASX1rB4ew//L8PlSkTo=;
 b=LA3HniH1Nds8pVAkf/DcyBVziPut2rSEZVPe3PDFjWEB90q2BtFrAISL6XytG/Spqk
 0pfWUpZnIs1+Ut0MATUfpRcOUuQQCXS/8eFU0LKSEBJ6H6znKzLSFvZvovVHG6D+Aopp
 VBBJmP9qJNZUo5F25TPXJ7w1RGyMuyl/iDw+ZsNj52BosdPMRwK5js9jM8JD6IZk3nJr
 q+3DdGLwBQ7jeZGvxcsY2dAok12R3tpmfXNnAUBrBhy1VAi7m0bZtHIj/Z/Q1vrBJm8G
 0HqL4VfedREGxqDAqSGWsmtNjghVOspgM0yiB3ohmnT8Pbv46JEGxHRvFTl8tz4G3OYA
 a3xA==
X-Gm-Message-State: AJIora9O+t9rlqPlyuw8M5az6tfqel/anJ/GtOQDeM8Sf3RfXNzcbZPr
 P6tnJwT5bQiv8PTmkjQ38tZcyfLMtLLqSQvzys1EOFzCems=
X-Google-Smtp-Source: AGRyM1t+/gbqNpIw2BG+PWlvdkugy7ykwfFsQdo2mKYfv9o+Mnv9YyuR4IzKvOWFnZjNA0dNDTrA6nS+ZEBEk/V9GV4=
X-Received: by 2002:a54:488d:0:b0:33a:87b3:31a with SMTP id
 r13-20020a54488d000000b0033a87b3031amr13627757oic.153.1658774494293; Mon, 25
 Jul 2022 11:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220725153601.25254-1-romain.naour@smile.fr>
In-Reply-To: <20220725153601.25254-1-romain.naour@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Jul 2022 12:41:22 -0600
Message-ID: <CADvTj4oNN67-EOvYdTzCA9UnxVbpNL6Q7LGA8X4ea1RnghXZzg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+o0V6woBK3VyCd1wkXgfWIXKASX1rB4ew//L8PlSkTo=;
 b=KQ90hlXQACQc/dQMcjgzQ5l8dtvtmW09vIJBrnPBbzvjg/F2Su6v3Oi2JNR1qDPfag
 DkMc+No+sXqnwFNqMuHRfcFWhymRjWQquTwoCPQjfz3peOVOnELm58nWr2icyrc/DGm2
 7+gw6Sf3pUkJgrMXF3ha7dEaFzqopC3jEGrDmGpplU+Jivuo7uYUzLLCfZls3qvWa2t2
 NT8SDNh4ummp+9afuQ8vY/IYtgqL9C8gCl2s6FH/z9C1PbmVCT39im++szbGuZR1XjVa
 HWludGSHc59y7X4QTWam8JRCN7gJ6fNic7J+M9c9AfhFKiGrcT/WIR8NzriPDLdmTEpa
 fu9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KQ90hlXQ
Subject: Re: [Buildroot] [PATCH] package/rustc: needs C++
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

On Mon, Jul 25, 2022 at 9:36 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> While building host-rust with a musl based toolchain without C++ compiler,
> the build fail since libunwind bundled in rust sources needs a C++ compiler.
>
> cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system
>
> Note: the issues can't be reproduced with a glibc based toolchain without
> C++ probaly due to extra steps required to support musl libc.

Is this because glibc provides libunwind so it's not required there?

>
> Actually, rust compiler is based on LLVM so it likely depends on the same
> dependencies as host-llvm package.

This doesn't really look correct, I mean we always assume the build host has
C++ support right? This patch adds a target C++ dependency not a host C++
build dependency.

>
> Add C++ dependency to rustc virtual package and its reverse dependencies.
>
> Fixes:
> http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/bat/Config.in             | 4 ++++
>  package/hyperfine/Config.in       | 4 ++++
>  package/librsvg/Config.in         | 2 +-
>  package/ripgrep/Config.in         | 4 ++++
>  package/rustc/Config.in.host      | 4 ++++
>  package/sentry-cli/Config.in.host | 4 ++++
>  package/suricata/Config.in        | 5 +++--
>  7 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/package/bat/Config.in b/package/bat/Config.in
> index 515eaf591a..8b95f253ad 100644
> --- a/package/bat/Config.in
> +++ b/package/bat/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_BAT
>         bool "bat"
>         depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP # host-rustc
>         select BR2_PACKAGE_HOST_RUSTC
>         # we need a full version of less
>         select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_BAT
>           A cat(1) clone with syntax highlighting and Git integration.
>
>           https://github.com/sharkdp/bat
> +
> +comment "bat needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/hyperfine/Config.in b/package/hyperfine/Config.in
> index 527e978146..c052ba8242 100644
> --- a/package/hyperfine/Config.in
> +++ b/package/hyperfine/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HYPERFINE
>         bool "hyperfine"
>         depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP # host-rustc
>         select BR2_PACKAGE_HOST_RUSTC
>         help
>           hyperfine is a benchmark tool written in Rust. It evaluates
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_HYPERFINE
>           same time.
>
>           https://github.com/sharkdp/hyperfine
> +
> +comment "hyperfine needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
> index 270b524b37..91a8d4fe95 100644
> --- a/package/librsvg/Config.in
> +++ b/package/librsvg/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBRSVG
>         depends on BR2_USE_WCHAR # glib2
>         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>         depends on BR2_USE_MMU # glib2
> -       depends on BR2_INSTALL_LIBSTDCPP # pango
> +       depends on BR2_INSTALL_LIBSTDCPP # pango, host-rustc
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
>         select BR2_PACKAGE_CAIRO
> diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
> index 0ea2902b34..352f38a9a4 100644
> --- a/package/ripgrep/Config.in
> +++ b/package/ripgrep/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_RIPGREP
>         bool "ripgrep"
>         depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP # host-rustc
>         select BR2_PACKAGE_HOST_RUSTC
>         help
>           ripgrep is a line-oriented search tool that
> @@ -12,3 +13,6 @@ config BR2_PACKAGE_RIPGREP
>           The Silver Searcher, ack and grep.
>
>           https://github.com/BurntSushi/ripgrep
> +
> +comment "ripgrep needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fec8726aee..1aa5405abf 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -135,11 +135,15 @@ config BR2_PACKAGE_HOST_RUSTC_ABI
>  config BR2_PACKAGE_HOST_RUSTC
>         bool "host rustc"
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP # llvm
>         help
>           Compiler for the Rust language
>
>           http://www.rust-lang.org
>
> +comment "host-rustc needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> +
>  if BR2_PACKAGE_HOST_RUSTC
>
>  choice
> diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
> index 3124015367..d32c962338 100644
> --- a/package/sentry-cli/Config.in.host
> +++ b/package/sentry-cli/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_SENTRY_CLI
>         bool "host sentry-cli"
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> +       depends on BR2_INSTALL_LIBSTDCPP # host-rustc
>         select BR2_PACKAGE_HOST_RUSTC
>         help
>           Official Sentry command line interface
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_SENTRY_CLI
>           For managing debug information files and source maps.
>
>           https://docs.sentry.io/cli/
> +
> +comment "host sentry-cli needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/suricata/Config.in b/package/suricata/Config.in
> index 5f7eb21da0..cdeba3f103 100644
> --- a/package/suricata/Config.in
> +++ b/package/suricata/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_SURICATA
>         depends on BR2_USE_MMU # fork()
>         depends on BR2_USE_WCHAR
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_INSTALL_LIBSTDCPP # host-rustc
>         select BR2_PACKAGE_HOST_RUSTC
>         select BR2_PACKAGE_JANSSON
>         select BR2_PACKAGE_LIBHTP
> @@ -20,7 +21,7 @@ config BR2_PACKAGE_SURICATA
>
>           https://suricata-ids.org
>
> -comment "suricata needs a toolchain w/ wchar, threads"
> +comment "suricata needs a toolchain w/ C++, wchar, threads"
>         depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>         depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
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
