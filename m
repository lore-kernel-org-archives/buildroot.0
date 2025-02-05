Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0874AC02198
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C56BC812BA;
	Wed,  5 Feb 2025 15:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hde1XT-tuYx4; Wed,  5 Feb 2025 15:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0803812A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0803812A8;
	Wed,  5 Feb 2025 15:00:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6268CCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D65F40BA4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qqsnk6vsouj for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05F20409BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05F20409BD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05F20409BD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:00:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BA3F441BE;
 Wed,  5 Feb 2025 15:00:44 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:00:43 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ian Merin <Ian.Merin@entrust.com>
Cc: Ian Merin via buildroot <buildroot@buildroot.org>, "jezz@sysmic.org"
 <jezz@sysmic.org>
Message-ID: <20250205160043.288fabbf@windsurf>
In-Reply-To: <BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
 <20250205153353.1f380f10@windsurf>
 <BN7PR11MB2788EEDD81A7788DA6F9FC2AFFF72@BN7PR11MB2788.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdeigfetheeffedvgffgudffgfeigefhtdevhfefkeejhfevheejheejvdfhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgtohhnfhhighdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopefkrghnrdfovghrihhnsegvnhhtrhhushhtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjvgiiiiesshihshhmihgtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738767645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vWnHGSKIXcX4zUfDYUf51RZvrd5gxyl6SqK6O+l3pYg=;
 b=lKyJLFHmaN8/BOgtRhqkVOkK4An7mLsshJhSrYX2jB4bDZhZ6+CSqLTlrHztZK3Td7iQkd
 qaXu+IzGND7sGkn6YKDCLEwWACOopbnXz/sAxyHwOdSg5g2wkrSYdkSZ5DrAarkhfw1r0A
 5wW3AAAh0M5ipP5MZvw1PCFEnP+myUDf5OWZiFG/M/wVk/hh9oRIRW/SCC5g9RVmIbPs+l
 jelRXrjy3VTcKlsX57/8yM62Su5xflxeyR2s+2vKp4L0o94B0RkxGLnfKkQFMbB/uPV1aN
 xBnjWrPpXAXhepkE3TvT3Hb4LVbDyKLBK7kXG+gaPY8kAYQ+Z0dmQtJ03RtZSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lKyJLFHm
Subject: Re: [Buildroot] [EXTERNAL] Re: [PATCH] package/lxc: add libapparmor
 optional dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ian,

On Wed, 5 Feb 2025 14:49:37 +0000
Ian Merin <Ian.Merin@entrust.com> wrote:

> BR2_PACKAGE_APPARMOR certainly does exist, and the patch works for me as written:
> 
> https://github.com/buildroot/buildroot/blob/master/package/apparmor/Config.in#L1
> 
> BR2_PACKAGE_LIBAPPARMOR is selected as a dependency of BR2_PACKAGE_APPARMOR

Sorry, I missed that. I had only enabled BR2_PACKAGE_LIBAPPARMOR in my
configuration. However, it doesn't really make sense to have a
condition on option XYZ and then depend on another package. Here the
dependency that's needed by lxc is indeed libapparmor, which is the
dependency you added in LXC_DEPENDENCIES:

+LXC_DEPENDENCIES += libapparmor

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
