Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2897EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE5B640C4C;
	Wed,  6 Jul 2022 21:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5B640C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OZ0p5IBdbWc; Wed,  6 Jul 2022 21:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F7840B67;
	Wed,  6 Jul 2022 21:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F7840B67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888FD1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6335282EA2
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6335282EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uzPOybAees_v for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:19:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD8082E9C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CD8082E9C
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:19:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36208240003;
 Wed,  6 Jul 2022 21:19:40 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:19:39 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220706231939.502c3185@windsurf>
In-Reply-To: <20220628174202.221302-1-bernd.kuhls@t-online.de>
References: <20220628174202.221302-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7wB87Z00TUN6n3U9b5B1UYEZIG5/fu/yoUPSPuarpI=;
 b=ZL+bS7d0brlpGBjhOlIf/p24D7lVFCBxZyC23fiKcwHWlB8x3n6qcSFa6gsrYq/349eMaP
 u3VkpkVh5/gJ4yAEgU15J1VlXetN+ESwqmljWVDzC+vhNVm53ZFd/HDJLCuAgsTcQV5Hx+
 UXpZgeqxL07po14x1sRloqo1/h3WqMyTPhHMSscP9SioATBitTKkZOkjtdOkYifYRW6ttL
 K7y4oNAaSQLlJvUB2RT42Gwu4eVvhyU/u1srzDGtK4tKhKWhCAjf4iwf68R4/ZIai9ltO+
 4nsBFVboo0bAtH/tOibabujQ78fraqnyH0BNk8VxmPDj7+67h3TqobCM1MLDTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZL+bS7d0
Subject: Re: [Buildroot] [PATCH 1/1] package/unixodbc: bump version to 2.3.11
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

On Tue, 28 Jun 2022 19:42:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed unsecure md5 hash, upstream does not provide other hashes so we
> keep our sha256 hash. Switched _SITE to http.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/unixodbc/unixodbc.hash | 4 +---
>  package/unixodbc/unixodbc.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 5 deletions(-)

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
