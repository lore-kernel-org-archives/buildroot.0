Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ACEC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF07417DB;
	Wed, 30 Aug 2023 20:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF07417DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iH7slbSIqWyf; Wed, 30 Aug 2023 20:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4074417D3;
	Wed, 30 Aug 2023 20:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4074417D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315871BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00828417D3
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00828417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9fQp1wLHTpL for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:35:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8666417CB
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8666417CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7AFBE0005;
 Wed, 30 Aug 2023 20:35:52 +0000 (UTC)
Date: Wed, 30 Aug 2023 22:35:51 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230830223551.48ebb70d@windsurf>
In-Reply-To: <20230308131554.642965-1-sebastian.weyer@smile.fr>
References: <20230308131554.642965-1-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693427753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VB9+QE4THyUWmoAgctrD4+DKHBCN6XkdWn7mjhCjqUQ=;
 b=RasDW6yJJjDmPMy0D7bwis3iCFZG/pCydHw65DYyu/sQnAFcZtZxymycQAtx3QdWqhNGv1
 lpdp7RMyuQnGMQ5paszvqk+40/mII7JtzFuqLeVNuGLrvliRL2DhhKlrqnT+r2FQlkLkH5
 Mc8tPOrpAddvAClmP5N4N/7JU88/dgjj0qgr+NJ02jWRU6beGdVue1jKJ56iazqGiqXrKr
 sSSVDHJRF1++Bvm4nKVKXqT+chebLTifoXnWCEKZil5VxTh196RkgnBSeJ30pvoKE7pYpB
 YB8L3EQmRjYF4SQ38k0CrrYkOFZMKKD7S1h+fba/zAAb0ASKtYgWiH4HKSJqDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RasDW6yJ
Subject: Re: [Buildroot] [PATCH v6 1/3] package/nushell: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Mar 2023 14:15:51 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> Nushell is a shell - written in Rust - that makes use of the nushell
> language to interact with the operating system
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> This new version adds ncurses-target-progs as a dependency which is a
> hidden dependency of nushell. With this option enabled, nushell is also
> usable without specifically replacing getty by agetty.

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
