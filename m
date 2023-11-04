Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32113C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BEF81C58;
	Sat,  4 Nov 2023 21:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BEF81C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRKc87622Sw8; Sat,  4 Nov 2023 21:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A18081004;
	Sat,  4 Nov 2023 21:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A18081004
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6F11BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EBF340221
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EBF340221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLk9t-bBGmFr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:59:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49E75401F5
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E75401F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2EEE240006;
 Sat,  4 Nov 2023 21:59:51 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:59:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104225950.1b294a18@windsurf>
In-Reply-To: <20230930221051.231730-1-fontaine.fabrice@gmail.com>
References: <20230930221051.231730-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699135192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDlKxjb/RQL8IX5OFhQ6X+nMlx3+ZXXElLq3pxV/dCM=;
 b=PHI3oJDySRnKqRqqRFytMZeqcsyNBT99xB4NGRIiJS5uxX4hun4GDdLNFLmqDP/HcgCcSV
 /5+qpUVlvINbZ2CRQNl05cSrADIp39vmz+BjnXFm/j4YjjgznO5o/q+LAX4WqvaQloxwi2
 GMy98gaOarXpfs5B9dVnxawHb6l52qZ2VcYWZlP0bd62xkQx8vPMlY/zShA+lXR9gTPF/w
 aTSbNFgwPsUAGjyi32LbM/7rhxIzJJv7gtCnNXDVfDnr/FMdwU71r5Dj9yvY4+JcWoZyKs
 hYebkxwJmaysLc/UyNwrW4bcNJt91M1avbgY3mz4m05fEApGcb0RpMQM+dgEeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PHI3oJDy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-numpy: needs gcc >= 8
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  1 Oct 2023 00:10:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-numpy needs gcc >= 8.4 since bump to version 1.25.0 in commit
> ca63464e3777ca2596b4d396accb6a384ccf8514 and
> https://github.com/numpy/numpy/commit/4002a7d421ff10780c28a3643683af7a9754f87f:
> 
> ../output-1/build/host-python-numpy-1.25.0/meson.build:30:4: ERROR: Problem encountered: NumPy requires GCC >= 8.4

Then we need to require gcc >= 9, because BR2_TOOLCHAIN_GCC_AT_LEAST_8
or BR2_HOST_GCC_AT_LEAST_8, only guarantee gcc 8.x, not 8.4, so a user
with gcc 8.3 would still be in trouble.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
