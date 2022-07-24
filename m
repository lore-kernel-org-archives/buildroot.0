Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E47C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D07661004;
	Sun, 24 Jul 2022 09:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D07661004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOXA9XL8Altv; Sun, 24 Jul 2022 09:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5638460B56;
	Sun, 24 Jul 2022 09:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5638460B56
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 093E21BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C947B4031E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C947B4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7G-8_kWdORdk for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:22:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93CB240025
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93CB240025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:22:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E190F200005;
 Sun, 24 Jul 2022 09:22:31 +0000 (UTC)
Date: Sun, 24 Jul 2022 11:22:30 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220724112230.6b25b98b@windsurf>
In-Reply-To: <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
References: <20220724073726.A0A3B854E7@busybox.osuosl.org>
 <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658654552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJwzJyPGhTQNBM1uetOwGec4dchMI/8D27e/Y28pVU4=;
 b=dcwPOcFgOeHeFgb4GZx/t6/HVfB7TEp5Mio8K/yTd2DtKkUVsABb2fNYU6iX1DqG7y/2LS
 sNPHHfnMUy3ZBcJFQwHAreo8kN/FTmFZbQwkQ5G9PCJHRXxf0EHWeY9pGF339Ya7HH8uqJ
 CqBNuWMSENOvx8FexlGKP/pDbGSqg23de0WS/kIDLXQlk72k1wISxas2gDw5lLkGF356fE
 oDeHZ2nfbbXwaCj47ArW8/VP8rzRvfiM0knJnS1OiAitCup3QfVnU5X9Pycx9jrvSFCo2C
 UyW2iCnGR//Q0Ynopq48UveVqSwEogI0uvQWZD6IEKQWg9EvvBHJYm+tQkk+Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dcwPOcFg
Subject: Re: [Buildroot] [git commit] package/python-maturin: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Jul 2022 10:32:00 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Should be $(HOST_DIR)/lib here.
> 
> See
> http://patchwork.ozlabs.org/project/buildroot/patch/bc16adfe3d7143105e840072edb169e4cb7354cc.1658007000.git.yann.morin.1998@free.fr/

Good point. Thankfully,
https://patchwork.ozlabs.org/project/buildroot/patch/20220724054912.2354219-17-ricardo.martincoski@gmail.com/
is arriving :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
