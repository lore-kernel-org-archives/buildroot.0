Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B087DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56E3B60FA1;
	Fri, 29 Jul 2022 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E3B60FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSRhrtpZbWOn; Fri, 29 Jul 2022 19:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D96760EDB;
	Fri, 29 Jul 2022 19:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D96760EDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5111BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8456B40C62
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8456B40C62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOUs__Ev_nyS for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:54:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A8B140C4F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A8B140C4F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:54:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB2F21C0003;
 Fri, 29 Jul 2022 19:53:56 +0000 (UTC)
Date: Fri, 29 Jul 2022 21:53:55 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220729215355.5915e646@windsurf>
In-Reply-To: <20220729175945.362462-1-bernd.kuhls@t-online.de>
References: <20220729175945.362462-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659124437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JE0itwyUy8TsgpE0iR7KaHJ394szaSPnfGl5/JLpG+w=;
 b=mlmg+1A59+let5wsCE1+4ddeT+KTrR8vU4PIfjgiRr4aPpRpTKXV/w9mYP6Vx1126QnOk3
 /Hri1UY4SEkuF77qmTHiPfeo8A4Bu/laAXqhL/66SgjIHgQIGWcQ1MIbPWUjBIkoe9cfzC
 1/lvldKSSZcSRe522m6sVyyMAC7KqcbW6ZTJru2O1ncb/0w2+91YPw2aGzpD6GITkk+S87
 u1llbluuTow6tG//IaX0qci+aJb6EiSxCnR5CbhJqsEvMATs+aGMEAeyRyhfJfIdrFqH9U
 gzV3u/cE6VQmpN6BbwBM0MZ4akkws2+dBm5mqRinjlN3qgqhOFu/mhcXV7kk2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mlmg+1A5
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.1.7
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 19:59:43 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
