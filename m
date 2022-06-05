Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68D5612A4;
	Sun,  5 Jun 2022 21:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LbBe3JGXSHZ; Sun,  5 Jun 2022 21:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17906129B;
	Sun,  5 Jun 2022 21:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 590411BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47BF26129B
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnYg45I1W-9h for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:33:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC05E61291
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:33:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C744B40002;
 Sun,  5 Jun 2022 21:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654464819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Hq59PPtKn62EJvnyj14J3Mgh6fr0YCFWX4B2GUlwds=;
 b=PsFU2HYa4AHM7lShUZQ2bP+w28RH9qJJR9pkal3dIKN4Vjipj1MmyC/mwgxHmDB/8v2gnq
 h1KJq98iGimD59OZ/jNaUxHm4vajLHfGhKEAEo2Z2Qd/qrqL02OJ6IORT8Jx1XKKoKj2a2
 lwOlAiPpBRxCl8nkpUUmduKMJXdtD75mCS5hw+wlBNmagnpZXE5ikoN8AVqUO4YFTPApkS
 FA39UUKc20ah07s0fdDkrTm22xDfGDR5DLe1K3wHaCt1sjCVj9zNG/DsL9NZDeRV9N2A+6
 AmQocBosD4WkEMMdJm4W+LiB5imKc0eLXV6t2hub0dgMFacTh1HOBYFmfEoBIg==
Date: Sun, 5 Jun 2022 23:33:37 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220605233337.552af2b9@windsurf>
In-Reply-To: <20220516171221.265795-1-bernd.kuhls@t-online.de>
References: <20220516171221.265795-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.19
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

On Mon, 16 May 2022 19:12:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://dovecot.org/list/dovecot-news/2022-May/000473.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
