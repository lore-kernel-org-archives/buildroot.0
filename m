Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6B9C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1092A41810;
	Tue,  7 Feb 2023 22:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1092A41810
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGgQ2lrHhdP2; Tue,  7 Feb 2023 22:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BF24161B;
	Tue,  7 Feb 2023 22:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BF24161B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649361BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E67C81ECF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E67C81ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4VvlwNUIWaY for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:22:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967EC81ECA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 967EC81ECA
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:22:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D48E20007;
 Tue,  7 Feb 2023 22:22:01 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:22:00 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230207232200.7de2a1c3@windsurf>
In-Reply-To: <20230112115802.3374366-1-bernd.kuhls@t-online.de>
References: <20230112115802.3374366-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675808521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YarRpRnKlgp2Zsh+CsxoF3TWsouBJ4iWZYB4CST+Zk=;
 b=eIcTJ+LA+2yG+Htc2/6O4lNcKuUH7wPZLtEXYjg7BR3LPDQPRNMynS2mBgldBi0R98KLmy
 4vQwDAua9jQUtlrX1x5icFtGWYZX3WAIP8pwS6sPPSwV9Kwc8MgOzWJa9NT0pH1Sv8r6yu
 9kjdS/SS2oOB4DmdIia9Hw1JXahL7U6pdcIG8SDllOEmRa/B5QI/C+PaUxqGWyFvdtLYFU
 xwSv39XfohKHr7KaSb3GGfd2LDeyvVfckAD5FEI92u+rxPNdvNXeykNMRNB/bPmKheqZIM
 T/vw+ltucUutz44umYVcdZJkaYZlD1zM4F1hHYCweKm6iScQ4kmDqKgvYmy9tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eIcTJ+LA
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.1
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

On Thu, 12 Jan 2023 12:58:02 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://www.php.net/ChangeLog-8.php#PHP_8_2
> 
> Updated license hash due to copyright year bump:
> https://github.com/php/php-src/commit/bf2867bc7235dfb65675ff4e9c21c8bc537726e2
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 4 ++--
>  package/php/php.mk   | 2 +-
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
