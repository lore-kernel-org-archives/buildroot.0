Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E10C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3429240183;
	Sat, 12 Mar 2022 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMOLpvuqiBzF; Sat, 12 Mar 2022 20:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CF6404B2;
	Sat, 12 Mar 2022 20:34:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E73B1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79C7A40490
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmlzjjUEwkAZ for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:34:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D988240486
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:34:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c20so14914367edr.8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Uepfj3Bd4ld7Oi7YLa6cWyePZYtFmWXOU2M7ak/Ew3I=;
 b=fUyhpJb0myXq+qixQhJNjIe99DL31nOGhlVdnD0FFxHel2+QHuWOaC2gHR1bEicN22
 AExOaiZoPORbGK0R60OJgxiy2ZS9oZnqu0lFoNEqeWRZ8sSbfhms4N0/FNwYgxreGl3H
 HF0QBCbOiEh3jMAKgMhZCOqgxiw3rIMsehQhdb7mVFrYhKOb3BvLCqQn5mnPjdgKiWhy
 ZgoRKetw8XIRw9luzSTR9jeRulMTBCxWxsUU1ezw5cbhK4MgvTOP8iAkg1oR/x9DE52o
 mBVER4nwAVumAyT7539VlNOklv5HDMNV782juKgBC2zSK9OlVFbEY2YbCInaijl4UB70
 az2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Uepfj3Bd4ld7Oi7YLa6cWyePZYtFmWXOU2M7ak/Ew3I=;
 b=30T9o66qLReSxDMl56GKiAzT3KfPUJcEkKXfqrqTFknsidvU3Lm+yfsYda0tet2FtW
 1dLl3PXhX5ivFvszn5C2aR1astTdVfxBtzltA7jPR29kAFS/G4FXGTPNsFFYOScasdWH
 ddqbXn55mRIXd4hf6bvtrGkcHCexlyLxQN1Na4xGc2O24EKzzPo1mOeMQ/kn34WW34t3
 3MfET4qj8N2AogvXW5Hy2LdBY7VG5cpaeOgMhZo6Ol+IXoE96kVjohDFwcm6rRmeR9/6
 JEgsZ5bHq4NzeZvB/ZEmJ55ckt0hLE03GSPqOPs/ojC3OxwCt/bL0B2RRvXw647Wtp7h
 apqQ==
X-Gm-Message-State: AOAM532U6ZLS8Clw744junCMT6OwBzTfadizPhBw7QPHO/yrn0UZMyEn
 SC1tu0JhYFwYlGOQ2ezeGuNEkA==
X-Google-Smtp-Source: ABdhPJw4WdBt6JwP1xq8OwW+FrxL6ewsMFbYokUK2QnYyFH9tz5Mw+rAJbUn/D1B2KKwPbXigtUjNQ==
X-Received: by 2002:a05:6402:27cb:b0:416:c67f:c03d with SMTP id
 c11-20020a05640227cb00b00416c67fc03dmr10501210ede.316.1647117250839; 
 Sat, 12 Mar 2022 12:34:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b006da814b08c6sm4591974ejg.94.2022.03.12.12.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:34:10 -0800 (PST)
Message-ID: <08edbbcf-8be3-4554-0d54-0dd349caa2ff@mind.be>
Date: Sat, 12 Mar 2022 21:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220224154513.220976-1-romain.naour@gmail.com>
 <20220224154513.220976-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224154513.220976-2-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 2/2] package/rust: install rustc and
 rust-std built by Buildroot
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



