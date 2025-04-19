Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B10AC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9C160628;
	Sat, 19 Apr 2025 20:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p56O3iztNKWY; Sat, 19 Apr 2025 20:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F0A60656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F0A60656;
	Sat, 19 Apr 2025 20:32:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 137A868
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10AB3605AE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFudLPuPzH-9 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A15760628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A15760628
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A15760628
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:32:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 260DA4399E;
 Sat, 19 Apr 2025 20:32:03 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:32:01 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250419223201.20f794c1@windsurf>
In-Reply-To: <20250404-libcamera-0-5-0-v1-8-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
 <20250404-libcamera-0-5-0-v1-8-e2ca9d029aeb@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfhhoshhsodgsuhhilhgurhhoohhtsedtlhgvihhlrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdro
 hhrghdprhgtphhtthhopehkihgvrhgrnhdrsghinhhghhgrmhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgrrhgtuhhsrdhfohhlkhgvshhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745094725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/FBx0Ffcitii4c0Sd0aieOgeChgpou95LDf0N1GLQQ=;
 b=IfTroEN+hyyHrt4NXf9tjElexxfNtlFVGJWfH2heYfy3j4qmBAsMlW8eNtDwBpsFq4We7l
 ET0vmPm8J32fgO43Fhi7Pl/h0mt7ut4VO9rnw4JFdVORFTB5ZS2I+oEhcOtGQjugNh4P+0
 8FbMn1wf4veGnnrIhTxMA7v4y3tEDRQnWcOS9BTXbVsHUKj2T48W0xM9ckAObNpzpRmdfi
 XnWbkFt/QUkPTrHZnqUnh+gV20QWI9dKo+3ZN9qta38Q4ooi96JdiVXazcJ1dne70heg1h
 9XdLLSDm7GGmoV6pXIIJWnYqiixw+/OIXLj4CH3kuXuDj6KEVELfxB56B9nAvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IfTroEN+
Subject: Re: [Buildroot] [PATCH 8/9] package/libpisp: add new package
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

Hello Quentin,

Thanks for this new package! I have a number of comments/requests.

First, very minor, the commit title should be "package/libpisp: new
package", not "add new package".

On Fri, 04 Apr 2025 18:47:39 +0200
Quentin Schulz <foss+buildroot@0leil.net> wrote:

>  package/Config.in            |  1 +
>  package/libpisp/Config.in    | 22 ++++++++++++++++++++++
>  package/libpisp/libpisp.hash | 11 +++++++++++
>  package/libpisp/libpisp.mk   | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)

Could you add an entry in the DEVELOPERS file for this new package?


> diff --git a/package/libpisp/Config.in b/package/libpisp/Config.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..8586c31f42914a219538e04fe93b62de38e0daab
> --- /dev/null
> +++ b/package/libpisp/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_LIBPISP
> +	bool "libpisp"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_JSON_FOR_MODERN_CPP

This one should be a "select", not a depends on.

> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 # V4L2_BUF_TYPE_META_OUTPUT
> +	help
> +	  A helper library to generate run-time configuration for the
> +	  Raspberry Pi ISP (PiSP), consisting of the Frontend and
> +	  Backend hardware components.
> +
> +	  https://github.com/raspberrypi/libpisp
> +
> +if BR2_PACKAGE_LIBPISP
> +
> +config BR2_PACKAGE_LIBPISP_LOGGING
> +	bool "enable logging"
> +	depends on BR2_PACKAGE_BOOST_LOG

This should be a select BR2_PACKAGE_BOOST + select
BR2_PACKAGE_BOOST_LOG + propagate the dependencies of boost.

> +	help
> +	  Enable logging
> +endif

Here we need a Config.in comment like:

comment "libpisp needs a toolchain w/ C++, gcc >= 8, threads, headers >= 5.0"
	depends on !BR2_INSTALL_LIBSTDCPP ||
		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 ||
		!BR2_TOOLCHAIN_HAS_THREADS ||
		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0


> new file mode 100644
> index 0000000000000000000000000000000000000000..66a44c0d14c52bf64cecd8eea77b7c3237a815a4
> --- /dev/null
> +++ b/package/libpisp/libpisp.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# libpisp
> +#
> +################################################################################
> +
> +LIBPISP_VERSION = 1.2.0
> +# The manually generated tarball has version.gen in it which is required for
> +# version detection outside of git repos
> +LIBPISP_SITE = https://github.com/raspberrypi/libpisp/releases/download/v$(LIBPISP_VERSION)
> +LIBPISP_SOURCE = libpisp-$(LIBPISP_VERSION).tar.xz
> +LIBPISP_LICENSE = BSD-2-Clause

BSD-2-Clause, but there's the text of many other licenses? Could you
clarify the license terms? How can it be BSD-2c if it contains GPLv2,
GPLv2+ code?

> +LIBPISP_LICENSE_FILES = \
> +	LICENSE \
> +	LICENSES/BSD-2-Clause.txt \
> +	LICENSES/CC0-1.0.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/Linux-syscall-note.txt \
> +	LICENSES/MIT.txt
> +LIBPISP_CONF_OPTS = \
> +	-Dauto_features=disabled
> +LIBPISP_INSTALL_STAGING = YES
> +LIBPISP_DEPENDENCIES = \
> +	host-pkgconf \
> +	json-for-modern-cpp
> +
> +ifeq ($(BR2_PACKAGE_LIBPISP_LOGGING),y)
> +LIBPISP_CONF_OPTS += -Dlogging=enabled
> +LIBPISP_DEPENDENCIES += boost
> +endif

Otherwise, looks good! Could you spin a v2? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
