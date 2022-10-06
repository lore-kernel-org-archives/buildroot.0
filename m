Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60496C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D171183FED;
	Thu,  6 Oct 2022 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D171183FED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRBAtmeTlxqD; Thu,  6 Oct 2022 19:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F0983FEC;
	Thu,  6 Oct 2022 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F0983FEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF581BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA1B610BE
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA1B610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59jXNKcjwvuj for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:37:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF3EC610A0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF3EC610A0
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:37:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC342FF804;
 Thu,  6 Oct 2022 19:37:17 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:37:16 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221006213716.2748d834@windsurf>
In-Reply-To: <20221003130331.3074242-1-angelo@amarulasolutions.com>
References: <20221003130331.3074242-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVj4lznKO0hzLFfNDySeKkFUtGZGxdlHePBydrW70Iw=;
 b=D9hHzXFhF4u7Jk6RwQj9w9/6cKo6+iG6zJ+LXx+VB/jBjHulg5evehQfbRGRmv2A7hywV3
 jnFhOkrft3svbWqYPy/SAgJdYut3PzQFdJpwmuo3Df6NJM8M9WN0ryPBJT7hTPla7jjUUO
 9cZmWF1wc33h2wz8wOroBt7nPgxKCYoHsXHoc9W1j065+TEudO4MHJOvSGFYXurMTfcGFc
 jooH0ght1/KeCrHEQQWPDuCazhN/EpBIdo9xMRzCQiIO6pyc9Awl5J3O8k9qHCYGPPQ5ff
 xU3PPmpVtZMiuNZ4WctMZv1sgnCEsbksTyNxNiqh9fN6H+Iay/UZJW+mjOaNBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D9hHzXFh
Subject: Re: [Buildroot] [PATCH] package/cups-filters: bump to version
 1.28.16
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

On Mon,  3 Oct 2022 15:03:31 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Handling the newly added libexif configure option.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/cups-filters/cups-filters.hash |  2 +-
>  package/cups-filters/cups-filters.mk   | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

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
