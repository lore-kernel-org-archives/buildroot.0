Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEF7EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0BA16135F;
	Wed, 14 Jun 2023 14:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0BA16135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0806G01z35O; Wed, 14 Jun 2023 14:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4BA96133B;
	Wed, 14 Jun 2023 14:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4BA96133B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61D381BF2B7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43FFC41518
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43FFC41518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlcChNE-zOeB for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:53:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D350400F1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D350400F1
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:53:15 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A151B40004;
 Wed, 14 Jun 2023 14:53:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Rs0-008ANg-Vm; Wed, 14 Jun 2023 16:53:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230607171708.595774-1-bernd.kuhls@t-online.de>
Date: Wed, 14 Jun 2023 16:53:12 +0200
In-Reply-To: <20230607171708.595774-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 7 Jun 2023 19:17:08 +0200")
Message-ID: <87zg52m6xz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: force arm mode
 instead of Thumb mode
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

 > Fix the following build failure:
 > /tmp/ccGKQdKj.s: Assembler messages:
 > /tmp/ccGKQdKj.s:199: Error: invalid constant (7) after fixup
 > /tmp/ccGKQdKj.s:327: Error: invalid constant (0) after fixup
 > /tmp/ccGKQdKj.s:338: Error: invalid constant (1) after fixup
 > /tmp/ccGKQdKj.s:345: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:354: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:372: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:528: Error: invalid constant (3f) after fixup
 > /tmp/ccGKQdKj.s:531: Error: invalid constant (3f) after fixup
 > /tmp/ccGKQdKj.s:202: Error: invalid constant (20000) after fixup
 > /tmp/ccGKQdKj.s:482: Error: invalid constant (20000) after fixup
 > /tmp/ccGKQdKj.s:549: Error: invalid constant (20000) after fixup

 > Fixes:
 > http://autobuild.buildroot.net/results/0103d64a4a6a9b0a708bfb77bf1714edc7acc714/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
