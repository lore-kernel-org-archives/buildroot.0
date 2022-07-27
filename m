Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F61C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EAE80CE0;
	Wed, 27 Jul 2022 07:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8EAE80CE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9O8NOp-z7egG; Wed, 27 Jul 2022 07:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32EE80C1D;
	Wed, 27 Jul 2022 07:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32EE80C1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8A71BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F71B40356
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F71B40356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSPQhfGExP3S for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:13:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D3340339
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D3340339
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:13:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF48C1C000A;
 Wed, 27 Jul 2022 07:13:32 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:13:31 +0200
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <20220727091331.00d0280f@windsurf>
In-Reply-To: <VI1P190MB04938F3268FC60B09BB31E5C9F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493383AF3C4D4BA08C5CDC09FCE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20220726233127.1ceaeee9@windsurf>
 <VI1P190MB04938F3268FC60B09BB31E5C9F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658906013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alwbVITJJK/3Zbn3e1VXcwdW5yiSAtUcl7FI7CfKg7A=;
 b=CA43QAbWWw8kiu7BzUcHvWKuii844gPkeP3GRYOA+N2mecaMcFeaS4Y2fGwElg8/wCwzxR
 C8Olmc71KzwTS2s5hvKRDP32KTPMJOrKw632bSCleV6v7L46wMoR125b5FNRmyhKZkbeNX
 bOq+XhRSWHUFfN+NZOcnY1dzhMuvg0Ox+rpljoLIs1QWAeKTgB84R746Yo8+A9F2Ojq0ts
 mqy2DLxcQu+ltDFTNkklaBrSYFmbVuW0fwGfWMs0f1PdSsf3o/t7F+TduDL5E8y6fhWnO4
 695z+VQb7mjReKxoxzXxx+PElD6Wklvw3XT0/5mYQ3BnDaekhaufb1TVZDh0YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CA43QAbW
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: handle white spaces in
 sysroot path
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Wed, 27 Jul 2022 06:36:14 +0000
Lang Daniel <d.lang@abatec.at> wrote:

> I came across this problem while using paho-mqtt-c with a staging path
> that doesn't contain spaces, but the package creates
> "$(STAGING_DIR)/usr/share/doc/Eclipse Paho C/" - which contains
> spaces. When changing/updating the external toolchain that we use,
> the subsequent build failed:

Aaah! Thanks for the extra information, makes sense. I think it would
be good to fix this maho-mqtt-c package to not use paths with spaces,
though.

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
