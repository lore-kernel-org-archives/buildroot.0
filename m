Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A9C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB0BF40A6E;
	Fri, 29 Dec 2023 22:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB0BF40A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qETJeTYU8KS5; Fri, 29 Dec 2023 22:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7293E40236;
	Fri, 29 Dec 2023 22:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7293E40236
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC321BF3A1
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FEDF41740
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEDF41740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGpei8FqQb4R for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 22:13:41 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B74419ED
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 22:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B74419ED
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 53BCEB0051B;
 Fri, 29 Dec 2023 23:13:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 23:13:35 +0100
Date: Fri, 29 Dec 2023 23:13:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZY9Ej76T9DYHuLe3@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228152657.488457-2-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703888019;
 bh=1AFmE768His8W2tPwr/xT6v1/obMJspYMLkalUCqt+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ti0TZDbCwhrPM2bDF5AaKKGkK5zRPIGWXkRdasjp+eMmO7+aWIVlWadDPJZuHzgwx
 1n8VlwaLhudpVkCjifSould2qoNYNchgjlxi3xQD+QeY3loOy+JkdjCkCPoSnLNS76
 z8oZnBAWtezHp2yvcMicIFESehdDE2v7Kquu8j5M8NwdTngHEcmkUsV4/1Stc9R43c
 fATaAt5W+aBD42D+oHrgvFEBO/MuC3fHAXpG/Wwl/Smt9LaCGhKyIxfx2dd/BBIy+v
 H7dKAeubwwUSVfEPpuLx3Z6vwrxMgSo8ubaJ6W8dUUrRJ3pxEKsfquFt2yM9ySBrnu
 OFn19XglNPkoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ti0TZDbC
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: romain.naour@smile.fr, sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

Thanks for this patchset!

On 2023-12-28 16:26 +0100, Antoine Coutant spake thusly:
> ripgrep previous version hash is no longer valid.
> The tarball is modified by rust vendoring so the hash
> may change with rust versions.

If that's so, then we have a big problem: the hashes for all the
cargo-based packages will change, and thus it means we will have to
name the generated archive based on the cargo version used to do the
vendoring. That would apply to:

    package/bat/bat.mk
    package/dust/dust.mk
    package/eza/eza.mk
    package/hyperfine/hyperfine.mk
    package/nushell/nushell.mk
    package/procs/procs.mk
    package/ripgrep/ripgrep.mk
    package/rust-bindgen/rust-bindgen.mk
    package/sentry-cli/sentry-cli.mk
    package/tealdeer/tealdeer.mk

Can you clarify this point, please?

Regards,
Yann E. MORIN.

