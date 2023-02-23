Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0665CC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 430C640547;
	Thu, 23 Feb 2023 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430C640547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3mOXPtDo1iw; Thu, 23 Feb 2023 21:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D2C140528;
	Thu, 23 Feb 2023 21:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2C140528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699B61BF33A
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 176D94183D
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 21:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 176D94183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aIY4dK-Axj3 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 21:42:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BF74183C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93BF74183C
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 21:42:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 544CE1BF209;
 Thu, 23 Feb 2023 21:42:02 +0000 (UTC)
Date: Thu, 23 Feb 2023 22:42:01 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230223224201.0e351b16@windsurf>
In-Reply-To: <20230223062259.GJ2718518@scaer>
References: <20230222143512.1555539-1-fontaine.fabrice@gmail.com>
 <20230223062259.GJ2718518@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677188522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaj4iMVQbWydNhGRLVl4W1uR1CV4rlWoSZxdd4GnP4c=;
 b=hXTILixyIpiIv5ZwKyi5yxGQgfpAOh17i5LVxlDzO7vB61VMHJnem9nUmcwzCqWNRomUsR
 R+o30QXNPAULxof+nemDXJhRx3/2YuK5ZlCwna/eyJN4oWbvvSdVXwMyaJ//ORin6bAoln
 nfmMjtxxmWh4FCTU7qGMhBkrTa6pNm6rHHUXgtMk2DQMd52kdSB1DQeYT9hVnQoHgYi20W
 ON4KDKXUNl5WjNMAu1pNlBd+0te7zMVBdfM41elwTCTLQa659D/tTQ+Cwf2K0fr7Qc2n/r
 faPhrKuG9yxPljM7SBKWg3riUUB3kH/YleZOQCsY7CA9r1ZoaNLkWaVLhOwl+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hXTILixy
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: force arm mode instead
 of Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Thu, 23 Feb 2023 07:22:59 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +# src/libev has some assembly function that is not present in Thumb mode:
> > +# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
> > +# so, we desactivate Thumb mode
> > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> > +AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> > +endif  
> 
> But then it would not work on systems that have a armv7m: BR2_cortex_m3,
> BR2_cortex_m4, or BR2_cortex_m7.

BR2_ARM_INSTRUCTIONS_THUMB is for "classic" Thumb, not Thumb2.
BR2_ARM_INSTRUCTIONS_THUMB2 is used for Thumb2 platforms, such as
ARMv7-M.

So the above condition will only trigger for ARMv4/ARMv5/ARMv6 cores,
and they all support both classic Thumb and regular ARM instruction set.

So to me, the above proposal from Fabrice works fine.

> I looked at the code, and it's going to be very complex to patch it to
> support armv7m, i.e. thumb-only.

Thumb2-only, which is totally different.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
