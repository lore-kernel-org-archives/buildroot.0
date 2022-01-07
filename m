Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DD7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D39782EC7;
	Fri,  7 Jan 2022 23:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bl4bG_7DGUVD; Fri,  7 Jan 2022 23:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52078188B;
	Fri,  7 Jan 2022 23:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D71A71BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C328188B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEELJdk9kZqz for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:26:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC3BE8187F
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:26:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E29A7C0006;
 Fri,  7 Jan 2022 23:26:07 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5ycZ-0005lJ-95; Sat, 08 Jan 2022 00:26:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20211106111145.1648068-1-bernd.kuhls@t-online.de>
 <20211106111145.1648068-3-bernd.kuhls@t-online.de>
Date: Sat, 08 Jan 2022 00:26:07 +0100
In-Reply-To: <20211106111145.1648068-3-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 6 Nov 2021 12:11:45 +0100")
Message-ID: <87bl0njfg0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] package/freeswitch: bump version to
 1.10.7
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://github.com/signalwire/freeswitch/releases/tag/v1.10.7

 > Removed patch, upstream applied a different fix:
 > https://github.com/signalwire/freeswitch/commit/e9fde845de5b8885282bf5e70f4be3645c5c3e9b

 > Added optional dependency to libks, needed due to upstream commit
 > https://github.com/signalwire/freeswitch/commit/ed9851666615d283effb76edc7028cc08b07eff9

 > Added upstream patches to fix build errors.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: no changes, added libks to v2 of this patch series

This series was marked as superseeded in patchwork, but I applied it
anyway as freeswitch 1.10.7 fixes a number of fairly serious security
issues. Was there any specific reason why this was marked as
superseeded?

Updated the commit message to mention the security fixes and applied,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