On 24/02/2022 16:45, Romain Naour wrote:
> The test TestRust is currently broken with ripgrep package with
> the following error:
> 
> error[E0514]: found crate `core` compiled by an incompatible version of rustc
>    |
>    = help: please recompile that crate using this compiler (rustc 1.58.1) (consider running `cargo clean` first)
>    = note: the following crate versions were found:
>            crate `core` compiled by rustc 1.58.1 (db9d1b20b 2022-01-20): TestRust/host/lib/rustlib/x86_64-unknown-linux-gnu/lib/libcore-6cfcec236d576603.rlib
> 
> error[E0514]: found crate `std` compiled by an incompatible version of rustc
> 
> The problem is not really a cross-compilation issue (we are building
> for an armv7 target on x86_64 host) but a problem with rust-std libraries
> (rlib).
> 
> We can notice that "rustc 1.58.1 (db9d1b20b 2022-01-20)" is the same
> version as the prebuilt rustc used to bootstrap the build:
> 
> TestRust/host/bin/rustc --version
> rustc 1.58.1
> 
> TestRustBin/host/bin/rustc --version
> rustc 1.58.1 (db9d1b20b 2022-01-20)
> 
> Indeed we are using host-rust-bin to bootstrap the host-rust compiler
> package built by Buildroot. The problem is that the
> libcore-6cfcec236d576603.rlib file come from host-rust-bin (rust-std)
> and is not removed before installing host-rust built by Buildroot.
> 
> We actually spent a lot of time to build host-rust with rust-std
> and forget to install this important library HOST_DIR.
> 
> Looking at the host-rust build directory we can notice two installer
> script "install.sh" (the same scripts used to install host-rust-bin):
> 
> TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust/x86_64-unknown-linux-gnu/rust-1.58.1-x86_64-unknown-linux-gnu/install.sh
> TestRust/build/host-rust-1.58.1/build/tmp/tarball/rust-std/armv7-unknown-linux-gnueabihf/rust-std-1.58.1-armv7-unknown-linux-gnueabihf/install.sh
> 
> The "tarball" directory is generated by the "python x.py dist" during
> the install step, we have to keep it.
> 
> Replace "python x.py install" by theses two install scripts.
> Installing rust-std with the install.sh script replace the rust-std
> libraries installed by host-rust-bin.

  Excellent description, thanks. It's almost Yann-level :-)

> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>   package/rust/rust.mk | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 46487fe4b7..4a6b04dc8c 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -67,9 +67,30 @@ define HOST_RUST_BUILD_CMDS
>   	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
>   endef
>   
> +HOST_RUST_INSTALL_COMMON_OPTS = \
> +	--prefix=$(HOST_DIR) \
> +	--disable-ldconfig
> +
> +HOST_RUST_INSTALL_OPTS = \

  This variable is used only once, which makes it not very useful. I instead 
added the --components directly in HOST_RUST_INSTALL_RUSTC. I also renamend the 
INSTALL_COMMON_OPTS to INSTALL_OPTS since there's only one variable now.

> +	$(HOST_RUST_INSTALL_COMMON_OPTS) \
> +	--components=rustc,cargo,rust-std-$(RUSTC_HOST_NAME)
> +
> +define HOST_RUST_INSTALL_RUSTC
> +	(cd $(@D)/build/tmp/tarball/rust/$(RUSTC_HOST_NAME)/rust-$(RUST_VERSION)-$(RUSTC_HOST_NAME); \

  The parenthesis are not necessary - make already starts a sub-shell for every 
line, there's no need to add another shell level. We still have them in a lot of 
.mk files, but we try to avoid adding them.


  Applied to master with those two changes, thanks.

  Regards,
  Arnout

> +		./install.sh $(HOST_RUST_INSTALL_OPTS))
> +endef
> +
> +ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> +define HOST_RUST_INSTALL_LIBSTD_TARGET
> +	(cd $(@D)/build/tmp/tarball/rust-std/$(RUSTC_TARGET_NAME)/rust-std-$(RUST_VERSION)-$(RUSTC_TARGET_NAME); \
> +		./install.sh $(HOST_RUST_INSTALL_COMMON_OPTS))
> +endef
> +endif
> +
>   define HOST_RUST_INSTALL_CMDS
>   	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
> -	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py install
> +	$(HOST_RUST_INSTALL_RUSTC)
> +	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
>   endef
>   
>   $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
