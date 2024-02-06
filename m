Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90CBC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B4286104A;
	Tue,  6 Feb 2024 13:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B4286104A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHmUhFInBQwj; Tue,  6 Feb 2024 13:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B1F60F82;
	Tue,  6 Feb 2024 13:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B1F60F82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEDCF1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F55A60E2E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F55A60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVwoh4gsaHkc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:39:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EE76605A5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EE76605A5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 854BBFF802;
 Tue,  6 Feb 2024 13:39:26 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:39:25 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240206143925.24537bba@windsurf>
In-Reply-To: <018bc3f7-2ae5-4d36-8c6b-485f41b4f319@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-5-marleen.vos@mind.be>
 <20240206142549.2ad91f3b@windsurf>
 <018bc3f7-2ae5-4d36-8c6b-485f41b4f319@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707226766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux/CmmrnLTfHpVAjhk14SCfOeCOOWS8OjqA+9sjutlY=;
 b=WSxLh76FG58Ee9BjVhAsnO6jM5H1hVPIMwIxhR4m2VVI6VP21xcOpgotXZ2pac5XEhY/Yl
 zLyn/v9HFYWAUr9D++X4nVdteKU/bRH4UFJv1mRX4OPvb5/D/jjs3BNS/eD/f2SgDzYzEn
 Kbvw77EWfz5ElpqcKId4FQntlANaUGOIiOe52xAnnZeqANOtOAxsJ/KP9aPQdm3X9gicTP
 agSwXFVD0o6FvJWi+whHBo75f1UsqMXC7XEic1lbox69lbPmPsYJl/WoMoFkHKiM5JHj+Z
 +AUekzvZ0DvmJJJq76Z3NwiNsK/n0wVSnLdsHJCBslbMT1YFgsRgQCb2afeB4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WSxLh76F
Subject: Re: [Buildroot] [PATCH 4/7] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com,
 Marleen Vos via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 6 Feb 2024 14:38:31 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Thanks a lot for this patch. However, I don't think we want to add
> > explicit choice options for all "random" versions of TF-A.  
> 
>   This is the current situation however:

Yes, but there is no explicit choice options for all those versions.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
