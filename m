Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D95ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE1A44051B;
	Wed, 21 Sep 2022 20:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE1A44051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mG1nDgvCfcyU; Wed, 21 Sep 2022 20:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F56640217;
	Wed, 21 Sep 2022 20:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F56640217
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 227A21BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E2F8266D
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E2F8266D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQBr2XbsXFQe for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:14:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCFC825E6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCCFC825E6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:14:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C60836000B;
 Wed, 21 Sep 2022 20:14:11 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:14:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20220921221411.06f89ed6@windsurf>
In-Reply-To: <20220919055920.1072075-1-fido_max@inbox.ru>
References: <20220919055920.1072075-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaxNKDZxajfd8xRJCyfYdLlcPshGXqxOMFjxGXTLtzw=;
 b=j77leV/Xxff0bk7/dON41iHy4O3EvYg/Xz2kreriPZBXVdEbahZMucJp3NDeUxs7QsveV7
 ynaRad6AsfUoaP0PWR52MYwQ2Rraw/O5MjXZBYZ0i57w3D0nZzODuO9K418uI/bkB62In5
 VlZr9YhgwbSOq6SJ0WbmC1lWwE6Kyo4g/FTeE6Mc4DI+GAr9CPWwwqWXjpjBh08AE7XYkF
 8iVlsPoc5w462LFMUtZt+FJ32NNvX+yU4TXThbTPa2tEFy9pwPsifsOHVNDx/bHqWKPme4
 1gXHRjbejrMfWG1M8XvQbAgFavXozX+6McDujLWMtCbJ2zrgCxeJlFEFsJ8mBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j77leV/X
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.7.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Sep 2022 08:59:20 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.7.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
