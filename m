Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3136DC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2EF14045D;
	Mon,  8 Jul 2024 06:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgBvDne1Kiyq; Mon,  8 Jul 2024 06:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFCBA40468
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFCBA40468;
	Mon,  8 Jul 2024 06:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45DD61BF2C2
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3035F81086
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAYnEsGGjBco for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F8398105C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8398105C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F8398105C
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:52:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF747FF803;
 Mon,  8 Jul 2024 06:52:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sQiF3-0018SI-33;
 Mon, 08 Jul 2024 08:52:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
 <20240621161049.4085310-2-dario.binacchi@amarulasolutions.com>
Date: Mon, 08 Jul 2024 08:52:53 +0200
In-Reply-To: <20240621161049.4085310-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Fri, 21 Jun 2024 18:10:45 +0200")
Message-ID: <871q44s7cq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/6] package/libopenssl: replace engines-1.1
 to engines-3
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The bump to version 3.0.9 and all subsequent updates forgot to change
 > the directory name, which remained that of version 1.1. The patch
 > fixes the directory name to be consistent with the version.

 > In the case the library was not built with engine support, this resulted
 > in the presence of files in the root file system that should have been
 > removed.

 > Fixes: 3c66f65a6a54 ("package/libopenssl: bump version to 3.0.9")
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
