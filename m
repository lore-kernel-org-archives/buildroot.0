Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3C9C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD92840936;
	Sun, 12 Mar 2023 12:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD92840936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DbseP_Jkbe0; Sun, 12 Mar 2023 12:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C2D408CD;
	Sun, 12 Mar 2023 12:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C2D408CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 996FA1BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AA141626
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AA141626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LH0BvT7npBne for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:34:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46458416E4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46458416E4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:34:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 75A1B40004;
 Sun, 12 Mar 2023 12:34:55 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:34:54 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312133454.2ff18f94@windsurf>
In-Reply-To: <20230301220159.161476-1-ju.o@free.fr>
References: <20230301220159.161476-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMRkXp4H8Qd8Se8/tCuqFtjN2R8ISK2zyMkUtSRn/e0=;
 b=bwjTB8WA3ch/GUZL4duPb1KbHw5hTGn+bRvxptRFL8wbngYGQPXONP8ihuJHOGyY16XYtm
 A+1vu+GSckGCBwR4QTu6qSdZSsELJU+qZXsQZAzF07dducfNi4sWOGQrBWpTUha+YuR0SL
 EG2WD/AwAoeJ+8FxM7b48SFCbCe4rd8oVWjJoVeWx1Oc9X+DSYNTAv1lvvozcx66cGFx+t
 nUkPbjnFBEJFvLdeYTxljO3u3UUu1sqAskHzn2lg2IGgxwLxub0wceUujJScS08rHxLZdL
 ERAHKGwBBnW45VSk7CXtXVgoVudMe1gMTG/DJJsWiyFn+xVXdH6rSMQanzxhLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bwjTB8WA
Subject: Re: [Buildroot] [PATCH next 1/2] package/kexec: bump to version
 2.0.26
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

On Wed,  1 Mar 2023 23:01:58 +0100
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.infradead.org/pipermail/kexec/2022-December/026399.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
