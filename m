Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F59C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F19E340025;
	Sat, 10 Aug 2024 19:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3LYe2G3vG2p; Sat, 10 Aug 2024 19:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D425740167
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D425740167;
	Sat, 10 Aug 2024 19:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 181A61BF20F
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 120AF80CDC
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 19:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3KYXzb3mmuR for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 19:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4621980CD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4621980CD9
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4621980CD9
 for <buildroot@uclibc.org>; Sat, 10 Aug 2024 19:35:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1scrrn-0002j9-Hg
 for buildroot@uclibc.org; Sat, 10 Aug 2024 21:35:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 10 Aug 2024 21:34:35 +0200
Message-ID: <pan$65345$fb1c7a5$dbe447de$2b3fe0d6@ID-313208.user.individual.net>
References: <20240810085529.377663-1-thomas.petazzoni__14391.9217445486$1723280160$gmane$org@bootlin.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH next] package/{glibc,
 localdef}: bump to version 2.40
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sat, 10 Aug 2024 10:55:27 +0200 schrieb Thomas Petazzoni via buildroot:

> -LOCALEDEF_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
> +LOCALEDEF_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0

Hi Thomas,

package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-
localede.patch needs a rebase:

Applying 0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch 
using patch: 
patching file include/features.h
Hunk #1 FAILED at 207.
1 out of 1 hunk FAILED -- saving rejects to file include/features.h.rej

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
