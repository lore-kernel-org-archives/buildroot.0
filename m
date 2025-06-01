Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A1C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BCF41D87;
	Sun,  1 Jun 2025 10:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQXvcj2fO5OQ; Sun,  1 Jun 2025 10:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3682641D89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3682641D89;
	Sun,  1 Jun 2025 10:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4FEE222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4E34043F
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7otTVbaHyMDs for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A984E400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A984E400AB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A984E400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:38:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39ABE43B01;
 Sun,  1 Jun 2025 10:38:45 +0000 (UTC)
Date: Sun, 1 Jun 2025 12:38:43 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20250601123843.12330c4b@windsurf>
In-Reply-To: <20250601101305.3198541-3-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
 <20250601101305.3198541-3-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeehjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoo
 hhtrdhorhhgpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748774326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJSNC1PE0ql45N1GhT0cm8mdab7wx9G/2/6cidH8oXg=;
 b=H2QFGorufT2U+ol8bGpKTeyQzzXMvCwF0IEJrkkESh6LSp3Ew0gP49pjeLjWCEFxuAwVZB
 zwy8oKbSDU5y4iz2lrmYEtbLP3ASfqHBDih9bw8Cob3VT+xG7sjwQ+KpcG96JPgIFDy8RJ
 cT5Eae1LyCyQZ3m5y5iSSQCEpuarRio36UKyALb0UYPODf3QVMiuBfYtuspK0DyiUZKWov
 VCsuUrIBPzJ7FlwxF+ApaLHL5K+GfQNbvKCPkhfwKujDcnJGu3sedhIAfiC0O03zr2l/TS
 Felv/nnVAC2x61WUrlGbWpCxBJZ9dZN1kUcqVSmA1VbSId1pTzPTMDhUcHninA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H2QFGoru
Subject: Re: [Buildroot] [PATCH v2 2/6] package/qt6/qt6tools: fix linguist
 build failure
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

Hello Roy,

On Sun,  1 Jun 2025 12:12:56 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes:
> -- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
> CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
>   Failed to find the host tool "Qt6::lconvert".  It is part of the
>   Qt6LinguistTools package, but the package could not be found.  Make sure
>   you have built and installed the host Linguist module, which will ensure
>   the creation of the Qt6LinguistTools package.
> Call Stack (most recent call first):
>   <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
>   src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)
> 
> The above error can be triggered by the following defconfig:
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6BASE_GUI=y
> BR2_PACKAGE_QT6BASE_PNG=y
> BR2_PACKAGE_QT6BASE_WIDGETS=y
> BR2_PACKAGE_QT6TOOLS=y
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks for the new iteration. However is Qt Linguist really a tool that
would be useful on the target? Isn't this a GUI tool used during
development, so something totally useless on the target, and that we
could disable unconditionally?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
