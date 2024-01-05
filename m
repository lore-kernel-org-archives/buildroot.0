Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C349DC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 22:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BDD2400D6;
	Fri,  5 Jan 2024 22:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BDD2400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LafbDG8c-Ks; Fri,  5 Jan 2024 22:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92358437B9;
	Fri,  5 Jan 2024 22:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92358437B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E69011BF3D5
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9D674379F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D674379F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDwsgQAxgX70 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 22:50:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F26C43797
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 22:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F26C43797
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EEA71C0003;
 Fri,  5 Jan 2024 22:50:55 +0000 (UTC)
Date: Fri, 5 Jan 2024 23:50:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105235055.3ae1f751@windsurf>
In-Reply-To: <20240105184530.16960-1-bernd@kuhls.net>
References: <20240105184530.16960-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704495056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIuEKdACnaKIMuw5SHvl1N1AB0QdFoFISvlJ+kKJOWE=;
 b=JYtftTWKbZhdBu2+m+AK2B8GXMibEffx8rSuULINkadC7tF9SUwIym9Zz+xE5xWw6Pk5Qz
 dAYZvIQ0HYFF+RTsadQviqMHEe2coA1HZS8otw0xJ7GzFzBfFLmV3lB1NmHZL2C5JUurGN
 RMxD3ri4h0mhgHS+d9U//ffMIHrMku2MsXVkLjaS/rOQPc7eSRtixmuUMuuhwwHXVdw6wd
 /OiOU+S4XQ0jnzg0XtlR/sPi7P1L7FciekE2PHDZ0CDd04FuShZ45Kyben0dW/ydoqDB1J
 mVu8APm24Nbn5mFYk5O5cbMz8FUAPwomnWTRpmLc+Lp7HvJt0VhUGMVFRCJn4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JYtftTWK
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6}.x series
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

On Fri,  5 Jan 2024 19:45:30 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in                      | 2 +-
>  linux/linux.hash                     | 8 ++++----
>  package/linux-headers/Config.in.host | 8 ++++----
>  3 files changed, 9 insertions(+), 9 deletions(-)

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
