Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE1C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDE9830C0;
	Thu, 11 Aug 2022 20:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDE9830C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OduaxmSNCt6F; Thu, 11 Aug 2022 20:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A31083046;
	Thu, 11 Aug 2022 20:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A31083046
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 558F81C116E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31684404C0
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31684404C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdy9ElAVhyk1 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:25:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B53EB400E2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B53EB400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:25:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 454A41C0002;
 Thu, 11 Aug 2022 20:25:25 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:25:24 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220811222524.7c3e7a23@windsurf>
In-Reply-To: <20220811133527.169146-1-bernd.kuhls@t-online.de>
References: <20220811133527.169146-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rD3kldWeEPOxplL40bbPGDZgcBqaHtZxIxrGIJtdxYk=;
 b=B/Sb2yvDz4fUWh7k6+xC42BVkkniVUmU9V2rrNfHYuBzbJxiKaRravKhtTGZ3jCjEttfu0
 bS4m2TN4K2wN3zVu4rT4UmUUN+auPDki7CroExvalkAgTjwj6yfrBlJ8IDtCPEuTmGcaix
 2ASr6Jg9nzN3Ey+7bYa4kId1WQPcvU5JeCENlJIwsnLFQrZH4LisikJmRK5jrtj9nuQPoX
 rJao5o1jZKP1cg/tZ1yt4zmoQ2YOBSE/CkHeqDryd2OfgneVRdNs8CHFDa9bqy2AMJLepb
 xu/8kgF7MR4wWDVbbv3kl3VG5eZHJeO4Rgxt00zsaz41mmwS2EPwxOozuHINEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B/Sb2yvD
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.1.9
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

On Thu, 11 Aug 2022 15:35:27 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://www.php.net/ChangeLog-8.php#8.1.9
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
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
