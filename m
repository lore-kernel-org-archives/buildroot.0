Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA75C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3646980BF6;
	Sun,  6 Aug 2023 14:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3646980BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwW7tM_Zi_B6; Sun,  6 Aug 2023 14:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFF381DE2;
	Sun,  6 Aug 2023 14:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EFF381DE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B95A1BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E86A040275
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E86A040275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZI5K5VLCuPtT for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:40:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93A3A4032E
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A3A4032E
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C8940003;
 Sun,  6 Aug 2023 14:40:37 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:40:36 +0200
To: yann.morin@orange.com
Message-ID: <20230806164036.60d21e39@windsurf>
In-Reply-To: <cover.1690895462.git.yann.morin@orange.com>
References: <cover.1690895462.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691332838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5ug4mM41gWQ9raEllAfigKIT82Yw60oWY7ND3Ajs4Y=;
 b=elMc40O6IY5RFWz+whusPvVSdplef1p2BjHbchNFZAeJATdVUG92l9J+oA6D02yhvZ/dQh
 M/GMIHOXwb0BPn8phOSZtHQSRWKmQGK6rG6gnktCtx91UPkPMf9TZbAUWr4lp/14wdOC/K
 To5KRx5G+JofndfuiTtraY+ig9HGudZfaND53V64Be111eaASRYpySp8TzI0kwpffNOzrK
 EvWSf5I0DZiOKDA85PHmcZJnwT/XabhG2ENJAhJRGjhrIFs46DpC8K7EfeSWkilB98Ymqo
 uWCn1cllvY7FRRl+qR685/uAh4mvxAr8CucBPvOn15g9gcKoYfQ5l3rdgnszhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=elMc40O6
Subject: Re: [Buildroot] [PATCH 0/3 v2] support/download: enhance svn backend
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

On Tue, 1 Aug 2023 15:11:14 +0200
yann.morin@orange.com wrote:

> Yann E. MORIN (3):
>       support/download: fix shellcheck errors in svn backend
>       support/download: use svn credentials to retrieve revision date
>       support/download: add support to exclude svn externals

I have applied the series to next. As reported on IRC, the From: field
is not correct, as it is just From: yann.morin@orange.com, while it
should be From: Yann E. MORIN <yann.morin@orange.com> to match the
Signed-off-by value. I fixed that up when applying.

Another aspect I'd like to challenge though is your decision in PATCH
3/3 to preserve the current behavior of downloading externals as the
default. We have only one package in the tree that uses SVN as far as I
can see, so it would be easy to verify if this one uses external or
not, and do the right thing.

Yes, I know this change of the default behavior could break external
packages, but we were just discussing about switching the default CMake
backend from Makefile to Ninja once all packages in the tree have been
verified: if we following the same reasoning, we should also forever
preserve Makefile as the default CMake backend to not break external
packages.

I think we need to find the right balance between preserving backward
compatibility and moving forward with "better" solutions. I believe the
chances of having people having external packages *and* packages that
use external SVN repositories are fairly slim, so I would think that
defaulting to *not* downloading the SVN externals would be an
acceptable change. We can always mention it in the migration guidelines
at
https://buildroot.org/downloads/manual/manual.html#migrating-from-ol-versions
if we want to be extra nice.

What do you think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
