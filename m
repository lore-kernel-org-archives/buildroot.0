Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABCBEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72BFD40606;
	Sun, 16 Jul 2023 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72BFD40606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BE5pXmBBFAjS; Sun, 16 Jul 2023 17:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB923405CF;
	Sun, 16 Jul 2023 17:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB923405CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1411BF391
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D36817A3
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D36817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-hQ6s4AMPWk for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 17:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2EBA8177C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2EBA8177C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 17:45:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 191E920008;
 Sun, 16 Jul 2023 17:45:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qL5o6-00D0Q8-6y; Sun, 16 Jul 2023 19:45:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230612170110.1550878-1-bernd.kuhls@t-online.de>
Date: Sun, 16 Jul 2023 19:45:18 +0200
In-Reply-To: <20230612170110.1550878-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 12 Jun 2023 19:01:10 +0200")
Message-ID: <87fs5nbvip.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/assimp: needs gcc >= 7
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d6c/d6caf3c2c0fd670e70950d3e89629df39f8ce596/

 > After adding various fixes for the autobuilder error and subsequent
 > build errors this build error can only be fixed by using gcc >= 7:

 > output/build/assimp-5.2.5/code/AssetLib/Obj/ObjFileParser.cpp:55:23:
 >  fatal error: string_view: No such file or directory

 > Usage of string_view was added in version 5.2.5 by upstream commit
 > https://github.com/assimp/assimp/commit/f6bcb160d08af267778fbc59b480ce5d9c52c92c
 > which was added to buildroot by commit
 > 7d843d9cc0064d6690cfc000e579f575e2c0cc4d

 > Removed BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is only valid for gcc < 7

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
