Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE461C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D3F41763;
	Wed, 21 Sep 2022 20:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D3F41763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-QRhAoAOXaG; Wed, 21 Sep 2022 20:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B827410C4;
	Wed, 21 Sep 2022 20:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B827410C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5C11BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5835C60B9F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5835C60B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILf7-A-7Fxc2 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D92260AD0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D92260AD0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 87BD9C0004;
 Wed, 21 Sep 2022 20:09:32 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921220931.6ad0cab2@windsurf>
In-Reply-To: <20220917212551.268739-1-fontaine.fabrice@gmail.com>
References: <20220917212551.268739-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MliM3gz7cftxNPeitGHinw24HjbyCk91lKeF6e54Xqs=;
 b=BimMwteSc0R5/v3qZp5IiYdtTf5uWG+/gmJ2O/4fXPQ8Qf+Xl/LwNpUiteHnnXBgnqt8gq
 T0xpdDc3qnlGBlaJKT0BxRDgEM3rBeb1VmseXC3lJaswXdEnsLO2oB9ILsoX4E4wDyeFqU
 c7TK9GGeTVh9fCo56jkuwk36iKFmMYrjoViV0X8xqYkpDgJMACXwZ9vzxA7P3+ZNwH77Kt
 456s8jARXlbgRJUEAi60PUh+X3TzdiVN7Dyvk6yFXZCONpAmDPdk3MncB5dJpyiB71OwLI
 eiijT+NMteyVjyyIyQB7Y5M1XnLxypspJiyIJU/ElV4csf8AklLicutM+pkMrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BimMwteS
Subject: Re: [Buildroot] [PATCH 1/1] package/liburcu: bump to version 0.13.2
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 23:25:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/urcu/userspace-rcu/blob/v0.13.2/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liburcu/liburcu.hash | 4 ++--
>  package/liburcu/liburcu.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
