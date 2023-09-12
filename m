Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6101BEE3F31
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58AF817A9;
	Tue, 12 Sep 2023 21:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58AF817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Stft3FdZZCt; Tue, 12 Sep 2023 21:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D4481516;
	Tue, 12 Sep 2023 21:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D4481516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEB71BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59F4981516
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F4981516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KD0_B7g6hu_5 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:09:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D300D81489
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D300D81489
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0D0A60006;
 Tue, 12 Sep 2023 21:09:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgAdC-001tgX-IV; Tue, 12 Sep 2023 23:09:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20230815093844.13369-1-ju.o@free.fr>
Date: Tue, 12 Sep 2023 23:09:10 +0200
In-Reply-To: <20230815093844.13369-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 15 Aug 2023 11:38:44 +0200")
Message-ID: <87o7i75cax.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] package/lsof: change
 _LICENSE_FILES to use COPYING
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit e3322e2c7 "lsof: add license info" added the package license
 > info. At that time, lsof was at version 4.85. The package was not
 > including a dedicated license file. Instead, the license text was
 > copied in many files (source files, readmes, ...). It was then decided
 > to use the small source file "dialects/linux/dproto.h".

 > Recently, lsof added a COPYING license file. See [1]. This commit was
 > first included in lsof version 4.97.0. We can now use this file.

 > The license file hash is updated due to formatting changes. As a side
 > note, the copyright year in source file was 1997 (see [2]), whereas in
 > the new license file it is 2002. Source files have different copyright
 > dates, and can be as old as 1994, for example in [3]. The rest of the
 > license text remains unchanged.

 > [1] https://github.com/lsof-org/lsof/commit/62dab61cae3ca9e4d41ec573ae5cda0c5689c326
 > [2] https://github.com/lsof-org/lsof/blob/4.98.0/dialects/linux/dproto.h#L9
 > [3] https://github.com/lsof-org/lsof/blob/4.98.0/arg.c#L7

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
