Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C1EC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A2B419FE;
	Thu,  6 Oct 2022 19:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94A2B419FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGhbhjLdnTGJ; Thu,  6 Oct 2022 19:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA50419FB;
	Thu,  6 Oct 2022 19:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA50419FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A47751BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F22140A9C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F22140A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qVBo7Kb5zzy for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:41:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84E32403FF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84E32403FF
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:41:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 084E31C0008;
 Thu,  6 Oct 2022 19:41:17 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:41:17 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20221006214117.1f218112@windsurf>
In-Reply-To: <20221005212150.1384370-2-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
 <20221005212150.1384370-2-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNkry/81v5rv1D+h4uYpjVdf7ScuAcFn7vsOYY6tjM8=;
 b=kiL0CCDBRbUJZioucKzCO/D0GHMO4LBFToRbZ0WBGRUWGMZz7zJS7/a4CV+SbYCom3bVJQ
 nqbh05rTQw3XfKDcSnhqEByJ4K/Y3In7ZPqkd6ctRgsz8qPIpMlfDwvWgdOaXDn9W1n2H9
 Ni0FO9rGS8FJqOBCNfp+DLNk6xQp8WamtPq/hzLmtq1nQyL+B4I5kPaOk/XX7Mrr0gsymr
 gtylWVVJpzFa/UsvIAA51hw4zqVhSCS1BSuegKcHtZrSycLSYsP6r3YNfEYbJzP3GtWvRr
 IuMl8pxzFShWLpCsl+t+SQQSsXcKp3h2mGmZItYPPzFiElG3g5EqFodRvdaHVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kiL0CCDB
Subject: Re: [Buildroot] [PATCH 2/4] package/mender-connect: bump version to
 2.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 14:21:48 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/mender-connect/mender-connect.hash | 2 +-
>  package/mender-connect/mender-connect.mk   | 2 +-
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
