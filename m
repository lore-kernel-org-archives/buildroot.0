Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DACC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 255D840891;
	Wed,  5 Feb 2025 11:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQJfoxlLnmQk; Wed,  5 Feb 2025 11:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C999040E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C999040E0B;
	Wed,  5 Feb 2025 11:02:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7862812A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 538DE60AB3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3OSzDb3Frg4 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:01:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0673860AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0673860AC6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0673860AC6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:01:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FE5243299;
 Wed,  5 Feb 2025 11:01:56 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:01:55 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205120155.01899b0f@windsurf>
In-Reply-To: <20241219053053.2389046-4-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-4-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeujeffjedviedvtefhhfevudeikefhhfffvdfffedthfejfedvgeeghfelvdehheenucffohhmrghinhepsghuihhlthhinhhsqdhhvgigrghgohhnrdhsohdpshhordhsohdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738753316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VrItoJvfHFUO1XQu48aCcMXZCJhLWCZmHU/4wonW4s=;
 b=cUKS6+xpgklUTvPms8YHm3eATFq8hnO91PLBIAqhSFG/Cj8yYVNvdFRB7F5MMyZdHTB0xC
 fqCVCrUIWtHHIHvvw9nSbUD/NRI4yxpG/lBeFYgSC2IGSJtp2gogMC/C8c5mdwK4jkhuRD
 +DEzGCRVin2YQLHrJYPMPc3WbCHTeJVwNdQ9BqtE+5vDfaTEtVmh8UWCrpGGegPLnQOwjp
 AM+5WNtnYBasGcUswyyeh8liRXgRAhriQ98YZU02QX6p0gB96yoI2Y95lMn8JqPwQ2QWKT
 uDsrsi/pbTb8g1h0EjRLGkwjmcmI0MrRO92CjMRh0a/gYrZ2zbDiokxK1CEM6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cUKS6+xp
Subject: Re: [Buildroot] [RFC v2 03/14] toolchain/toolchain-external: add
 hexagon support for toolchain-wrapper
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 18 Dec 2024 21:30:42 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>

This commit needs a non-empty commit message. Also, I don't think this
commit is really hexagon related, but more Clang related.

> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c08bf0a653..d45f2c54de 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -150,8 +150,14 @@ endef
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> +ifeq ($(BR2_hexagon),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libc.so libclang_rt.builtins-hexagon.so*
> +TOOLCHAIN_EXTERNAL_LIBS += libc++.so* libc++abi.so* libunwind.so*
> +TOOLCHAIN_EXTERNAL_LIBS += ld-musl-*.so*

None of this is hexagon related, to this exception of
libclang_rt.builtins-hexagon.so*. So this should be organized properly,
with I guess libc++.so* libc++abi.so* being added when
BR2_TOOLCHAIN_EXTERNAL_CLANG=y. Perhaps
libclang_rt.builtins-$(BR2_ARCH).so* as well.

I'm not sure about libunwind.so*. Also unclear why ld-musl-*.so* is
needed here, and not for other musl toolchains. To be clarified.

> +else
>  TOOLCHAIN_EXTERNAL_LIBS += libc.so
>  endif
> +endif
>  
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
> @@ -283,7 +289,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>  		*-ar|*-ranlib|*-nm) \
>  			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
>  			;; \
> -		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
> +		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc|*clang) \

Related to clang support.

>  			ln -sf toolchain-wrapper $$base; \
>  			;; \
>  		*gdb|*gdbtui) \
> @@ -465,6 +471,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  	else \
>  		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
>  	fi ; \
> +	if test "$(BR2_hexagon)" = "y"; then \
> +		SUPPORT_LIB_DIR=$(TOOLCHAIN_EXTERNAL_BIN)/../target/$(TOOLCHAIN_EXTERNAL_PREFIX); \
> +	fi ; \

Is this really hexagon specific? Or specific to Clang? Or specific to
the particular external toolchain? I'm pretty sure the BR2_hexagon
condition is incorrect here.

Are there other Clang external toolchains, for other CPU architectures,
that we could use to test what is generic Clang stuff vs. what is
perhaps Hexagon-specific?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
