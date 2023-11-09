Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6EBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 12:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97FF060A9B;
	Thu,  9 Nov 2023 12:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97FF060A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIsVKiGpkBmm; Thu,  9 Nov 2023 12:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7D160A66;
	Thu,  9 Nov 2023 12:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7D160A66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B61E91BF40F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605A541E62
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605A541E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgPMQlTz8XVa for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 12:53:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6AD541E56
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 12:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6AD541E56
Received: by mail.gandi.net (Postfix) with ESMTPSA id C681A1C0003;
 Thu,  9 Nov 2023 12:53:37 +0000 (UTC)
Date: Thu, 9 Nov 2023 13:53:36 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231109135336.14df3d9f@windsurf>
In-Reply-To: <87cywjp4h0.fsf@48ers.dk>
References: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
 <87cywjp4h0.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699534418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUcgR3BhKTW0qoppfGm1OqeUYWuwSN1Zg5PSohfyXIU=;
 b=T0k9Amk1Rb1Z6Qy3DTEWrfg3g4MftUTls3mWYDFvXDdpa8ahJHW+0h8MWiKV7OrIG4eDQx
 7OdIL8EhyeXZz1GWFA+wxHDT1SDpVhm/HsZDcsRWJCaztOzjSuZD99/mP8bCLN037rIOlK
 UMUYfdj7aOllJ8Jv6eHV0VU/Dp02jZ8OlvXlIgS96G8huHpDfdbN3kaXx55FfarwefqiZA
 hMxls+cRLLKq5GsmuOyyMWy74aTRPQIOCgkS7EbLeiwdg8a/+O2fOzZyKJ2sGdOeVklI5l
 kZ568xCVJU3xG8tg0Ux/tHVYfXH0wZC9LYblYjGAgfqJgcqeOUZOxuFXuiRwrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T0k9Amk1
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: select linux-pam if
 refpolicy upstream is selected
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 09 Nov 2023 12:10:19 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > +	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION  
> 
> Hmm, we cannot do that without taking the dependencies on linux-pam into
> consideration:

Dang, I totally missed that indeed :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
