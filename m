Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A146EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B9B416A5;
	Mon, 10 Jul 2023 18:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B9B416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDZBfDV8YKHx; Mon, 10 Jul 2023 18:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F754098E;
	Mon, 10 Jul 2023 18:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F754098E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D72571BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDE86100F
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDE86100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHTAu6FlifXh for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:47:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28F3F6100E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28F3F6100E
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:47:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B40F20008;
 Mon, 10 Jul 2023 18:47:09 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:47:07 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230710204704.6eba9c3f@windsurf>
In-Reply-To: <20230620170726.3644-1-ckhardin@gmail.com>
References: <20230620170726.3644-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689014829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnUfR2W9PPTiLq08ERHw8n9g1C08WPvDw+w/F9LpwP0=;
 b=pqfNhGeWWbur3I4bCyu5uR14l+85Sh7By2aFKm7eYBxEN3wVOaHVrFYQxIUJyJ0UJ5dwzI
 +BZs/0t5m6zypvTE4CzEjpXL1yW3sUZ5bZc0gKJ/6V3iaAt0Ig7lToRuDSHgXshuiKUNZo
 m9vE2H1VCHTF3ErKCUbRv4sARvCPKGv3TQ/CpqfwVBE1uGxuvc2FboeNXSy5TkTrD1kyAQ
 12lIHpO8DQ5bRoAioy4MKn7jkq5G2kmpnT83UkkklYkYIQwY6j4U7iSeGdd7QCiKopr0EQ
 UKEmK9QlDaasJgkNnJ5hXHJWYn2AAtM0t9VVkKdTS9NB3SzgPdYseREXaC2C+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pqfNhGeW
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix dhcp symlink in
 target/var/lib/dhcp
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

+Yann in Cc. I will ask a few questions below, but honestly I'm not
super familiar with this part of the code base, so I might be asking
some stupid questions.

On Tue, 20 Jun 2023 10:07:26 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> In a readonly fs configuration the skeleton-init-fs will move

I supposed you meant skeleton-init-systemd. Indeed, there's nothing
named skeleton-init-fs in Buildroot as far as I know.

> the var directories to the usr/share/factory and the run a command
> like this:
> 
>    mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
>    mkdir -p $(TARGET_DIR)/var
>    for i in $(TARGET_DIR)/usr/share/factory/var/* \
>             $(TARGET_DIR)/usr/share/factory/var/lib/* \
>             $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do
> 
> If the symlink is to the /tmp directory the glob compare on the
> dhcp link will evaluate and result in an incorrect entry being
> created in the resulting tmpfs mount on var.

I'm not able to parse your explanation here. Which glob compare? Which
evaluation?

> 
>     L+! /var/lib/dhcp - - - - ../usr/share/factory//var/lib/dhcp

Not obvious to me what is invalid in this entry, but admittedly I have
not done a test build/test run to investigate more.

Perhaps you can give a little bit more details to make the issue
obvious to the reviewer, and therefore help your patch to be merged?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
