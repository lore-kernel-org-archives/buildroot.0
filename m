Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDF7C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51FAE40B39;
	Wed, 24 Aug 2022 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51FAE40B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xm0HDD665fkp; Wed, 24 Aug 2022 10:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 755F440B0E;
	Wed, 24 Aug 2022 10:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 755F440B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8E1B1BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A6C8135A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A6C8135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2yeWLD5p6W0 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:40:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DD481373
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43DD481373
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:40:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1EDC2000A;
 Wed, 24 Aug 2022 10:39:59 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:39:58 +0200
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220824123958.464d0803@windsurf>
In-Reply-To: <20220824030229.2531548-4-chris.dimich@boundarydevices.com>
References: <20220824030229.2531548-1-chris.dimich@boundarydevices.com>
 <20220824030229.2531548-4-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661337601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BNxOLYWBPzoT5/+Z6QexFnXkyywHZG6Alw89JWjlsA=;
 b=pGEnOaSZ+t6YuUWY3puHMdAcifA7wrxt4z1XBcQ5AQgVrJx1vkWhWTvvdKSgZ632ANS2gA
 PVFExLFYj6YITY+CJNLyDWtmQ8pPZLw6rm3N4UTradlGnqPtu/kUkh+g5A75ht+UD8wyGS
 hEapmkPoEPAn+lBdI6HHQydGDYjmDHfQfwdpu+keRVR+N1uUO0WAZbD8NSNATXuzaem6TO
 c1RY9L83/bP91o/LELXjlW7+Mo+JwhpDbt4xq79oflwTZwdIRJEwAzMLKntijxqsf/3Zlx
 m9LIp8sN5qw9W1suI3jko9DJL4oIsPyEb2W9FRiWRrOeLvH644P/piJlmItlFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pGEnOaSZ
Subject: Re: [Buildroot] [PATCH 2/2] configs/nitrogen*: bump u-boot revision
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Aug 2022 20:02:29 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> To latest v2020.10 rev (1d21a3d5)
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>  configs/nitrogen6sx_defconfig | 2 +-
>  configs/nitrogen6x_defconfig  | 2 +-
>  configs/nitrogen7_defconfig   | 2 +-
>  configs/nitrogen8m_defconfig  | 2 +-
>  configs/nitrogen8mm_defconfig | 2 +-
>  configs/nitrogen8mn_defconfig | 2 +-
>  configs/nitrogen8mp_defconfig | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
