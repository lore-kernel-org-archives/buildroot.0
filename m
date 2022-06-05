Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3FEC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5375E83F7B;
	Sun,  5 Jun 2022 21:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ii-AvKTyR27M; Sun,  5 Jun 2022 21:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6300083F4D;
	Sun,  5 Jun 2022 21:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86C3A1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7510341B6A
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYtLPxo6kZSR for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:24:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08E2641A62
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:24:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA09140002;
 Sun,  5 Jun 2022 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654464296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7NnzVwPCucHQgpnh11fKKaPyncEi6Ed4zlnw4BdyIg=;
 b=Uu+xpA526waJ4zgADZKCk/5F8fIYLEXhyf65MBPOnTiIq0e9Dy4a0lf/uvDMae/MAzPosC
 qmy+7C05KfPrcguzQOJR12HFeKFWTHju7c8w39FSq4poEFv2Fb32M9wVphX7N9Nu5195VW
 B/qZJ8su5bxFzSEJEWAH97Pz0hcwi7ileeU9XiOYHNKDdlLgnOjxXAg5JWyf/i41RG1pQj
 Q7karomZqad2nlIMGEsyBXuEg8FH3gU/DbCh5OPWx6MqrC1xhyGBijLSMZB68iBRZaH2pg
 bBFibrvg2EmObgJJPeEcKalTaM36UXQF5/DO5N7oZse/hvLSPo2CTcQG8aeuDw==
Date: Sun, 5 Jun 2022 23:24:54 +0200
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20220605232454.22955c0a@windsurf>
In-Reply-To: <20220530132239.20818-1-andreynech@gmail.com>
References: <20220530132239.20818-1-andreynech@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.22.3
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

On Mon, 30 May 2022 15:22:39 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> Version 3.20 is the first one where the following issue is fixed:
> https://gitlab.kitware.com/cmake/cmake/-/issues/18299
> Was affected by this bug and decide to bump the version to the
> latest stable
> 
> Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

You forgot to check with "make legal-info" the hash of the license
file, and it has changed. So I fixed that up, and applied to next.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
