Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A731C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 12:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E0E0401BF;
	Mon, 26 Aug 2024 12:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Du7jH6GN7tzx; Mon, 26 Aug 2024 12:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A2F401CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A2F401CF;
	Mon, 26 Aug 2024 12:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88D891BF294
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 12:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7551C80BBA
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 12:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9c51XUSNCVm for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 12:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a10:de80:1:4091:b9e9:2212:0:1; helo=outbound.soverin.net;
 envelope-from=peter@digitalbrains.digbr.nl; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8707A80841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8707A80841
Received: from outbound.soverin.net (outbound.soverin.net
 [IPv6:2a10:de80:1:4091:b9e9:2212:0:1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8707A80841
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 12:05:00 +0000 (UTC)
Received: from smtp.freedom.nl (unknown [10.10.4.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by outbound.soverin.net (Postfix) with ESMTPS id 4Wsq9k5xTFz4V;
 Mon, 26 Aug 2024 12:04:58 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl
 (Postfix) with ESMTPSA id 4Wsq9k4SK0z4Y; 
 Mon, 26 Aug 2024 12:04:58 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl
 (Postfix) with ESMTPSA (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <peter@digitalbrains.com>)
 id 1siYSw-0002RV-13; Mon, 26 Aug 2024 14:04:58 +0200
Received: (nullmailer pid 75245 invoked by uid 1000);
 Mon, 26 Aug 2024 12:04:57 -0000
Date: Mon, 26 Aug 2024 14:04:57 +0200 (CEST)
X-Soverin-Authenticated: true
From: Peter Lebbing <peter@digitalbrains.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20240824210017.06355474@windsurf>
Message-ID: <b9377f39-1054-3570-b3a9-76c8d7c30d91@digitalbrains.com>
References: <20240820233830.5927db8d@windsurf>
 <20240821095044.10038-1-vjardin@free.fr>
 <20240821095044.10038-2-vjardin@free.fr> <20240824210017.06355474@windsurf>
MIME-Version: 1.0
X-Spampanel-Class: ham
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=digitalbrains.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lsuio: bump to 2020 version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

(resent because I completely failed to realise I'd need to first subscribe to
the mailing list before being able to CC it. Sorry!)

Hello Thomas, Vincent and mailing list,

Vincent asked me to create a tag with an incremented version number. I did that
and adjusted the --version output of the program and the ChangeLog, so it now
looks more like a real v0.3.0.

https://github.com/DigitalBrains1/lsuio/releases/tag/v0.3.0

Please note I moved the default branch from 'master' to 'main'; I thought there
were few enough people using the repository that the fallout would be small.

Regards,

Peter.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
