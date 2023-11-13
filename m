Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C388EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 09:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 489DF416C3;
	Mon, 13 Nov 2023 09:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489DF416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxuJtDgUzCvz; Mon, 13 Nov 2023 09:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA8E041527;
	Mon, 13 Nov 2023 09:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA8E041527
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAED81BF355
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 09:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C288860D65
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 09:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C288860D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjrbifS4dU7l for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 09:06:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D641F60B1D
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 09:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D641F60B1D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E45C60011;
 Mon, 13 Nov 2023 09:06:18 +0000 (UTC)
Date: Mon, 13 Nov 2023 10:06:17 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231113100617.593156cc@windsurf>
In-Reply-To: <b04d5636-191d-4102-a6cc-83997aeb3671@mind.be>
References: <20231109080919.530366-1-jonhenrik@qbee.io>
 <20231109112504.34c46c6e@windsurf>
 <b04d5636-191d-4102-a6cc-83997aeb3671@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699866379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T8eLMEkG3pHmJahImFO0PEF6vHRxpEpmFtj6ItGcms=;
 b=Y4MMvIIN796CIwbSr+FF7MnAMQ21AC571kCADMKGnUUHQXCsOb3EB68xyUaEI4W/zBiOMm
 POQZZTC3dyQGCsN0fNn+6TymwQ4rYkIYtGKu/f+9uh8Lv/UgreGxsgxPn0Xf7RLdBSO23w
 XvG440YYEb/FGLHl+f9ixn8BUTCucXDK6XmLuCUDxPDTviULsIF8PXVtx/7g6F3ajPkjkg
 Z2zA5oJY9CxCEAg0MS3t4qWaOSe5LJXoBex12Hl0ALhaIYevoprHVtS4BvZsEGkAL0ANZh
 fExzmDtK/2NqsxEf4GacZJ58CpZwk6jOkLXvkVD5wgckcEyKqJs+uHDkyhMJ7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y4MMvIIN
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= <jonhenrik@qbee.io>,
 Jon Henrik =?UTF-8?B?QmrDuHJuc3RhZA==?= via buildroot
 <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 Nov 2023 19:56:41 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> >> +	$(INSTALL) -m 0600 $(@D)/qbee-agent-$(QBEE_AGENT_VERSION)/share/ssl/ca.cert $(TARGET_DIR)/etc/qbee/ppkeys/ca.cert  
> > ... just add -D as an option here, which will create all needed
> > destination directories.  
> 
>   No, with -D, the mode of the directory will be 0755 instead of 0700, so you 
> want to create the directory explicitly here (that is, assuming that 0700 is the 
> proper mode for the directory, but for something called "ppkeys" it sounds that 
> that would be the case.

Ah, indeed, makes sense!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
