Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6E9C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB0240FAB;
	Mon, 28 Jul 2025 20:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtocIVDYdHBY; Mon, 28 Jul 2025 20:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B2F40F89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5B2F40F89;
	Mon, 28 Jul 2025 20:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95D0C91D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87FD6605E9
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9c3bOd7PAcVd for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 777DA605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777DA605E6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 777DA605E6
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:57:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D33FC43185;
 Mon, 28 Jul 2025 20:57:55 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:57:54 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20250728225754.108b36eb@windsurf>
In-Reply-To: <20250724202406.958337-1-ju.o@free.fr>
References: <20250724202406.958337-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvleetgeevfeekffduudeiiedtgeejfedutdethfejgfekieekveevudejieehkeenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpghhithhlrggsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvv
 gdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753736276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOueQBWbD0Mb0C2miofQSDK5jBrTjbF/Wq4FPti0+Ts=;
 b=gL8uZzmoxL92nQk8Mr04gG8HEp3EzwGB+b34iNbJGtG7p99DpunwInOaLEQpLSBWK7nt0b
 vO0Y8AZJllB9At6s3Dud6UWTMn+48xvEIPOYK+w0jTsPXNEXgS6kihULHXtzwc39wZmVRn
 AvlcMr5LCjaj+6vK+zxrs7Nsq7pQIoomCEl34jwJ/1ttjgTHCrlhjVWvZB4LOlQ0nmVWIh
 AM9lw3/EJUFZCBAam4NHAhqpsNglZvT9fa0WRt6bXuEdE3kDO+kBFJX6q7jAxVMI/3ne1l
 PRK5XZ1fShucEC+KPBNLMsJFCanNVQrWsDnrgQddx+oKpOh6V5LsT4RpS1lFXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gL8uZzmo
Subject: Re: [Buildroot] [PATCH v2 1/1] package/berkeleydb: fix build with
 host gcc-15.x
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

On Thu, 24 Jul 2025 22:24:06 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Commit [1] fixed berkeleydb target build with gcc-15.x.
> The host variant package also fails when building with host gcc-15.x.
> 
> This commit fixes the issue by replicating the same fix for the package
> host variant.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a8051600ab95a63c852960f8dace757b16c665f0/
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/c1d422edde19d07d6406705b1a4b059125dba689
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The one thing I dislike though about this kind of fix is that we will
never remember to drop this -std=gnu99 option once upstream fixes its
code base to be C23 compliant.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
