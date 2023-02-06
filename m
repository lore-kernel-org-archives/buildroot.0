Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEFFC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105FB409FE;
	Mon,  6 Feb 2023 10:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105FB409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ziHnjlDn9bXf; Mon,  6 Feb 2023 10:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DD44159F;
	Mon,  6 Feb 2023 10:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DD44159F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E344C1BF2BD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDC4540328
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDC4540328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oiITFrNyv4d for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:59:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709B4402EB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 709B4402EB
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:59:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE9E8240002;
 Mon,  6 Feb 2023 10:59:31 +0000 (UTC)
Date: Mon, 6 Feb 2023 11:59:31 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230206115931.1d15fc7e@windsurf>
In-Reply-To: <20230206104559.86803-1-angelo@amarulasolutions.com>
References: <20230206104559.86803-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675681172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tu2AeT6oR8zZW1QtZyxmhTsOFYWDdBWh4jNSNljqLYI=;
 b=Osic+g8odnhFnkubWndtvCJKDxf2MIH3izR3LOv17rT/+kBPu5Bxum03eCpTUbO0SidZ96
 TkfYtFgSlMp4kWpp9IsjIkNbN2/hZTuH4/JWQMTnEvtaue29+E84t0PB7dXEmE1+lVSKCp
 QggHchldVInWtyPPPd39T91Mg2mTfXHYwBgs7f1l3xA/ofaqdWzo4PWuuOjmWGRtuatYC2
 rSIkcVQdAuWDiqVtgDpgQ13FaXmfeIh8SKBRnm8mucAF1B4ZZhBtfePX3LUrw2OXh2+3Py
 cU/e3qyJ0nWR640hHpg9mCVVLQlHcwoQ66Oy312UkV/n/WnPjSvQUczcRHougg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Osic+g8o
Subject: Re: [Buildroot] [PATCH] docs/website: better recent
 commits/discussions output
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

On Mon,  6 Feb 2023 11:45:59 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Removing the "[Buildroot]" and the "Re:" from messages title to have a
> cleaner look on the "news" boxes.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  docs/website/js/buildroot.js | 2 ++
>  1 file changed, 2 insertions(+)

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
