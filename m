Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D11C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF43D8136C;
	Tue, 23 Aug 2022 20:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF43D8136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYl3THTnwrgA; Tue, 23 Aug 2022 20:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB8C8134F;
	Tue, 23 Aug 2022 20:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB8C8134F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3CC1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C8360AAF
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C8360AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHQWbhMT-pTV for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AE560B38
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0AE560B38
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:18:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E745A20005;
 Tue, 23 Aug 2022 20:18:56 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:18:55 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220823221855.13cbddac@windsurf>
In-Reply-To: <20220821153104.239709-1-romain.naour@gmail.com>
References: <20220821153104.239709-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661285937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qf8A4xsuHAGhPmms4jWWwuv1n+YnLJsb5sgPQrGy3RA=;
 b=EQoyEd4b1OBMezdBBT5UYcYnszzLOK9k7whxzHWXaL16XyWCq2hj770F2zpFheQk+8/nt6
 2ioOlye9Ci856j3ojLAdFsQj2Y5fyT5aSYUgbYsAP5wGiYauEr21UJYxftriz1kS2K2z7o
 9uPtKiqtpaOLNpdZ1wK4KARfG/vjpGRTdT8jtIEXWlMrgRoJzN5EczunomDllOEdCAmpTB
 VE3HUA44PVoEa9MdwQTbc4gEcnq7ck3uD4lBCuJ2Oz15h3qeebazphcwxJbywR23vYIh9M
 Dw2Tsn589i3daWrKeYxLsDsj8B1mQs3o1mG5ULiVpE8HOhMN4JX8TWHbwozPCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EQoyEd4b
Subject: Re: [Buildroot] [for-next] package/gcc: bump to version 12.2.0
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

On Sun, 21 Aug 2022 17:31:03 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> See announce:
> https://gcc.gnu.org/pipermail/gcc-announce/2022/000174.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
>  package/gcc/Config.in.host                                    | 2 +-
>  package/gcc/gcc.hash                                          | 4 ++--
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/gcc/{12.1.0 => 12.2.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)

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
