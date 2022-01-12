Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D264C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A7840961;
	Wed, 12 Jan 2022 08:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmeTpm7wHZvE; Wed, 12 Jan 2022 08:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A04040283;
	Wed, 12 Jan 2022 08:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1561BF2C7
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED0F428A0
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 08:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myioo8I7tVhb for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 08:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 720C74162D
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 08:14:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 140031C0009;
 Wed, 12 Jan 2022 08:14:22 +0000 (UTC)
Date: Wed, 12 Jan 2022 09:14:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220112091422.1cd29c1f@windsurf>
In-Reply-To: <20201004224137.193808-1-nolange79@gmail.com>
References: <20201004224137.193808-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] skeleton + init: prepare /run/lock and
 adjust compat symlinks
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
Cc: joseph.kogut@gmail.com, Adam Duskett <aduskett@gmail.com>,
 =?UTF-8?B?TWljaGE=?= =?UTF-8?B?xYIgxYF5c3pjemVr?=
 <michal.lyszczek@bofc.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Norbert,

On Mon,  5 Oct 2020 00:41:36 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Linux distros changed /var/run and /var/lock to reside on an tmpfs in
> /run a long time ago, and buildroot seems to agree by providing this
> tmpfs on all supported init systems.

I am not 100% sure but it seems like this patch has potentially broken
the build of vtun, which now fails with:

  /usr/bin/install: cannot create directory '/home/giuliobenetti/autobuild/run/instance-0/output-1/target/var/lock': File exists

If you look at http://autobuild.buildroot.net/?reason=vtun%, vtun
version 3.0.4 restarted failing to build on January 10, with this error.

Could you have a look ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
