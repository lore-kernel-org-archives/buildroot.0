Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69711EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2FEF40922;
	Mon, 21 Aug 2023 13:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2FEF40922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwHjtNWV77GM; Mon, 21 Aug 2023 13:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4EA408AB;
	Mon, 21 Aug 2023 13:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4EA408AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E887F1BF388
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3056408AB
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3056408AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsDyH-keiShl for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:04:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 635CE40545
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635CE40545
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECAD220009;
 Mon, 21 Aug 2023 13:04:01 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:04:00 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20230821150400.7f4a1f6c@windsurf>
In-Reply-To: <20230819021623.3961269-1-Mr.Bossman075@gmail.com>
References: <20230819021623.3961269-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692623042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhGZK0ka5vcBcfYTO2egW8pADhN1X885UFVHlyaEipk=;
 b=WtNTf0JgInV2I4pAy2gvUUznGqNemVaF2yWpeQUYJMP4C4496qD1nVL1BULqsCq3FkSj4v
 reTEiT+YMSsR6CVKjN0T604l6U7QZOdFkbv99TSKSI2S99m2j8Cj0H1pwwYS0GFbkNAGUk
 7/YRLydZdOo/Rumj2nUZJXbKp2uiLJ3U5r5miO1O5VSMKAt8nkxVJkE/VCy7ZVfKcZYdTg
 48MmonzI/1Dad3HBFBHv4dxWckclRoJOpygA5U0+Gb54DreG0Pzywp8qycUdDQQLYM6M2e
 3g05ak0pSQcZRYsRYK50PATMkbisJQimqTqkUVNFZtZbZmZ2MBVmS5FugNmXqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WtNTf0Jg
Subject: Re: [Buildroot] [PATCH] package/busybox: Use minimal.config for no
 MMU
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Jesse Taube <Mr-Bossman075@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Aug 2023 22:16:23 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> When building Busybox for no MMU systems both umask and mask
> are not built. During boot-up, they will be called even though they are
> not present. This issue is fixed when using busybox-minimal.config
> To prevent confusion for future no-mmu boards select minimal.config
> for !MMU targets.
> 
> Signed-off-by: Jesse Taube <Mr-Bossman075@gmail.com>
> ---
>  package/busybox/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next with a reworked commit log, see
https://gitlab.com/buildroot.org/buildroot/-/commit/80b56887006cfba50833881dc31f045d494af185

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
