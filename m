Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADE0ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94DE83F6B;
	Sat, 17 Sep 2022 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94DE83F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVU6xRrNMGZ6; Sat, 17 Sep 2022 16:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C81F83F63;
	Sat, 17 Sep 2022 16:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C81F83F63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224211BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02FC9607C1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02FC9607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QD657-j8_k4t for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:12:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4226117B
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF4226117B
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:12:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0723D200003;
 Sat, 17 Sep 2022 16:12:01 +0000 (UTC)
Date: Sat, 17 Sep 2022 18:12:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220917181200.7203d383@windsurf>
In-Reply-To: <20220901213356.967671-1-pevik@seznam.cz>
References: <20220901213356.967671-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663431123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ExvYUkkGfzP/+iQeHzBLrB955fXQVDwIbJfbm0S1xk=;
 b=EG8Bxry7ipwq47qJy70b6CVKnT34ddLx1Z+r52wJ1gEeGwPB0mBkk2ewi78v6Q4Jj6XzFC
 WhCTnod+o5VCD6C+P+dwh05ZE0BNXC2JoyF0p4jbDoEMDXD55p0nZNzmASWHbFNnjN6ZCG
 RvBpvemXfAnDQey8zwaNESSfpwQ07eGH7uc15amLCfx+O3SpezH2fAVKGGe6rS/0fRDU2Z
 pW+CDeRob6O2JVkxt72OxdxZm3WSBg9FMpGNp24Av0Yga/CJ2CdMEE4+q038OHcJAPrUQb
 Bd6Jpwj6pWaCdFs8P6QS9sWKDrSThy04x4ayccyS/IKHbmPIuWA/QZbhecLlAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EG8Bxry7
Subject: Re: [Buildroot] [PATCH v2 1/1] package/iproute2: bump version to
 5.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Sep 2022 23:33:56 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Adjust CFLAGS to be able to compile on uclibc-ng < 1.0.42.
> 
> Remove patch from this release, backport 3 patches fixing build from
> upstream.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Add -Dstatic_assert=_Static_assert to CFLAGS to be able to compile on
> * uclibc-ng < 1.0.42 (thanks Arnout!)

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
