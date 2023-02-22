Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A56C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8E31416ED;
	Wed, 22 Feb 2023 16:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E31416ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfOEJQjDxxQ6; Wed, 22 Feb 2023 16:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C142416CB;
	Wed, 22 Feb 2023 16:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C142416CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC471BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A3E1416CB
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A3E1416CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6iFbABIrzRN for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:47:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D48940B64
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D48940B64
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:47:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36A38C0008;
 Wed, 22 Feb 2023 16:47:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUsH8-00835w-9d; Wed, 22 Feb 2023 17:47:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-19-ricardo.martincoski@gmail.com>
Date: Wed, 22 Feb 2023 17:47:26 +0100
In-Reply-To: <20221127130739.1862398-19-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 27 Nov 2022 10:07:32 -0300")
Message-ID: <87mt55sl41.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 18/25] package/openpowerlink: properly handle
 legacy options
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "b1063a0136 package/openpowerlink: bump to v2.2.2" tried to add
 > legacy handling but the new symbols are part of a choice, and Kconfig
 > does not enforce the select of a option from a choice.

 > Update the legacy entry for 2016.02, following the example described in
 > the beginning of the file.

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
