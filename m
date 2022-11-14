Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14981C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D02813C3;
	Mon, 14 Nov 2022 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D02813C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLlTvmImmVvq; Mon, 14 Nov 2022 22:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10277813B0;
	Mon, 14 Nov 2022 22:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10277813B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB68D1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93599813C3
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93599813C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bmob5bMfquwj for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:14:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76398813B0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76398813B0
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:14:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1ABB11C0004;
 Mon, 14 Nov 2022 22:14:36 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:14:36 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20221114231436.0eca5864@windsurf>
In-Reply-To: <20221113094905.988693-1-fido_max@inbox.ru>
References: <20221113094905.988693-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668464077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNw8hIvf8hY2UEy9Z/+m56Z2vjA0I9xppsxZgM5bBaY=;
 b=NOL2KLcZ6w2HyxIr6p9F50iRYnqul64NVQ88V0zExkg1fa3nMZ/WVLLHnNIwDpFA7ifg7P
 hj41nZloUC6a9FrlD4lLyPfqHD2SCVlf7YGQI858F7TAz0AwPYc5T6GvYlP0oqOpcMFMJP
 daybKGJRgrkX9Prqa+tPBx3HgE+SYCfFZwFQdIkDwxc70/HJPAWZeOphtf1lyw/kkUGK58
 gbiAEei5o5MgepKAWJHTKgY5HpvaB9QN7ILDtrDH0GAzq5NoBFwUzG2d4WSc80cRvCMs4d
 s7TaBdywkTMisvzCgIOJCeC77YjcpUAYSFhHAgag85+9cn/xsAXp1dPSEoLasw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NOL2KLcZ
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.7.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Nov 2022 12:49:05 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release 1.7.1 is broken, so skip it.
> 
> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.7.2
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
