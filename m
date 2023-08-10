Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF0C001DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E5A41847;
	Thu, 10 Aug 2023 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41E5A41847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKq9ulv0DiXk; Thu, 10 Aug 2023 20:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E01F4185E;
	Thu, 10 Aug 2023 20:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E01F4185E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7D41BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24FCC835D3
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FCC835D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nQIph7ZFdcR for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:38:47 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CEB783595
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEB783595
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 14975A0ABB;
 Thu, 10 Aug 2023 22:38:45 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id EDF8980172;
 Thu, 10 Aug 2023 22:38:44 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id B8455C003C;
 Thu, 10 Aug 2023 22:38:44 +0200 (CEST)
To: buildroot@buildroot.org, Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 22:38:44 +0200
Message-ID: <5712460.DvuYhMxLoT@kilian-aisec>
In-Reply-To: <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <845846062.0ifERbkFSE@kilian-aisec>
 <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 776
X-purgate-ID: 154282::1691699924-1E7FEC09-0221CF17/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691699925;
 bh=jXDE5IfWW4CuPr1vNyNAy+iPL1/7BeqP23ul2aQKLZA=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=5CQH2FkkjRh8NETXFkthkfidh5nkKuDGjkvQUE3+cbpr8Jk7W29ZxVdiUmgz3/a9m
 jMF/BCy0p3iStzxBuiD7dJ1xLylsTwO9oO8/dy3BJYREDBahZCfKsSOxgXdfROXUjL
 bHGgYUKox8tCWkBKfBzjmJOak36JnTPY6JGhKVXpPSSHgJpaaWzhx6NkPlGA9zCSZX
 LSDKhtlag43bBhr0A9EyhBIUunfI9I0ueRqz2uRhFgc4vXyJX6FwIhTuWx0yIWmFD/
 NQa/rU0t8w46JNzRV+9Y/CWQYyruwkev63Q3PWXS3V2gPUt3bH0InnzBlTC+T4y5BQ
 Rzv81QU/DbRyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=5CQH2Fkk
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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

Hello Robert,

[--SNIP--]

> You 'need' two magical closed source bins:
> 
> https://git.beagleboard.org/beaglev-ahead/xuantie-ubuntu/-/tree/master/bins
> 
> light_aon_fpga.bin
> light_c906_audio.bin
> 
> light_aon_fpga.bin: "aon" is an `Always On` fpga binary used for power
> management... If you don't have this, the board will boot, but things
> like cpufreq don't work..
> light_c906_audio.bin: Probably Audio, never really tested it too much...

If we need these binary blobs, I think we also need the licensing information 
about the blobs. We had a similar case with blobs from Rockchip for the Radxa 
Rock 5B. Can you tell what the license for those blobs is? Do they originate 
from another repository?

[--SNIP--]

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