> The patch has been rebased to ripgrep 14.0.3.
> 
> Changelog:
> https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
> 
> Tested using qemu_aarch64_virt_defconfig and Arm AArch64 13.2.rel1
> toolchain.
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
>  ...llocator-behind-a-cargo-feature-flag.patch | 52 ++++++++++---------
>  package/ripgrep/ripgrep.hash                  |  2 +-
>  package/ripgrep/ripgrep.mk                    |  6 +--
>  3 files changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> index e2ba68f389..aa073c6e7f 100644
> --- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> +++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> @@ -1,4 +1,4 @@
> -From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
> +From e4df6678e3e2d018acccafd47d1e484887d23323 Mon Sep 17 00:00:00 2001
>  From: Jonathan Stites <mail@jonstites.com>
>  Date: Wed, 6 May 2020 12:55:35 +0000
>  Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
> @@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
>  supported by the upstream project, so ripgrep will fail to build.
>  
>  Signed-off-by: Sam Voss <sam.voss@gmail.com>
> +[Antoine: update for 14.0.3]
> +Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>  ---
>   .github/workflows/ci.yml      | 6 ++++++
>   .github/workflows/release.yml | 8 +++++++-
> @@ -18,10 +20,10 @@ Signed-off-by: Sam Voss <sam.voss@gmail.com>
>   5 files changed, 35 insertions(+), 4 deletions(-)
>  
>  diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> -index ab154ec..aa567d9 100644
> +index b37753e..a2cdeee 100644
>  --- a/.github/workflows/ci.yml
>  +++ b/.github/workflows/ci.yml
> -@@ -149,6 +149,12 @@ jobs:
> +@@ -160,6 +160,12 @@ jobs:
>         if: matrix.target != ''
>         run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
>   
> @@ -31,14 +33,14 @@ index ab154ec..aa567d9 100644
>  +      if: matrix.os == 'nightly-musl'
>  +      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
>  +
> -     - name: Test for existence of build artifacts (Windows)
> -       if: matrix.os == 'windows-2019'
> -       shell: bash
> +     - name: Test zsh shell completions (Unix, sans cross)
> +       # We could test this when using Cross, but we'd have to execute the
> +       # 'rg' binary (done in test-complete) with qemu, which is a pain and
>  diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
> -index 7cfb6a4..ad6b82d 100644
> +index b10c076..58a7a12 100644
>  --- a/.github/workflows/release.yml
>  +++ b/.github/workflows/release.yml
> -@@ -133,7 +133,13 @@ jobs:
> +@@ -153,7 +153,13 @@ jobs:
>           echo "target flag is: ${{ env.TARGET_FLAGS }}"
>           echo "target dir is: ${{ env.TARGET_DIR }}"
>   
> @@ -50,25 +52,25 @@ index 7cfb6a4..ad6b82d 100644
>  +
>  +    - name: Build release binary (non-linux)
>  +      if: matrix.build != 'linux'
> -       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
> - 
> -     - name: Strip release binary (linux and macos)
> +       shell: bash
> +       run: |
> +         ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
>  diff --git a/Cargo.toml b/Cargo.toml
> -index fb78fcb..0d34b1e 100644
> +index f30cc0b..6fe4c79 100644
>  --- a/Cargo.toml
>  +++ b/Cargo.toml
> -@@ -56,8 +56,9 @@ version = "2.33.0"
> - default-features = false
> - features = ["suggestions"]
> +@@ -59,8 +59,9 @@ serde_json = "1.0.23"
> + termcolor = "1.1.0"
> + textwrap = { version = "0.16.0", default-features = false }
>   
>  -[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
>  +[dependencies.jemallocator]
> - version = "0.3.0"
> + version = "0.5.0"
>  +optional = true
>   
> - [build-dependencies]
> - lazy_static = "1.1.0"
> -@@ -75,6 +76,11 @@ walkdir = "2"
> + [dev-dependencies]
> + serde = "1.0.77"
> +@@ -70,6 +71,11 @@ walkdir = "2"
>   [features]
>   simd-accel = ["grep/simd-accel"]
>   pcre2 = ["grep/pcre2"]
> @@ -81,10 +83,10 @@ index fb78fcb..0d34b1e 100644
>   [profile.release]
>   debug = 1
>  diff --git a/README.md b/README.md
> -index 46938bc..9917b29 100644
> +index 63c0725..3d35819 100644
>  --- a/README.md
>  +++ b/README.md
> -@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
> +@@ -442,6 +442,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
>   `musl-gcc` installed, which might be in a separate package from the actual
>   MUSL library, depending on your Linux distribution.
>   
> @@ -101,10 +103,10 @@ index 46938bc..9917b29 100644
>   ### Running tests
>   
>  diff --git a/crates/core/main.rs b/crates/core/main.rs
> -index 47385de..c9dae5a 100644
> +index 64f35ce..9aa6663 100644
>  --- a/crates/core/main.rs
>  +++ b/crates/core/main.rs
> -@@ -31,7 +31,7 @@ mod subject;
> +@@ -27,7 +27,7 @@ mod search;
>   // have the fastest version of everything. Its goal is to be small and amenable
>   // to static compilation.) Even though ripgrep isn't particularly allocation
>   // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
> @@ -113,7 +115,7 @@ index 47385de..c9dae5a 100644
>   //
>   // We don't unconditionally use jemalloc because it can be nice to use the
>   // system's default allocator by default. Moreover, jemalloc seems to increase
> -@@ -39,7 +39,11 @@ mod subject;
> +@@ -35,7 +35,11 @@ mod search;
>   //
>   // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
>   // i686.
> @@ -127,5 +129,5 @@ index 47385de..c9dae5a 100644
>   static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
>   
>  -- 
> -2.32.0
> +2.25.1
>  
> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> index 71e74e1bcf..ff86c12ad5 100644
> --- a/package/ripgrep/ripgrep.hash
> +++ b/package/ripgrep/ripgrep.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
> +sha256  2f022889c999ffe00955e586fe24b334d1c79060978fc41b95b52a30946e65d0  ripgrep-14.0.3.tar.gz
>  sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index d587441cfa..44662749bb 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -4,11 +4,7 @@
>  #
>  ################################################################################
>  
> -# Same as 13.0.0, we use a Git commit hash because the hash of this
> -# tarball changed when moving to the cargo-package infrastructure, and
> -# we can't change the hash of existing tarball. Please switch back to
> -# a Git tag at the next version bump.
> -RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
> +RIPGREP_VERSION = 14.0.3
>  RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
>  RIPGREP_LICENSE = MIT
>  RIPGREP_LICENSE_FILES = LICENSE-MIT
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
