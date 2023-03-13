Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2CC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842C980D8A;
	Mon, 13 Mar 2023 21:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 842C980D8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gH3JFrvfhpax; Mon, 13 Mar 2023 21:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE61381750;
	Mon, 13 Mar 2023 21:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE61381750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76ABA1BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FE06813AD
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE06813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGdWcr0kxNAJ for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:52:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5B4980C9C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5B4980C9C
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:52:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD8F320002;
 Mon, 13 Mar 2023 21:52:10 +0000 (UTC)
Date: Mon, 13 Mar 2023 22:52:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230313225209.329567e7@windsurf>
In-Reply-To: <20230313182334.1070733-1-giulio.benetti@benettiengineering.com>
References: <20230313182334.1070733-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678744331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERKlcQAN4w2SBFRzdjcdM3xoTOnPj1yceHqVbBxF0nY=;
 b=S9zqj2Z+huKIlPqXNwZyTobBakA2DomjvAmjxHiUfbGDygCu5VbfpTV1/nxuOpOajepmCv
 b7tUBAcadZalv/p3aKUu/Zm/iCpY7YNXRY/ZsCx95pPJPvKwV1cff6fBu1EZRvm9lF9lTh
 9xuPVZspwn+TaVKduep18trkAJAsOc7V7EA7OZo/9zKZPiMwdKg7vH4nTLpFD66OKjUJw0
 UYAxWtyTzWEuBDArRrUUsOL2YUZwXVOPA1VgthrmDRojW2Ssw/99gSuLvV5lVBuEVCC242
 x6KXIUD6I6I2C3Jn62rh6FMFzbDw/TQlcbjRBecVp6V+A2R+gYIZynnJw+7/cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S9zqj2Z+
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.89
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Mar 2023 19:23:34 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
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
