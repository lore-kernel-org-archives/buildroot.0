Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5A3C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A082440906;
	Fri,  2 May 2025 11:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b0zj9Qx6cRQ; Fri,  2 May 2025 11:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894C840E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 894C840E17;
	Fri,  2 May 2025 11:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E732FEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D871740C78
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9DD8HQnfu33 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC86A40E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC86A40E1E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC86A40E1E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF2E61C0FC1; Fri,  2 May 2025 13:05:27 +0200 (CEST)
Message-ID: <1760e207-c044-4c4d-a1a4-a4be87061aff@rnout.be>
Date: Fri, 2 May 2025 13:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250422195815.CC4D086157@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422195815.CC4D086157@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183927; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k3oivmyZ3RtVrbvuDETkl6YIHZUCZe5+hNQZ4p17bFU=;
 b=OJ+xwPrBlhidO7iMScwyI8fV3qUDq7r3PvcKDc9FOeYjT4zxQFp+cP5T7AJFa5jIIfH0vh
 +AZgsrnV4hDgo68mv4670HlLR2VrkPDYAFcYlzY0ODnLorzrGFo/ca6TPrt7SgtwRrHUxd
 nuwpgjOXSZnAWMV5hLmDcVYUZ6XZyAK4cWYSYiBhgLZDenfaWvcMBxdXFxmI4mRiauCggl
 bE2KoTShXVBExhX61xcFhj+Fzuhw8r5H6Jaw+FVOt6GgUHm0bjaOphKPdjSwIyK2Iy+81t
 CYvo+jLSTLH2XUshcKD7Ju5XcSo9R1JtZjeRNZkgEkaxCoVjB5LTijdjTTRo6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OJ+xwPrB
Subject: Re: [Buildroot] [git commit] package/ripgrep: bump to version 14.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2025 21:53, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=259af5589ccdd722295395d120875f4b8cd667cf
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Changelog:
> https://github.com/BurntSushi/ripgrep/blob/14.1.1/CHANGELOG.md
> 
> The commit also rebase he package patch on this new version.
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> [Julien:
>   - squash patch rebase and version bump in a single commit
>   - update changelog link to use the tag
> ]
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

> ---
>   ...loc-allocator-behind-a-cargo-feature-flag.patch | 29 +++++++++++-----------
>   package/ripgrep/ripgrep.hash                       |  2 +-
>   package/ripgrep/ripgrep.mk                         |  2 +-
>   3 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> index e665a6570e..8df1491e40 100644
> --- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> +++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
> @@ -1,4 +1,4 @@
> -From 77f850969433b14769ade4281899373f3ebabf86 Mon Sep 17 00:00:00 2001
> +From 3199b83995a9e3a180664c03db6b301641d8f3ea Mon Sep 17 00:00:00 2001
>   From: Jonathan Stites <mail@jonstites.com>
>   Date: Wed, 6 May 2020 12:55:35 +0000
>   Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
> @@ -11,16 +11,18 @@ supported by the upstream project, so ripgrep will fail to build.
>   Signed-off-by: Sam Voss <sam.voss@gmail.com>
>   [Antoine: update for 14.1.0]
>   Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> +[Mehdi: update for 14.1.1]
> +Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
>   ---
>    .github/workflows/ci.yml      | 6 ++++++
>    .github/workflows/release.yml | 8 +++++++-
>    Cargo.toml                    | 8 +++++++-
> - README.md                     | 9 +++++++++
> + README.md                     | 8 ++++++++
>    crates/core/main.rs           | 8 ++++++--
> - 5 files changed, 35 insertions(+), 4 deletions(-)
> + 5 files changed, 34 insertions(+), 4 deletions(-)
>   
>   diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> -index d21b85a..0c9ecb9 100644
> +index 532e2e9..744e2bc 100644
>   --- a/.github/workflows/ci.yml
>   +++ b/.github/workflows/ci.yml
>   @@ -172,6 +172,12 @@ jobs:
> @@ -37,7 +39,7 @@ index d21b85a..0c9ecb9 100644
>          # We could test this when using Cross, but we'd have to execute the
>          # 'rg' binary (done in test-complete) with qemu, which is a pain and
>   diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
> -index f6ea3d9..ac18129 100644
> +index f6ea3d9..b9ac802 100644
>   --- a/.github/workflows/release.yml
>   +++ b/.github/workflows/release.yml
>   @@ -171,7 +171,13 @@ jobs:
> @@ -45,8 +47,8 @@ index f6ea3d9..ac18129 100644
>            echo "target dir is: ${{ env.TARGET_DIR }}"
>    
>   -    - name: Build release binary
> -+    - name: Build release binary (linux)
> -+      if: matrix.build == 'linux'
> ++    - name : Build release binary (linux)
> ++      if: matrix.build == 'linux

  You actually introduced an error here: the ending quotation mark is dropped. 
