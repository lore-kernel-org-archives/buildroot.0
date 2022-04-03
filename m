Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 08:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 635DB60B60;
	Sun,  3 Apr 2022 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uDetxeoR-6b; Sun,  3 Apr 2022 08:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D8060ACE;
	Sun,  3 Apr 2022 08:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84F091BF2AA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D8E83E64
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GA8QWjg2KEl for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 08:05:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF06083E63
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 08:05:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD4641C0005;
 Sun,  3 Apr 2022 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648973140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=477Cgn2hgA70d8m3zsBhbxIaWfqEc2++WSzI7OuFy7k=;
 b=XV9vsiWim3OpXpu5xUS8beEie/tbmFXfbWXyQ+Kc+JIucUmReNLNlDO8I4kVpodIx18qqC
 nQREWgw07D6H+Md3SXBEdZ5mkIe3hnuao70VpRHTyJatpOXQstKTQUKpO7bjM/bHlY53DR
 m+5oW2j5sooTpNABTc8eDF0ow+j91C2n7lfD46EfXzHDPXNA2UZfHbL0WRYGDzghPbIcQJ
 joVV4trS3WPHJRQUC30piaXJLQT4NdwDkYny+2oMtTp5erx/zsghlOVHBpNShJ70Hzk2LU
 8+XxvTxBzIZQqLa/zFDgkYC0Ee+e4+Rx5QvvXiQZgyXGT/dXZrrk8L6nmBoZpQ==
Date: Sun, 3 Apr 2022 10:05:38 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220403100538.538f8a3c@windsurf>
In-Reply-To: <20220402172012.GB1811301@scaer>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
 <20220402141531.1320584-4-thomas.petazzoni@bootlin.com>
 <20220402172012.GB1811301@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] support/scripts/pkg-stats: reimplement
 CPE parsing in pkg-stats
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

Hello Yann,

On Sat, 2 Apr 2022 19:20:12 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index ae1a9aa5e4..cc163ebb1a 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -27,12 +27,14 @@ import re
> >  import subprocess
> >  import json
> >  import sys
> > +import time
> > +import gzip
> > +import xml.etree.ElementTree  
> 
> You for to import requests, which is used later on.

I suppose s/for/forgot/ ? But then how it could have worked for me? Huh.

> I also fixed a bunch of flake8 issues:

Ah, gah, forgot once again to run flake8, sorry about that.


> > +CPEDB_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"  
> 
> Instead of duplicating it here, I changed that to import it from cpedb.

ACK.

> Applied to master with all the aboved fixed, thanks.

Many thanks. Peter, could you backport those patches, or at least PATCH
3/4 and 4/4 to all stable branches still in activity?

Indeed, thanks to this fix, the pkg-stats run of this morning on the
master branch worked fine, but it failed miserably on the 2021.02.x
branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
