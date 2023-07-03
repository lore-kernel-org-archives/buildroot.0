Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253DC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1C681EAE;
	Mon,  3 Jul 2023 19:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1C681EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqiPkdRuXKHB; Mon,  3 Jul 2023 19:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F8881E89;
	Mon,  3 Jul 2023 19:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F8881E89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 679B21BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2130281E89
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2130281E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zU9kfOqj9iLd for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:52:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C42081E7E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C42081E7E
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:52:17 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F0D81BF20A;
 Mon,  3 Jul 2023 19:52:15 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:52:14 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230703215214.73e8cbef@windsurf>
In-Reply-To: <20230702170229.1311461-1-ju.o@free.fr>
References: <20230702170229.1311461-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688413935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHucVXUhw49LkPHyLnNInBO/e/lAiPtt/YTbVWg2OZM=;
 b=n4bRO0waoiJoXMVMdT1t73alomZCgGaVXaJIWjh83qdSs77BMLpw4W/JxEY9ybKFohAps6
 +uQZPzgXNatzFH4UpsPiGzIlMoKT+vCVHSofzt1eVkhBYcr0KxG/MWCuwMR+RNIHjZk5kP
 VtQAIZ+cBDx+xUcYOCxVeLI7gpXEluwBosg1bOt5tEP/DVvYNaQ11xoUy7HKvs6DLue5QJ
 OF/Yw0JxTM2+5M9em+udZ0oP39vOfQUiMJETj49iLr9orLhJYTYcOP3rDfWYv5LN/B3zJB
 kHLIMed2vih4M+wvIk8LypLP2wVf+or6O7nRThjqAIejZBHl5lLhpnewtJOU9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n4bRO0wa
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: bump to version 0.3.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Jul 2023 19:02:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since version 0.3.1, see:
> https://www.xhypervisor.org/index.php?page=news/20230101
> or
> https://github.com/xvisor/xvisor/blob/master/docs/releases/v0.3.2
> 
> This commit also drop the patch, as an equivalent fix, included in this
> version, was made upstream in:
> https://github.com/xvisor/xvisor/commit/eb1d1dd4658c2bab6c49abb7bc51c231dc5cc0bd
> 
> The file .checkpackageignore is also updated to reflect this patch
> removal.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .checkpackageignore                           |   1 -
>  ...psmouse-back.c-fix-build-with-gcc-11.patch | 115 ------------------
>  package/xvisor/xvisor.hash                    |   2 +-
>  package/xvisor/xvisor.mk                      |   2 +-
>  4 files changed, 2 insertions(+), 118 deletions(-)
>  delete mode 100644 package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch

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
