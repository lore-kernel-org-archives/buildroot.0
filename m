Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F1C433FE
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 18:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C366D842E5;
	Wed, 18 May 2022 18:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhfmPtSBEWKa; Wed, 18 May 2022 18:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACCC842E0;
	Wed, 18 May 2022 18:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB06B1BF33F
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E78D360F1F
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMGhIzqsYrZt for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 18:23:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78B526059B
 for <buildroot@buildroot.org>; Wed, 18 May 2022 18:23:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id y13so4674364eje.2
 for <buildroot@buildroot.org>; Wed, 18 May 2022 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nEe9awQFnRW31f/SDYV7OcAhq+ima3ZexrrQ9Dm+djI=;
 b=VotOUCNfuLZFDXLJE7Wt4jwcCPn4xSgBSdp2JeJ5xVnFmfK3LosXtgHAeur/MWnuzM
 lbwwlrrGzAf96WPhVASXkkVojXTiczOAJXpT1rtJ1aukWzCT0IOo4ZzEbtv9bxH4lqC3
 QOPGSB2UYgoSFtJAg0DqYJi1wizPD+g4Jfz7nG/AO2S9mdEZvdUwwN9eHj0WJx2KqZSX
 TCNmTb1D7junOw2PMQJ1gnJERf865+P2XNXMdz9Jf9/ABHFac82kfeSfaJlp2HhbVGTb
 K1v8DxIWPkcq6jaF7tOxS9FB1xGB3gnRSQsrXSopd9mHg6pouYrrP/LXTFus2wJ63JuW
 HFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nEe9awQFnRW31f/SDYV7OcAhq+ima3ZexrrQ9Dm+djI=;
 b=316rrNUNMjrVhVq2oUHu2HUhcmEQIlHalLDJ61nAi1vD+dZQCELsrIXafLjQgbK9QM
 JNkLUgDre3aV6RCC7YtrH9IAL/3nuD7knQUmtoTTjXw1XBUPXpRpvV1rXfD+pMrwXaqg
 cB05ad6UzBI5GbqzKeo8GyseF+y+O1dAP4ZsCSTyXhjLPwVJ+tG7v4sDLVbEG+JzKtZ8
 u6TBGYBmM4mNXhiUZfZrNJt12DLl2pgHUNW8+hVC0KmwA2iM1LPMi7tFEPcSKx5phdKt
 nsY4xp5HdU9hx4I5KxxAoKsaFOQiCRvtthZAQVibzYQ7Z6sIWpLqDynW6Dp053lTtX8I
 cbQg==
X-Gm-Message-State: AOAM531biMGcwmcsNNgkVltvj8ktudmotMmYqlaa5kLxavkLpbc7g8gV
 B9FnD5NoLRXP6TvNrPfMMjUtMhBhrYLCrQ==
X-Google-Smtp-Source: ABdhPJzjWn5BV+SiGC47dWG8Ga+cGcLU8t83p3jB+yvsEJ9te+ehe6M45x7SdJgI5ALumbImwyKdrA==
X-Received: by 2002:a17:907:72c2:b0:6f4:ef00:4588 with SMTP id
 du2-20020a17090772c200b006f4ef004588mr774872ejc.515.1652898225490; 
 Wed, 18 May 2022 11:23:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ht7-20020a170907608700b006f3ef214e64sm1207778ejc.202.2022.05.18.11.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 11:23:45 -0700 (PDT)
Message-ID: <469edce9-3d4d-0339-5974-bd553c7d3460@mind.be>
Date: Wed, 18 May 2022 20:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, buildroot@buildroot.org
References: <20220517172110.22265-1-jarkko.sakkinen@iki.fi>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220517172110.22265-1-jarkko.sakkinen@iki.fi>
Subject: Re: [Buildroot] [PATCH RFC] package/enarx: add
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



