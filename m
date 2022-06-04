Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A9C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 10:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA00241C96;
	Sat,  4 Jun 2022 10:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_KHW1d6eBnR; Sat,  4 Jun 2022 10:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51FB241B46;
	Sat,  4 Jun 2022 10:13:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96CC41BF414
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 10:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 861EB84434
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 10:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acvXpWtE-s5V for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 10:13:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97B8584430
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 10:13:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 750475FF20;
 Sat,  4 Jun 2022 12:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654337629;
 bh=GFy6vj4gJModLAc5mqw4Q4PMkp8kYGoPTqvtX1KwUGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZE6ojrG9aDnKcLFa+miTYrA/JEoYeNZRCHL7V2wFFz16m/yC4ZYg7CL5GOBTJbJdN
 knfJPiBeE9zFGZOH7SvcYjkmkYbgMI+XuFycWleuvvVVnQyGdmXn1xMTfD6aZKM3Wv
 7SDDrTw/9wZbCBFOX1Ahl71eAG15SnDAOw2KL9Kt3GJSmB+iC+AzWrDvjNVtG6Ug1r
 GalbeHubOLDKTnDRqLK/AftEyATTn1XQVC3UKzlJSiY9Uqg0Kl5uYbRIknnqgJbvWj
 9wv1kYdMVdiHlCkDbItK9Afk2aVCvT/v0rFgunLrf4qmUgXbBOvEGDFFBHt/Pa77nw
 S+MuDiXvIEdQQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 12:13:46 +0200
Date: Sat, 4 Jun 2022 12:13:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David GOUARIN <dgouarin@gmail.com>
Message-ID: <20220604101346.GH427639@scaer>
References: <20220330160436.16357-1-david.gouarin@thalesgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330160436.16357-1-david.gouarin@thalesgroup.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix build with
 BR2_ENABLE_DEBUG
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-03-30 18:04 +0200, David GOUARIN spake thusly:
> When building with BR2_ENABLE_DEBUG, cargo packages are first built with --debug,
> then the installation step rebuilds the sources in release mode with cargo install.
> This is because cargo install forces a rebuild when the --path option is used.

So, should we also be passing  --path ./  at build time too?

> This patch adds a --debug to the cargo install command line as a workaround when
> necessary, but it does not address the root cause, which is that cargo install
> will rebuild the sources, possibly with different build options.
> For example, when one use PKG_CARGO_BUILD_OPTS = --features myfeature, one must
> also use PKG_CARGO_INSTALL_OPTS = --features myfeature.

You mean, something like:

    diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
    index f7e3f39503..bc697ea6c1 100644
    --- a/package/pkg-cargo.mk
    +++ b/package/pkg-cargo.mk
    @@ -90,6 +90,10 @@ endif
     # listed in <pkg>_LICENSE.
     $(2)_LICENSE += , vendored dependencies licenses probably not listed
     
    +# By default, the same set of options must be pass both at build time
    +# and install time.
    +$(2)_CARGO_INSTALL_OPTS ?= $$($(2)_CARGO_INSTALL_OPTS)
    +
     # Note: in all the steps below, we "cd" into the build directory to
     # execute the "cargo" tool instead of passing $(@D)/Cargo.toml as the
     # manifest-path. Indeed while the latter seems to work, it in fact

> Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
> ---
>  package/pkg-cargo.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..cf5ee2ae54 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -155,6 +155,7 @@ define $(2)_INSTALL_TARGET_CMDS
>  		$$($(2)_CARGO_ENV) \
>  		cargo install \
>  			--offline \
> +			$$(if $$(BR2_ENABLE_DEBUG),--debug,) \

At build time, we do it the other way around:

    $$(if $$(BR2_ENABLE_DEBUG),,--release)

so I believe this is exactly what we should do here as well, unless
there is a good reason to do otherwise (in which case it should be
explained in the commit log).

Regards,
Yann E. MORIN.

>  			--root $$(TARGET_DIR)/usr/ \
>  			--bins \
>  			--path ./ \
> -- 
> 2.17.1
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
