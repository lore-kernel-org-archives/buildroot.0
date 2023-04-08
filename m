Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53C9C7619A
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 19:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1008640516;
	Sat,  8 Apr 2023 19:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1008640516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyL9NrsS4T98; Sat,  8 Apr 2023 19:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6599E4038B;
	Sat,  8 Apr 2023 19:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6599E4038B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4B741C31DC
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70E8D41B9B
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E8D41B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxQcLt30LWgA for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 19:42:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF9141B90
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF9141B90
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 19:42:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62DC9FF804;
 Sat,  8 Apr 2023 19:42:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plERn-000qNL-8K; Sat, 08 Apr 2023 21:42:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Steve Hay via buildroot <buildroot@buildroot.org>
References: <20230319142213.3045818-1-me@stevenhay.com>
Date: Sat, 08 Apr 2023 21:42:03 +0200
In-Reply-To: <20230319142213.3045818-1-me@stevenhay.com> (Steve Hay via
 buildroot's message of "Sun, 19 Mar 2023 15:22:12 +0100")
Message-ID: <87bkjyxit0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Steve" == Steve Hay via buildroot <buildroot@buildroot.org> writes:

 > The impetus for this change was that wget fails to load pages signed by
 > Let's Encrypt due to missing root certs. This version has the updated and
 > correct certs.

 > 0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

 > Patch dropped because the fix is incorporated upstream.

 > Signed-off-by: Steve Hay <me@stevenhay.com>

 > ---
 > Changes v1 -> v2
 >     - Removed the extraneous comment in the make file.
 >     - Fixed patch header.
 >     - Added note to the log as to why the patch was dropped.

 > Changes v2 -> v3
 >     - The v2 patch did not include the changes. This one does.

 > Signed-off-by: Steve Hay <me@stevenhay.com>

Committed to 2023.02.x and 2022.02.x, thanks.

You seem to have done something funky upside down unicode with your
from, please don't do that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
