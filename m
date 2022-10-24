Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D79C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 17:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855B340235;
	Mon, 24 Oct 2022 17:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855B340235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6TJHiaAtp2-0; Mon, 24 Oct 2022 17:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3026D401F0;
	Mon, 24 Oct 2022 17:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3026D401F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 500E61BF391
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 17:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36FE7401F0
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 17:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FE7401F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KX0hwp9fIz57 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 17:43:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0F8400F6
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB0F8400F6
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 17:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 77228214733; Mon, 24 Oct 2022 19:43:10 +0200 (CEST)
Message-ID: <4441102a-7b71-a4cf-9a9f-8122ebeaeb9b@h6t.eu>
Date: Mon, 24 Oct 2022 19:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20221021224448.3502942-1-james.hilliard1@gmail.com>
In-Reply-To: <20221021224448.3502942-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666633391; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LLFNv2VYe6GO0A85uDFdtPaDs/NAiRK+rs9DZHLxzbc=;
 b=mOdsWFTFMkiii5fHUrNoNrVXlxED4k3s3rvBRnvtBtHNsABpkVPocAABGrQ/pWuHILHdH+
 WVZLKyJpFbDnH9ZH+EtqB7Pw2ywyMPkjOB5NF+R/SZqWw/jzna4XQKXRfGJzsmI6ccJm0T
 YgGcrVDp9N2gxga8MP962yq+VKdabOwNn2T24ig1fExpF1gaim74nV9AyyGdjIYlmlVyhp
 EBHS7wDOXmGiAlh66CfEMob507zOBhQodEwTDP1ivjpEiMPF/Kj61hHCK+Cd2pJllYjraY
 8qQdMffocuCqpVWRQ8uttaC8A5JOFPsFR9SWxJIpJA77yXjfRRYb62o9P/J5Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=mOdsWFTF
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: configure cargo
 profiles
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: Moritz Bitsch <moritz@h6t.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.10.22 um 00:44 schrieb James Hilliard:
> The cargo profile flags currently only select a cargo build flag which
> does not accurately reflect the configured build settings, setting the
> cargo build flag also only works for packages using the cargo
> infrastructure directly and not with other packages using the cargo
> environment such as pyo3 based python packages(which indirectly invoke
> cargo build via the setuptools-rust and maturn python build backends).
> 
> To ensure that cargo uses the correct profile settings for the build
> we need to set env variables for the two root profiles(dev/release)
> based on the buildroot build settings.
> 
> For reference the default cargo root profile settings are:
> https://doc.rust-lang.org/cargo/reference/profiles.html#default-profiles
> 
> As applications not using cargo infrastructure do not have a standard
> way of configuring a specific build profile due to the selected
> profile being determined by the cargo command line flags, the only
> reliable way to configure profile settings is to set both root
> profiles in the environment as this will ensure that they are used
> regardless of which cargo build flag(such as --debug or --release) is
> used.
> 
> Cc: Moritz Bitsch <moritz@h6t.eu>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Moritz Bitsch <moritz@h6t.eu>

> ---
>   package/pkg-cargo.mk | 100 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..4945770079 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -46,6 +46,106 @@ PKG_CARGO_ENV = \
>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>   
> +# We always set both CARGO_PROFILE_DEV and CARGO_PROFILE_RELEASE
> +# as we are unable to select a build profile using the environment.
> +#
> +# Other cargo profiles generally derive from these two profiles.
> +
> +# Disable incremental compilation to match release default.
> +#
> +# Set codegen-units to release default.
> +#
> +# Set split-debuginfo to default off for ELF platforms.
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_INCREMENTAL="false" \
> +	CARGO_PROFILE_RELEASE_INCREMENTAL="false" \
> +	CARGO_PROFILE_DEV_CODEGEN_UNITS="16" \
> +	CARGO_PROFILE_RELEASE_CODEGEN_UNITS="16" \
> +	CARGO_PROFILE_DEV_SPLIT_DEBUGINFO="off" \
> +	CARGO_PROFILE_RELEASE_SPLIT_DEBUGINFO="off"
> +
> +# Set the optimization level with the release default as fallback.
> +ifeq ($(BR2_OPTIMIZE_0),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
> +else ifeq ($(BR2_OPTIMIZE_1),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="1" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="1"
> +else ifeq ($(BR2_OPTIMIZE_2),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="2" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="2"
> +else ifeq ($(BR2_OPTIMIZE_3),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +else ifeq ($(BR2_OPTIMIZE_G),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
> +else ifeq ($(BR2_OPTIMIZE_S),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="s" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="s"
> +else ifeq ($(BR2_OPTIMIZE_FAST),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +endif
> +
> +ifeq ($(BR2_ENABLE_LTO),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_LTO="true" \
> +	CARGO_PROFILE_RELEASE_LTO="true"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_LTO="false" \
> +	CARGO_PROFILE_RELEASE_LTO="false"
> +endif
> +
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_DEBUG_3),y)
> +# full debug info
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="2" \
> +	CARGO_PROFILE_RELEASE_DEBUG="2"
> +else
> +# line tables only
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="1" \
> +	CARGO_PROFILE_RELEASE_DEBUG="1"
> +endif
> +else
> +# no debug info
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="0" \
> +	CARGO_PROFILE_RELEASE_DEBUG="0"
> +endif
> +
> +# Enabling debug-assertions enables the runtime debug_assert! macro.
> +#
> +# Enabling overflow-checks enables runtime panic on integer overflow.
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="true" \
> +	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="true" \
> +	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="true" \
> +	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="true"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="false" \
> +	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="false" \
> +	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="false" \
> +	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="false"
> +endif
> +
>   #
>   # This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
>   # and should be removed when fixed upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
