Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184B6CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 13:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11A983FBE;
	Sun, 24 Aug 2025 13:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lq9RsviqmV5i; Sun, 24 Aug 2025 13:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DB183ED9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DB183ED9;
	Sun, 24 Aug 2025 13:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA2219C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 321F583ED9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8xQ7VNdRX3Z for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 13:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C99583EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C99583EA7
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C99583EA7
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:41:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 654194E40C49;
 Sun, 24 Aug 2025 13:41:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33025605F1;
 Sun, 24 Aug 2025 13:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 632751C22D6A8; 
 Sun, 24 Aug 2025 15:41:48 +0200 (CEST)
Date: Sun, 24 Aug 2025 15:41:39 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250824154139.56786f08@windsurf>
In-Reply-To: <ced67667-9a6e-4d76-a715-0f13cf31b4d7@smile.fr>
References: <20250817212249.2653921-1-thomas.petazzoni@bootlin.com>
 <ced67667-9a6e-4d76-a715-0f13cf31b4d7@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756042912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zEkKMWjFCxaAOhuiwNDOYhQwjv+ht+xihny5hJqPR1Y=;
 b=BKDCzGsgd6rQya0vs+rJF8W5765Em5WS889B+IoYqJYV9CVlX6rlAYbMLrW5Tti1yTxBEw
 3xnJlR3bNh+Dhmjl+KBzgf2dtQKkUoQBcvTcGQXCn44edtG7M4mtnHoBaULWN6G3xM2Kxh
 K+jCTk5CokfmC0uGzGssEYGzvSwGE6TJ2F4ErMCS3AeEWL6Mnvt1BSvHkETDx1J8pD/0oQ
 JVVQPep9aKwccxAjo7M6W8Y8mm5XBFo7DEAzKmS9xi0nFm/U1NnRbbBu8c/fOr18yEmY7n
 uslnEzHD99JinLw8shaVNEdug0VmGl/lrj2NA2HOfr0ctPqarq3l5o889qewOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BKDCzGsg
Subject: Re: [Buildroot] [PATCH] package/gdb: really fix build with GCC 15.x
 by using external readline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Aug 2025 15:38:01 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> I'm agree on the principle but what about gdb TUI option (BR2_PACKAGE_GDB_TUI)?
> gdb TUI seems really requires ncurses [1].
> 
> ncurses package should be selected by gdb TUI.

Note that our readline package does select ncurses. However, if GDB's
tui uses ncurses directly, then we should also have a "select
BR2_PACKAGE_NCURSES" for this option.

Indeed, readline can potentially *not* use ncurses: it can use the
termcap library instead of ncurses. This is not the choice we've made
in Buildroot, but it's a possible option.

I'll rework the patch accordingly.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
