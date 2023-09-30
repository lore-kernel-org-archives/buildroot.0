Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF1AE77372
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC83B81332;
	Sat, 30 Sep 2023 12:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC83B81332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8SfWKulo79j; Sat, 30 Sep 2023 12:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61758126A;
	Sat, 30 Sep 2023 12:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61758126A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD6651BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8779060D90
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8779060D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id td_-8pfP8doR for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:44:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E07160737
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E07160737
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4715C1BF205;
 Sat, 30 Sep 2023 12:44:10 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:44:09 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230930144409.295068e1@windsurf>
In-Reply-To: <20230930054253.486201-2-dalang@gmx.at>
References: <20230930054253.486201-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696077850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSbh6f3JjD397/9Awf/GKcQAfDHgMJEHhNK3zQhVYT0=;
 b=lj1bFs6v1MABe+yFJw5BFcE4EJ3N3Ke/HioG7hYc/6HchMbQQLe5ORK4Ht9uQyr4LQgPAN
 i/UG6O8gknWQDqK2x0vgRjc+7SV+pjvNpROFM9QwrkhJ9ohM3/BFq/P1FiAIV1CqlmM/RD
 FVrIwBZ5DnguLN6JOhrnCMvnPdg1CrUcHpdk3RSHdIsnpxWjNipXoWLYDuj+6B+BI0jf0U
 VHxUJXhZ+R5XxS/px3O+3kQcJiYlu1BY6/K1cUfBcqHzJ9jkoMUpAEXbe0l9fwTL9dZMWE
 JEgxg24kj4DyrJlaFdPi4bANvg9410a307HmbmCNqHi8O7Q0T8la3bEe86ning==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lj1bFs6v
Subject: Re: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.8
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
Cc: James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Sep 2023 07:42:52 +0200
Daniel Lang <dalang@gmx.at> wrote:

> https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.8/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/gtkmm3/gtkmm3.hash | 4 ++--
>  package/gtkmm3/gtkmm3.mk   | 2 +-
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
