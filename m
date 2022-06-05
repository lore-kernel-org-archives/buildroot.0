Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F126B40D79;
	Sun,  5 Jun 2022 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxzoQvVQXGnu; Sun,  5 Jun 2022 20:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2ED240D76;
	Sun,  5 Jun 2022 20:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22BA11BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E21940D76
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_Zuv8RikjMM for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:55:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F23F140104
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:55:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB45E240002;
 Sun,  5 Jun 2022 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654462549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkX5HPn4FruF5khxh5W7uCbA/zw9CLv6asumY1cwxs4=;
 b=SOOgzkx+2mrmObJlP3zQjC49c+NhvaP1voPdeDUaPB2jp16b6zzD/l8uT95CsjBrLagR8G
 ERiycPjoVA1UIXrzWdxdF5sgQwP2F2jh8GAp7nwNv3qrAxnQEzCX0SQt2QR4x+05/K5Q2h
 aHUl8uVZA5ghzrFWJ5f70NAY/lvu5dpOqniaQ5qkP2bGloswzBymW2JLH2Zwgjv9oALrhT
 e10LESLGQzYatcoYcKP/OwnVM9nz7tWWKOQ9TfnxwgrSLLARD/vPpzko4gblVvQrTwhtHb
 Mk2J0kNfUyFRnoGt4vBrW3MWoJ0Vi7w59Y6zttVYdazslRr70SFneb8/0ANLdg==
Date: Sun, 5 Jun 2022 22:55:48 +0200
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20220605225548.5773531f@windsurf>
In-Reply-To: <20220602090012.2008381-1-kory.maincent@bootlin.com>
References: <20220602090012.2008381-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pillow: enable host
 package
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
Cc: kory.maincent@bootlin.com, etienne.carriere@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Jun 2022 11:00:11 +0200
Kory Maincent via buildroot <buildroot@buildroot.org> wrote:

> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Enable host package, needed for the build of specific optee-os package
> version.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/python-pillow/python-pillow.mk | 1 +
>  1 file changed, 1 insertion(+)

Both applied to master, with improved commit logs, and an improved
Config.in help text on PATCH 2/2.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
