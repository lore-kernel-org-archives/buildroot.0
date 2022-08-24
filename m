Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1764C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455C341626;
	Wed, 24 Aug 2022 11:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455C341626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLs5ZnLqUf3I; Wed, 24 Aug 2022 11:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F50415D4;
	Wed, 24 Aug 2022 11:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F50415D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD901BF407
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F54415D4
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F54415D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dD4VQgF5h5u for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:37:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B621415CD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B621415CD
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:37:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACC73240004;
 Wed, 24 Aug 2022 11:37:20 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:37:19 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20220824133719.448b771d@windsurf>
In-Reply-To: <20220806215641.471770-1-thomas.petazzoni@bootlin.com>
References: <20220806215641.471770-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661341041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vX5PxdSt3NzUx/hXwZaCjyVen1pUmYbab3FqOiyELEg=;
 b=Jw6hTL7TBJavkEULrvh/v35qPYxDguQVrYmKR27ReSNGv34N9FnF0pu/h+Fwye5DzM9geA
 zh0swA5xZk0rhrZqpVdkpOOjOZcVXodaqsMD89kxmKz1kpZRCn/uHR5ndd1IgrGw+SsJQH
 u1oLW8hhO/tS3+RQYQIAAAQUfQjdr7BGkwksW8Xa/y++h98eoZ9x0tTYbWZwPGG5qvcmvl
 sjBi5cstqU17KAMque14SY9PPkd2a4ZdIY1/Srn6o1wg+aE9ZOjjKY3v6inQKF9g/B1CMX
 vkG9njTtVaQkbl6cvm+0JduG2iWLR8rRC5oMM93D/ZKcrf9+zNZaFwRucvDIsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jw6hTL7T
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: remove
 useless escaping of double quotes
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Aug 2022 23:56:40 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Within single-quoted f-strings, and within triple double quoted
> strings, escaping all the double quotes is completely useless and
> makes the code more difficult to read. Get rid of all this useless
> escaping.
> 
> The renderer HTML is exactly identical before/after this commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 100 +++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)

Both applied to next, thanks, with the Tested-by and Acked-by from Sen,
which for some reason did not appear as replies to the patches in the
list, causing patchwork to not pick them up (so I did that manually).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
