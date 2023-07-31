Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D8EC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E9A60BD7;
	Mon, 31 Jul 2023 14:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E9A60BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2V_pWWyC07v8; Mon, 31 Jul 2023 14:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB72610A4;
	Mon, 31 Jul 2023 14:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB72610A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79DE21BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51430610BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51430610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWJRH38jK8Cg for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:55:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3904F6108D
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3904F6108D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2650F20004;
 Mon, 31 Jul 2023 14:55:51 +0000 (UTC)
Date: Mon, 31 Jul 2023 16:55:51 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230731165551.2b5f9766@windsurf>
In-Reply-To: <20230731141131.2666639-1-giulio.benetti@benettiengineering.com>
References: <20230731141131.2666639-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690815352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmt6krjzwV4Sm3sNePKewBElzUmkmcC1GLNVYHTGL7g=;
 b=T/Sy6JGZejZlzWINBzvYXhEbTiG/Fx9CLUqTw5wJGdEeaJYi1xaDejCER3wDBNM+53up5Y
 kMfhgR7Avnhg0BmLBlZczjmXEkG5vp5E9HiNu1WhSm6TrOdBSMckW84G13+rInvHH/8ngM
 jErcHFbMaaTCiN+4E8PGah2W7J+OD8bKsie2CXSm7AyaPByvBuq+EKuzR9/ca3zYTB3m3N
 7sCc2JCfbNuVPV/yIWt4AYzVkG5fCme8tyauEYysqGQ0ehr+m344voMBidAvlHHY+8mKJX
 +GNAE4TmZhbTZNCgQnOjEOq3UkiAsOVkkvlXGy1rTUBn699Hs6ZcKGBv7HN4PQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T/Sy6JGZ
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.92
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

On Mon, 31 Jul 2023 16:11:31 +0200
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
