Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F58C5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648F5405CC;
	Sun,  1 Jun 2025 10:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KQpDBXLzZde; Sun,  1 Jun 2025 10:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE274056F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE274056F;
	Sun,  1 Jun 2025 10:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE13222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0D604043F
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yL3TnTVk1ucw for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94684400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94684400AB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94684400AB
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:40:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2CC043B16;
 Sun,  1 Jun 2025 10:40:54 +0000 (UTC)
Date: Sun, 1 Jun 2025 12:40:53 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20250601124053.5b2f0ced@windsurf>
In-Reply-To: <20250601101305.3198541-5-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
 <20250601101305.3198541-5-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeehjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvtdelgfduiedtgffgkeelieektdeifefhleehfeevfeekhfetudduffetgeevgfenucffohhmrghinhepqhhtrdhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemvddthegumeekfhgskeemfegsvdejmeduvdgvieemsggttggrmeekheelpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748774455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCAk2pHr7/Nk9Y8fr2gfV/9uM6W+dgaUfhpN5skcoUA=;
 b=CGaVBi7zM1mMQXRuURa459tuQYHrYmsIu8MfBIlUGdGPZw1Yw/HdcX4qB7JKcoKPJbfO5z
 ouhBdwWDe+w+iHoXhlH7efr1EH85xivng8edLURCzxJBJGudP2PSoDrzsPjCqL9x2athLZ
 nY0B8fm2Kik4huDBtFAQ6VS+Kj/V0b9trkv+dLli4Z677wBz/MmnEnR6Sf4zZTyee14thu
 OhtVJ4QgCBs8n8ahYqIVnsCDJxt4ivR8bpr6fV6vzxFCWN3lTBhONGw836atl/WIyQECaz
 bgmD1ZI3pzddn9UAnbd0cPBUyvUFpzZq9N9SegpWVoGrCLWVBTdX8geJ+O0eqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGaVBi7z
Subject: Re: [Buildroot] [PATCH v2 4/6] package/qt6/qt6tools: fix assistant
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

On Sun,  1 Jun 2025 12:12:58 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> +config BR2_PACKAGE_QT6TOOLS_ASSISTANT
> +	bool "assistant"
> +	select BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT # qhelpgenerator
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
> +	select BR2_PACKAGE_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
> +	select BR2_PACKAGE_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	help
> +	  Viewer for Qt help files (.qch), providing searchable and
> +	  navigable documentation for Qt and custom projects.

Same question: why would we want this on the target at all?


>  if BR2_PACKAGE_HOST_QT6TOOLS
>  
> +config BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT
> +	bool "host assistant"
> +	select BR2_PACKAGE_HOST_QT6BASE_GUI
> +	select BR2_PACKAGE_HOST_QT6BASE_NETWORK # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_HOST_QT6BASE_PNG # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
> +	select BR2_PACKAGE_HOST_QT6BASE_SQL # https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
> +	select BR2_PACKAGE_HOST_QT6BASE_SQLITE # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS # https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
> +	help
> +	  Viewer for Qt help files (.qch), providing searchable and
> +	  navigable documentation for Qt and custom projects.

And even on the host. What is the use-case for this in the context of
Buildroot?

If there's no use-case and you don't need it, better keep it
unconditionally disabled and save some complexity.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
