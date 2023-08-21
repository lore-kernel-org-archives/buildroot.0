Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC9EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1149D409E4;
	Mon, 21 Aug 2023 13:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1149D409E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3vDe19hWN_i; Mon, 21 Aug 2023 13:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5761410A4;
	Mon, 21 Aug 2023 13:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5761410A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4831BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42FC740A02
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FC740A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-HSRqVvlSOZ for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:54:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04AA0409FB
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AA0409FB
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7AE01C0002;
 Mon, 21 Aug 2023 13:54:12 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:54:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821155411.624bee16@windsurf>
In-Reply-To: <20230817162249.449943-1-bernd@kuhls.net>
References: <20230817162249.449943-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692626053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2p61CUak3+cS7zKZSc+G6kxAhdFui6s2HPdtOi9Ovc=;
 b=IsxA1yStV9hPtPFUsI1n0ANEv960CC8IGfpEnOlOE2faeT9TS/C0d3zwWigfj7zOJjPm6s
 Rq2MH1K4R6DS3JYAiJyr5UP4bRB/kIpwQjFAwT22iSx496gmwtST9eN2+vmcBZGYT5+nfs
 321XyJ3oOMztbcGlO1Rp7ifptnGL+eR+G5klQ3JQefxpipEsM2jY39ncueXqIxsTK4RvKh
 4QdiQ5JTxZ9ldNl6qbK0vTcPhMYk/KPEVmcMLw0H0s8EeXljvZFOOuM7bCPY23G3Ol+BP3
 OTiuj0xmvGL1+YQQVnUyoWgHL2pbGaJfB7c3VjzH2eUR3gvIdNyGBkLnbDgvog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IsxA1ySt
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 15.4
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 18:22:49 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://www.postgresql.org/about/news/postgresql-154-149-1312-1216-1121-and-postgresql-16-beta-3-released-2689/
> 
> Fixes CVE-2023-39417 & CVE-2023-39418.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
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
