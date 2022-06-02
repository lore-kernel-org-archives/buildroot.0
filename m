Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DC0C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E2360E1B;
	Thu,  2 Jun 2022 16:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5V4HN5TUEsTk; Thu,  2 Jun 2022 16:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09AA60BAA;
	Thu,  2 Jun 2022 16:53:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66F211BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63FC183DF1
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7g4or0KmhSOg for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:52:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 554C8823F6
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:52:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3175420003;
 Thu,  2 Jun 2022 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654188772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdeFrXZHcMfEdCYNZNOZ5z31mo5eFkxMTxO+G/RCwLU=;
 b=grhH7AzCc6XKKqFCy+YKmJ1Pmk+PgDxC6ApFLus+uk+ZPSjHHn2SW6FxbiI2cBrFkOxLKD
 nMZxM8GzaF3SszuTmLrhsD1TJwV3xicADcvCM0RaBHPXKmb14bZKwiWczd8CCfdAZvjk1y
 l//8U/Rp7DiIKBcoOUbcQgvkCrtGIEh1DlkoUKporwnk/roX0pIf5u+kwrcjF5x8/kfm2s
 eB5Le+yUaAZ9K+qUm/PqgVXrKVwTbETVwK+j9DDz8Q61ku3pUeIYoSyDA2CI/6EJ/yoP7+
 PT5wc8JE2RaD0B9yozWB5cSHubFfAgT3ek2ZsmPUYDtua6qkbTN8884H2A5Chw==
Date: Thu, 2 Jun 2022 18:52:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220602185251.422139a9@windsurf>
In-Reply-To: <20220517203235.1525998-1-james.hilliard1@gmail.com>
References: <20220517203235.1525998-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-login: bump to
 version 0.6.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 14:32:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-login/python-flask-login.hash | 9 ++++-----
>  package/python-flask-login/python-flask-login.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 7 deletions(-)

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
