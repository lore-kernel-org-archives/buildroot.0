Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08984C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F3D60EC4;
	Fri, 30 May 2025 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDfk1bh6IwpP; Fri, 30 May 2025 20:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6C5260E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C5260E6B;
	Fri, 30 May 2025 20:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ADF1127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BD3D83D01
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQVULbp-ROKr for <buildroot@buildroot.org>;
 Fri, 30 May 2025 20:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21A3683CFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A3683CFF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21A3683CFF
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:10:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94341439F8;
 Fri, 30 May 2025 20:10:39 +0000 (UTC)
Date: Fri, 30 May 2025 22:10:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, Zoltan
 Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, Jesse
 Van Gavere <jesseevg@gmail.com>
Message-ID: <20250530221038.28479ac8@windsurf>
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleelfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnheskhhlrghrihhnvghtthdrlhhipdhrtghpthhtohepiihghigrrhhmrghtihesiihghigrrhhmrghtihdruggvpdhrtghpthhtohepsggrgihitghhvgesghhmrghilhdrtghomhdprhgtphhtthhopehjvghsshgvvghvghesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748635840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igkcam/gcKi+lRzpOEuB/T60h5Dre9MzDXRr+BWGwrg=;
 b=U2R58jPyiQtVEkxiPAx+XrFZyukd8qaSAeq3Yv49COVDcci2hRcBzQbzDce4FiFy3s+cRm
 LBcKNmQn7OQrc+mdX2wYQjWRGY27xCj37lcDrrj1D4yJRJAQA3zThlnazD0LeryhLaOd/J
 DBwVZMhl7EWDm2ug/UTJNOMr1YYHK9rSYEZzjY2AABbd3cWgnb+gQCdtjE3sYZ7OJIKg04
 eF0roKYWS7uffpPYr/jwiPxijif2SMLabVr0lb331xvWf5fMWHfgDeJP57U+ja+g7pNykG
 qttXNbYUayXYTaoUHKUt3NC+PklA+ZmBazyVSEeb7q0QcELu7TD8ZqFwOvTAjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U2R58jPy
Subject: Re: [Buildroot] [PATCH v3 00/12] Bump Qt6 to 6.9.0,
 add and fix packages
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

Thanks a lot for this new iteration and this great work on Qt6
packaging!

On Tue, 20 May 2025 13:33:19 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Roy Kollen Svendsen (9):
>   package/qt6: bump version to 6.9.0
>   package/qt6/qt6sensors: new package
>   package/qt6/qt6speech: new package
>   package/qt6/qt6base: add hidden options needed by qt6tools
>   package/qt6/qt6tools: fix assistant build failure
>   package/qt6/qt6tools: fix designer build failure
>   package/qt6/qt6tools: fix linguist build failure
>   package/qt6/qt6tools: fix assistant build failure
>   package/qt6/qt6tools: build without clang support

Could you clarify whether the fixes are needed *due* to the 6.9.0 bump,
or are already valid for the current version of Qt6 in Buildroot?

Indeed your fixes appear *after* the version bump in your series, and
the commit logs of the fixes refer to 6.9.0, but my understanding is
that they are applicable to the Qt6 version currently in Buildroot.

Could you clarify this? In generally, fixes should come before
bumps/improvements in patch series, if said fixes are applicable to
version of software packages already in Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
