Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B7AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEF7240530;
	Sun, 11 Dec 2022 20:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF7240530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqqlgCalRo2B; Sun, 11 Dec 2022 20:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0847A40550;
	Sun, 11 Dec 2022 20:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0847A40550
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 832411BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9A140530
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9A140530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0O9Z3wZK_6R for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:21:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CA04047B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3CA04047B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:21:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE2AAC0004;
 Sun, 11 Dec 2022 20:21:19 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:21:19 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20221211212119.56030da5@windsurf>
In-Reply-To: <20221130075357.92377-1-br015@umbiko.net>
References: <20221130075357.92377-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670790080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYZBNdoNex9CC4XyEgJOaSsKpI4WkgOW1WPDkihB1Vo=;
 b=BsgqRjxfJuyOfooFHE7rAYwBmT0qH3K+Evb4y9XDfJW4efvEX9d/hxNfstmRJQ3iEsDkGU
 vpy2Lr6LeYpenbE2Hf8GDDjTr9qQPjvcSqvWPjTpC21qdKAVMcjo6YnalT4NBEYmQNR7P0
 HQUESO3urw9Dv07fTd3Yw+SqWpH22aY1FI/K+H3wwEGDGxIgl1Ms7LFK0TB8yIL/36j2FL
 P0pM0L73oRoR5uTdAn5Wyal5ODTAl6eHE/eSCXFcDVAKKmFJzLEnuEPq4JWPMQEsefwX5P
 Yvfvv7oXRzY4e0y/vm9vKlpL8gzF5oY2PwT63Wmw4iytc5RIze2/qBciQSaBQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BsgqRjxf
Subject: Re: [Buildroot] [PATCH] package/mpd: update to version 0.23.11
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

On Wed, 30 Nov 2022 08:53:57 +0100
Andreas Ziegler <br015@umbiko.net> wrote:

> Mostly fixes for build and runtime failures; no new features.
> 
> Standard directory for default database and cache changed from ~/.cache to
> ~/.cache/mpd.
>  
> Full change log:
> 	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.11/NEWS
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
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
