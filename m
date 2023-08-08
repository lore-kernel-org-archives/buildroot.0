Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5388C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE1541756;
	Tue,  8 Aug 2023 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE1541756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O21HDMSipKiR; Tue,  8 Aug 2023 21:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505B6415C0;
	Tue,  8 Aug 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505B6415C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15D8C1BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1AA2415C0
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1AA2415C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYhKVSPbvUCj for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:19:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF44409E6
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF44409E6
Received: by mail.gandi.net (Postfix) with ESMTPSA id C09661C0003;
 Tue,  8 Aug 2023 21:19:14 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:19:13 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230808231913.1d0a98e1@windsurf>
In-Reply-To: <1860848.tdWV9SEqCh@kilian-aisec>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
 <20230808094348.1c7a8650@windsurf>
 <1860848.tdWV9SEqCh@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691529555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ri9rQR7RY1er4+pU9gJdthAywhFnlbKN5YHgzZKSNBE=;
 b=GHE/kFbmF6jtFBZ5ZLAcoEOsOzVBhd/P+VAhZPVH2GdSBml8DNeDaSzap5Ewk69i0LlP6j
 I3uSq99o6Bj5HhucVIzS8dIYgIQ2SZXWWeGhNmkDlJoCWiubH4DN6zuD/+aCKmJeIOwGoP
 UTkGRswQFrLSXKFz2jOytOIGxKJ791rVA7vXvsJwmxNWosF0JL8ikoeFDJmoWxdAJd2r6i
 pXm1OJ3ZoYGdsUg9XV/GtXYkecUpl1ZBcOdyXgvUZQe1nUXt0HBsaya+uuXKo6BLk/J5e9
 qy7f+E/MKGzw1YSAzujzk/VKpTd0VEKNxmKXNDcMuKTT8SlU0TtP862gSY6JqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GHE/kFbm
Subject: Re: [Buildroot] [PATCH 0/2] Fix Rock 5B build,
 broken by gcc 12 warnings
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

On Tue, 08 Aug 2023 22:44:04 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> > I'm not sure to understand the reasoning for the second patch. Does it
> > fix all gcc 12.x issues or not? If not, what is the motivation for this
> > second patch?  
> 
> No, the second patch does not fix all gcc 12.x issues. It only fixes two of 
> them. I think that fixing two of the warnings for now still is a plus.

Nah, it doesn't make sense to fix them because if there are remaining
issues, we can't switch to gcc 12.x anyway, and those those two patches
are basically useless dead code.

> Thanks for the info, I actually would not have known this! I think that the 
> best way is to ask the maintainers of the Radxa custom kernel whether they may 
> fix the remaining issues, so that the custom kernel compiles with gcc 12.x. I 
> intend to do so.

ACK.

> I think both patches should be applied. However, the first patch alone should 
> already cause to fix the build itself. (Tbh. I did not test it though.)

Would be good to test before sending patches :-)

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
