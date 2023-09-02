Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D471ECA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C643415A7;
	Sat,  2 Sep 2023 07:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C643415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUQugqMjbU91; Sat,  2 Sep 2023 07:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF00B41715;
	Sat,  2 Sep 2023 07:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF00B41715
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 156C51BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E313960ADD
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E313960ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiVqjAPVAlip for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:46:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B92E960A87
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92E960A87
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84CB7C0007;
 Sat,  2 Sep 2023 07:46:50 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:46:49 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230902094649.3c4e86df@windsurf>
In-Reply-To: <20230831095042.395787-1-buildroot@heine.tech>
References: <20230831095042.395787-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqFnWPpB75PfzghAfPHKc9ah10weINCZBM/imNu2dlk=;
 b=dRZzop91NPtlvVBZVFpNkASyX/6hedsAo47VaxIXhCsbWXi1BW6GjTxRY2wTuaMswqzQuX
 MGSiVFQ9FZdbc3629A8U0AV1pVK7tkEmUjdWKO7O+fWOgnaf9ou1HvDL73FoSmpOcXEPNi
 R2/1MR8QhDfXxZz19Ke5hX9aafhr2LW3BhERyE2YY+mUCrKHYiUSipKxu41hOugzn19PGO
 ywpBPR49NMjQFF9qe5GxpFd4V3oFeGSZ1gtDQj/UXxkqAl0Dod4KS6WqQy4eXvLCS3Px53
 JfaE39bqHRkv3QfGZElP2f7Ep31LVgvUtAi55nhTOqGBOdSp3Z83VaIxGTMEFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dRZzop91
Subject: Re: [Buildroot] [PATCH/next] package/fmt: bump to version 10.1.1
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Aug 2023 11:50:35 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/fmt/fmt.hash | 2 +-
>  package/fmt/fmt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