On 17/05/2022 19:21, Jarkko Sakkinen wrote:
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
> ---
> Hi,
> 
> This is not a patch that I intend to include BuildRoot yet but to
> show changes I needed to make to get nightly Rust working, many of
> which are quite unorthodox.

  Well, for sure we can't accept to swith the rust version to nightly 
unconditionally.

  What we could accept is either:

- have nightly as an option for host-rust;
- add a generic version option to host-rust, similar to the version options in 
kernel and U-Boot.

> 
> I'd like to get ideas based on those how to properly make BuildRoot
> to support nightly Rust in addition to the stable version. I can look
> into that myself, as long as I get some feedback/tips on how to do
> things better.
> 
> BR, Jarkko
> 
>   package/Config.in                             |   1 +
>   package/enarx/Config.in                       |   9 ++
>   package/enarx/enarx.mk                        |  16 +++
>   package/enarx/remove-incompatible-flags.patch |  36 +++++
>   package/pkg-cargo.mk                          |  10 +-
>   package/rust-bin/rust-bin.hash                | 129 ------------------
>   package/rust-bin/rust-bin.mk                  |   2 +-
>   package/rust/rust.hash                        |   6 -
>   package/rust/rust.mk                          |   2 +-
>   9 files changed, 69 insertions(+), 142 deletions(-)
>   create mode 100644 package/enarx/Config.in
>   create mode 100644 package/enarx/enarx.mk
>   create mode 100644 package/enarx/remove-incompatible-flags.patch
>   delete mode 100644 package/rust-bin/rust-bin.hash
>   delete mode 100644 package/rust/rust.hash
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8892134133..11a08930ae 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2538,6 +2538,7 @@ menu "System tools"
>   	source "package/efivar/Config.in"
>   	source "package/embiggen-disk/Config.in"
>   	source "package/emlog/Config.in"
> +	source "package/enarx/Config.in"
>   	source "package/ftop/Config.in"
>   	source "package/getent/Config.in"
>   	source "package/gkrellm/Config.in"
> diff --git a/package/enarx/Config.in b/package/enarx/Config.in
> new file mode 100644
> index 0000000000..a2b9939def
> --- /dev/null
> +++ b/package/enarx/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ENARX
> +	bool "enarx"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_RUSTC

  You'd have to select BR2_PACKAGE_HOST_RUSTC_NIGHTLY here as well if the 
package uses the nightly features.

