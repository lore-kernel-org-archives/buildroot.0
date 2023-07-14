Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C853EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACF96143E;
	Fri, 14 Jul 2023 10:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EACF96143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x9a3rqT3Acp; Fri, 14 Jul 2023 10:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4403661411;
	Fri, 14 Jul 2023 10:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4403661411
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A45A81BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F4EF421B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4EF421B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmgCfk7kAZ7N for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43893421A2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43893421A2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5003F1C0004;
 Fri, 14 Jul 2023 10:21:38 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714122137.1782156f@windsurf>
In-Reply-To: <20230714045415.2365259-1-bernd@kuhls.net>
References: <20230714045415.2365259-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uQ8Lwu4slYikfy7XBoCahX9MFKwmTtAqVWOZ99NhJ4=;
 b=jkFG6fSqef/Yhn8aA8pIl/XWQ3uf2i+gMYPHkBCP/lWJLEUW0D02tujOzzByt3CFlY4+0O
 1TuDmO67JiEuIbGgszG0qwRg8lB5ZjSybxNaezT24+pSB+ak/wqYR1JI1p0MOYKYjD2NQu
 z1Tst+kfht4EKV+I3FmJZzY1KlPN2cUzFrvWlSxDGqTlBR5f8dX/tbv8vx8wFxFVxS/rpZ
 IkpRe0am2wMpW9v5/5hGFUQ0UlSEI1+IWnpPU+HpiUX+UMhdUbRVZQG+QOZ7JJd9T9VOHO
 jT3aYVTGpg3UkgvUwFiE5LpUmyPjhUCwbWAhq5NLPThc27lYh8a/yIPnVlkJHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jkFG6fSq
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: bump version
 to 23.3.0
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

On Fri, 14 Jul 2023 06:54:15 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
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
