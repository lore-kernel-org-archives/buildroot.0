Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82ACC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 09:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E884160D;
	Sat, 12 Aug 2023 09:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E884160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHrvn_csOSIR; Sat, 12 Aug 2023 09:36:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CB641615;
	Sat, 12 Aug 2023 09:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CB641615
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF391BF863
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F25640236
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F25640236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_ojl9prSwsK for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 09:36:13 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06C0540159
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 09:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C0540159
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id D77E9A011B;
 Sat, 12 Aug 2023 11:36:10 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id BAB3B8014D;
 Sat, 12 Aug 2023 11:36:10 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3A1241001A8;
 Sat, 12 Aug 2023 11:36:10 +0200 (CEST)
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Aug 2023 11:36:09 +0200
Message-ID: <1859651.tdWV9SEqCh@kilian-aisec>
In-Reply-To: <20230808231913.1d0a98e1@windsurf>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
 <1860848.tdWV9SEqCh@kilian-aisec> <20230808231913.1d0a98e1@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1493
X-purgate-ID: 154282::1691832970-FEFFB7B6-C6FD838D/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691832970;
 bh=EmBLkQUd4+02KFSNmpcevlITxjw4ZLe2muEReJTvNqM=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=c9yZaSUhN1AsdQ6OXlfSkQqpMDsGRIUIchnQYIHu745cJWKdy/7MQvEAgs+TakDec
 p/CYmKexvbrTjlJ6qSgno9NwAe3526d7jEfXD1SITO69eydoYXkZkAwD6bEZsf+tA3
 +gSyOI7cQD7e00nd+TLHNNQcoNSnRfjlrmYy1XFCYVlJTFmjV9TaE20QQ8nSWvSpCi
 yG+KRuPw3o938ddzQMsKH00BKWB1NnombKhKo5o0ExVCLmLAmTZTQIVXjlpUsK1IAO
 p5I+P5mUb66fFtcXcxYXLl5PFyFULKasE0k7AUJvnbNnOQYvHQiOPHHhknfS/ZE+Pi
 mrcZLDyyqIU7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=c9yZaSUh
Subject: Re: [Buildroot] [PATCH 0/2] Fix Rock 5B build,
 broken by gcc 12 warnings
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[--SNIP--]

> > Thanks for the info, I actually would not have known this! I think that
> > the
> > best way is to ask the maintainers of the Radxa custom kernel whether they
> > may fix the remaining issues, so that the custom kernel compiles with gcc
> > 12.x. I intend to do so.
> 
> ACK.

I opened up an issue in their git about this. However, I must admit, I really 
doubt, that the Radxa people fix the warnings in their kernel in time for the 
next buildroot release, or even at all: They seem to have issues, reported 
last december, in their git, which they yet did not reply to. Now, I could 
give it a try and try to fix the warnigs of their custom code, but at the 
moment, I don't have the time, and I would rather like to focus on the 
BeagleV-Ahead board support :)

So I would argue to simply fix the gcc version to 11x for now:

1. I think this is legit in such cases - why else would the option even exist 
in buildroot.

2. Even if version 11 of gcc will be removed in the near future, we would then 
at least have one release version of buildroot, which features the Rock 5B. I 
think that would be a plus for makers, hobbyists and professionals, e.g., who 
use the Rock 5B to evaluate the RK3588 (I actually know one person who used 
the Rock 5B for such purposes). Also, maybe in the future I find time to 
prepare some patches, or maybe the Radxa people also fix it till then.

[--SNIP--]

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
