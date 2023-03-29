Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717F2C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 08:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9FA741DD0;
	Wed, 29 Mar 2023 08:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FA741DD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpRdEeblxtFa; Wed, 29 Mar 2023 08:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E3741DCE;
	Wed, 29 Mar 2023 08:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E3741DCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0A4C1BF59E
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 08:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA04740610
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 08:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA04740610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2iw21SV1tsd for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 08:50:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F187400C7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F187400C7
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 08:50:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84BC824000C;
 Wed, 29 Mar 2023 08:50:23 +0000 (UTC)
Date: Wed, 29 Mar 2023 10:50:22 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230329105022.6137bf1a@windsurf>
In-Reply-To: <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680079824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80NT4lTvBIu0H1ytqlG9k3t1NmEqW4u4/I9A72a0svw=;
 b=JWJyx+Jx05a5hvCzTEe65wcCMdySG6oJAizbwBhVd7QLAeAFGj8IO4zo1mbzUobdqdlXBw
 v8xkJk8f+GuYXwIxmxkUyZHRkHDkd15HauuZvKdzP9ltT5jVFm32B4fYdoxMBhAmJM3VQD
 3xw2rcWcMiUNtPMfW7pvAZdWe0dyg1RlQRKhQljMNOkHeza5EC0EFQogLRC0FfF2UCy23Y
 uswRgLAb1FHvK7Mq+8nMD9td+FcB1Ma0rChGasnPkh9LJrOWs2oR5ARwUBQmhu5k4xpgTL
 0VrIS8fNwkTo2rh0YQrtETwYB6lpcDDApMK8BZUvUydVyQfmdt/eGqIuvsMNLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JWJyx+Jx
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Mar 2023 10:44:38 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Note: if the path header has the upstream commit sha1 and applies as-is
> > (possibly with just a bit of fuzz), then "backport from upstream" is
> > enough. But if you had to rewrite the ptch, and the header does not have
> > the upstream sha1, then add it to the note:
> > 
> >      [yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]  
> 
>   So this would be
> 
> Upstream: backport from 1234CDEF [yann.morin.1998@free.fr]

If we standardize in a format, then it should handle all common
situations. A patch being a backport from an upstream commit is one
situation. But here are several more situations:

- Patch taken from the upstream project, but not merged yet (from a
  pull request, a mail on a mailing list, etc.)

- Patch taken from a downstream distribution (Debian, Gentoo, Alpine
  Linux, etc.)

- Patch submitted upstream by us, but not merged yet (quite similar to
  case 1 above)

- Patch not submitted upstream for reason XYZ

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
