Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D514BC5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD0A40C69;
	Fri, 30 May 2025 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6odKo6D910Dl; Fri, 30 May 2025 19:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88E540C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88E540C6B;
	Fri, 30 May 2025 19:55:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B8F127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA2740C6B
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M147B8vf7EEK for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C4DC40C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4DC40C69
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C4DC40C69
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:55:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B12143B51;
 Fri, 30 May 2025 19:55:36 +0000 (UTC)
Date: Fri, 30 May 2025 21:55:34 +0200
To: mscdexdotexe via buildroot <buildroot@buildroot.org>
Cc: mscdexdotexe <mscdex@mscdex.net>
Message-ID: <20250530215534.1d515afd@windsurf>
In-Reply-To: <CAPqAjCxGOApih6xj_6Nj-RUUsguzUjtLyp5qa6Zv4p9sw4NAWA@mail.gmail.com>
References: <CAPqAjCxGOApih6xj_6Nj-RUUsguzUjtLyp5qa6Zv4p9sw4NAWA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleeludculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmshgtuggvgiesmhhstgguvgigrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748634936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYP8+AvDk1QPo3tjaRX6F8q8e9ugPMeOsaX7SNoM5AM=;
 b=ECXc5hycVjKpUQKB4GU8EwiNeNaPzMb61qzURcMeq9Ln/bSBBTUXvCkiMgonpmudaZTjha
 LArmtMh5OcNKjGoW2uBcGHYSVS7ISBQwp2ke+FoeUUSVyJfDXnoWBvO0Q9YdRT18u1RD7I
 x9HP/0+ioEuvh97zPD820hJ01KPuzgw4m3Lde6v/5Ep/JB/n7XBeTB3o6LeQfJaJaJl07F
 hUPUDZz5OTgPi1cLOB4FHBcPrEYspBtLtAABLuIr27lH2hFMzq2BxNkjXl6sUiX5csoUJG
 52pNpKVjDYTXTGBeyajN3YmmgAT7/fkSHonEnJTbjCD/qDy9DLjE9RB7DD8ZSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECXc5hyc
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: include lifecycle scripts in
 build-time.log
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

Hello Brian,

On Tue, 27 May 2025 00:21:25 -0400
mscdexdotexe via buildroot <buildroot@buildroot.org> wrote:

> This gives a more complete picture when using build-time.log
> to determine what is taking the most time.
> 
> Signed-off-by: Brian White <mscdex@mscdex.net>

Thanks for your patch. However, your From: doesn't match your
Signed-off-by: line, and your patch appears line-wrapped. Could you use
git send-email to send your patch, and make sure that your From:
matches your Signed-off-by: ?

Because otherwise the change looks good to me. I guess you are the
person you filled the related issue on Gitlab. If that's the case you
can also refer to ths Gitlab issue in the commit log, so that the
person merging your patch will remember to mark the Gitlab issue as
closed.

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