These two lines should have ben unchanged...

  Doesn't matter because it's only the CI definition, so OK.

  Regards,
  Arnout

>   +      # Use jemalloc allocator for much better performance over the musl default allocator
>   +      run: ${{ env.CARGO }} build --verbose --release --features "pcre2 jemalloc" ${{ env.TARGET_FLAGS }}
>   +
> @@ -56,7 +58,7 @@ index f6ea3d9..ac18129 100644
>          run: |
>            ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
>   diff --git a/Cargo.toml b/Cargo.toml
> -index da350bc..1a0a48f 100644
> +index 2ec69c9..2785c12 100644
>   --- a/Cargo.toml
>   +++ b/Cargo.toml
>   @@ -59,8 +59,9 @@ serde_json = "1.0.23"
> @@ -70,9 +72,9 @@ index da350bc..1a0a48f 100644
>    
>    [dev-dependencies]
>    serde = "1.0.77"
> -@@ -70,6 +71,11 @@ walkdir = "2"
> +@@ -69,6 +70,11 @@ walkdir = "2"
> +
>    [features]
> - simd-accel = ["grep/simd-accel"]
>    pcre2 = ["grep/pcre2"]
>   +# The jemalloc allocator is used for improved
>   +# performance on x86 musl builds.
> @@ -83,16 +85,15 @@ index da350bc..1a0a48f 100644
>    [profile.release]
>    debug = 1
>   diff --git a/README.md b/README.md
> -index 0821fab..fdb9fb5 100644
> +index a429087..f017864 100644
>   --- a/README.md
>   +++ b/README.md
> -@@ -478,6 +478,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
> +@@ -486,6 +486,14 @@ build a static executable with MUSL and with PCRE2, then you will need to have
>    `musl-gcc` installed, which might be in a separate package from the actual
>    MUSL library, depending on your Linux distribution.
>    
>   +When building with the MUSL target on Linux, it is recommended to use the
>   +jemalloc allocator for performance:
> -+
>   +```
>   +$ rustup target add x86_64-unknown-linux-musl
>   +$ cargo build --release --target x86_64-unknown-linux-musl --features jemalloc
> @@ -129,5 +130,5 @@ index 64f35ce..9aa6663 100644
>    static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
>    
>   --
> -2.25.1
> +2.43.0
>   
> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
> index 39165770dc..eec532d240 100644
> --- a/package/ripgrep/ripgrep.hash
> +++ b/package/ripgrep/ripgrep.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo2.tar.gz
> +sha256  64e79c29ca21c9faf699f7241919f05bba89e5732ca5ec6d506fb4ddd1245d9e  ripgrep-14.1.1-cargo2.tar.gz
>   sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 288c20ee95..fd5b3b882e 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RIPGREP_VERSION = 14.1.0
> +RIPGREP_VERSION = 14.1.1
>   RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
>   RIPGREP_LICENSE = MIT
>   RIPGREP_LICENSE_FILES = LICENSE-MIT
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