> +	help
> +	  Application deployment system enabling applications to run within
> +	  Trusted Execution Environments (TEEs
> +
> +	  https://github.com/enarx/enarx
> diff --git a/package/enarx/enarx.mk b/package/enarx/enarx.mk
> new file mode 100644
> index 0000000000..1eaa23d1d6
> --- /dev/null
> +++ b/package/enarx/enarx.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# enarx
> +#
> +################################################################################
> +
> +ENARX_VERSION = master
> +ENARX_SITE = $(call github,enarx,enarx,$(ENARX_VERSION))
> +ENARX_LICENSE = GPL3

  GPL-3.0 (and check if it's not +)

> +ENARX_LICENSE_FILES = LICENSE
> +ENARX_CARGO_BUILD_OPTS = \
> +	-Z bindeps
> +ENARX_CARGO_INSTALL_OPTS = \
> +	-Z bindeps
> +
> +$(eval $(cargo-package))
> diff --git a/package/enarx/remove-incompatible-flags.patch b/package/enarx/remove-incompatible-flags.patch
> new file mode 100644
> index 0000000000..de0fa9b73e
> --- /dev/null
> +++ b/package/enarx/remove-incompatible-flags.patch
> @@ -0,0 +1,36 @@
> +From ee444d43531dfd463732dc934716e9798e75cbce Mon Sep 17 00:00:00 2001
> +From: Jarkko Sakkinen <jarkko@profian.com>
> +Date: Mon, 16 May 2022 11:16:35 +0300
> +Subject: [PATCH] build: remove incompatible flags
> +
> +Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
> +---
> + crates/shim-kvm/build.rs | 2 --
> + crates/shim-sgx/build.rs | 2 --
> + 2 files changed, 4 deletions(-)
> +
> +diff --git a/crates/shim-kvm/build.rs b/crates/shim-kvm/build.rs
> +index 6cfbd707..47aa7799 100644
> +--- a/crates/shim-kvm/build.rs
> ++++ b/crates/shim-kvm/build.rs
> +@@ -5,6 +5,4 @@ fn main() {
> +         "cargo:rustc-link-arg-bin=enarx-shim-kvm=-T{}/layout.ld",
> +         std::env::var("CARGO_MANIFEST_DIR").unwrap()
> +     );
> +-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-Wl,--sort-section=alignment");
> +-    println!("cargo:rustc-link-arg-bin=enarx-shim-kvm=-nostartfiles");

  This doesn't look like a patch that will be acceptable upstream. Is it even 
acceptable for us, can you simply removes those linker options?

> + }
> +diff --git a/crates/shim-sgx/build.rs b/crates/shim-sgx/build.rs
> +index efe9d836..239262f2 100644
> +--- a/crates/shim-sgx/build.rs
> ++++ b/crates/shim-sgx/build.rs
> +@@ -5,6 +5,4 @@ fn main() {
> +         "cargo:rustc-link-arg-bin=enarx-shim-sgx=-T{}/layout.ld",
> +         std::env::var("CARGO_MANIFEST_DIR").unwrap()
> +     );
> +-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-Wl,--sort-section=alignment");
> +-    println!("cargo:rustc-link-arg-bin=enarx-shim-sgx=-nostartfiles");
> + }
> +--
> +2.36.1
> +
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..a808a38c51 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -21,7 +21,7 @@
>   ################################################################################
>   
>   PKG_COMMON_CARGO_ENV = \
> -	CARGO_HOME=$(HOST_DIR)/share/cargo
> +	CARGO_HOME=$(HOME)/.cargo

  This is definitely not good, we don't want to use $(HOME)/.cargo to avoid 
messing up things with cargo stuff done outside of buildroot.

[snip]
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index 7cfe5cd6df..e073097991 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RUST_BIN_VERSION = 1.60.0
> +RUST_BIN_VERSION = nightly

  This is also not good - nightly is a branch, not a tag, which is Not Done in 
Buildroot. If you want to support nightly, you're going to have to find a URL 
through which you can download an unchanging nightly version and use that.

  However, specifically for rust-bin, I think we should always use 
BR2_PACKAGE_HOST_RUST compiler variant for nightly, and keep rust-bin at the 
release version. rust-bin will only be used for building the nightly from source.

>   RUST_BIN_SITE = https://static.rust-lang.org/dist
>   RUST_BIN_LICENSE = Apache-2.0 or MIT
>   RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> deleted file mode 100644
> index 81f366e564..0000000000
> --- a/package/rust/rust.hash
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
> -sha256  a025876deccbcb3f288d8e02623ea321f94623f31305d3c5c6f17855bb9685db  rustc-1.60.0-src.tar.xz
> -# Locally generated
> -sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
> -sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 445fde70a4..a3dfe7d5d2 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RUST_VERSION = 1.60.0
> +RUST_VERSION = nightly
>   RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>   RUST_SITE = https://static.rust-lang.org/dist

  So this would have to become something like:

ifeq ($(BR2_PACKAGE_HOST_RUSTC_NIGHTLY),y)
RUST_VERSION = 2022-05-17
RUST_SOURCE = rustc-nightly-src.tar.xz?version=$(RUST_VERSION)
RUST_SITE = https://static.rust-lang.org/dist/$(RUST_VERSION)
else
RUST_VERSION = 1.60.0
RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
RUST_SITE = https://static.rust-lang.org/dist
endif

  The ?version= thing is needed to be able to update the nightly version. When 
you update it, its hash will change, so we need to make sure it also has a 
different filename. Stuff after ? is ignored by the server, but will be added to 
the local filename. After updating, that version changes so the filename changes 
so it no longer conflicts with the hash.


  Regards,
  Arnout


>   RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
