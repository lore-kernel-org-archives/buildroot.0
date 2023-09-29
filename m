Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29311E728E5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7775820AB;
	Fri, 29 Sep 2023 20:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7775820AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEeZUGbhUmc5; Fri, 29 Sep 2023 20:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B00DA82217;
	Fri, 29 Sep 2023 20:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00DA82217
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB5DA1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3AED41DB5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3AED41DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE89aY4n49E1 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:11:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5316341DB3
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5316341DB3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5446B60006;
 Fri, 29 Sep 2023 20:11:08 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmJpL-007Upg-Mp; Fri, 29 Sep 2023 22:11:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230917210523.1577198-1-mail@jens-maus.de>
 <20230922194754.450547-1-mail@jens-maus.de>
Date: Fri, 29 Sep 2023 22:11:07 +0200
In-Reply-To: <20230922194754.450547-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Fri, 22 Sep 2023 21:47:54 +0200")
Message-ID: <87fs2weo4k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/monit: update to 5.33.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jens Maus <mail@jens-maus.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > This commit updates monit to the latest 5.33.0 version which also
 > requires some additional patch to configure as well as enabled ipv6
 > support.

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

 > ---
 > Changes v1 -> v2:
 >   - added Signed-off-by and Upstream (Arnout)
 >   - revised configure.ac patch (Arnout)
 >   - minor changes to monit.mk (Arnout)

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
