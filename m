Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6909ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8439660E73;
	Sat, 17 Sep 2022 18:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8439660E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4V-9jOF4eeH; Sat, 17 Sep 2022 18:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D66560B19;
	Sat, 17 Sep 2022 18:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D66560B19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2968D1BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11CEE4011F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11CEE4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjPb9jjn71H6 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE7F40119
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAE7F40119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:55:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24EF240004;
 Sat, 17 Sep 2022 18:55:36 +0000 (UTC)
Date: Sat, 17 Sep 2022 20:55:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergio Prado via buildroot <buildroot@buildroot.org>
Message-ID: <20220917205535.4545152f@windsurf>
In-Reply-To: <20220907122423.1783908-1-sergio.prado@e-labworks.com>
References: <20220907122423.1783908-1-sergio.prado@e-labworks.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663440936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlAIij6IEXyr55NaK/2fgSCX58PVflDha60Y4MsCK+U=;
 b=aFJKDH5NRrFYRalxLBQsH+zEQDpUuIqKjE/P1DGrlAEOnHlF+ETQCc+p9/+vfLQClX1sn6
 WHLnP1aP8Q9xQfqYyHPALYK155Xfy0rYr/egujiPMLEE7MdzEuiRnh1jONJc0bWFyFI50Y
 VsTCLQ5iz8EQqQT1P7diQVMuQJEkPKVkm2ovBO05/zJqbLuKOu/jIDleUYwpaLvC5WAEZh
 0RaLFil7FB7ZOTqHgEZt9hgNwdozKY8dDuATom0gCpoa6y+LB5rxAAlNaDe2YElbxCeC4z
 +V1S/hOqFKZbKA2+3RUdyHdDY13p2HoKUqh587Gxr31EmupelkGKAoqJ74N28w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aFJKDH5N
Subject: Re: [Buildroot] [PATCH] package/snort: bump to version 2.9.20
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Sep 2022 09:24:23 -0300
Sergio Prado via buildroot <buildroot@buildroot.org> wrote:

> https://www.snort.org/downloads/snort/release_notes_2.9.20.txt
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/snort/snort.hash | 4 ++--
>  package/snort/snort.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
