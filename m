Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C396C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DB9605CF;
	Sun,  1 Sep 2024 09:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QOFdRyLNAPV; Sun,  1 Sep 2024 09:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A1516068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1516068B;
	Sun,  1 Sep 2024 09:04:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB72E1BF3AA
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C315740176
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cjBWBkTgVqz for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FE2840021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE2840021
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FE2840021
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:03:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B05C240003;
 Sun,  1 Sep 2024 09:03:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skgV2-000mL0-0U;
 Sun, 01 Sep 2024 11:03:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240728163645.D8E488283C@busybox.osuosl.org>
Date: Sun, 01 Sep 2024 11:03:56 +0200
In-Reply-To: <20240728163645.D8E488283C@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 28 Jul 2024 18:36:28 +0200")
Message-ID: <87seuju4n7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/gdb: move GDB 14.x patches to
 the right folder
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=076f345accb811add37c96705ea1602a8a3b06a1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit bfefed17a9e5a421b3217685003d3b22c99de4ab ("package/gdb: bump
 > 14.x series from 14.1 to 14.2"), which upgraded the GDB 14.x series
 > from 14.1 to 14.2 forgot to rename the directory containing the
 > patches, causing them to no longer be applied.

 > The patches still apply properly with no change, so renaming the
 > directory is sufficient.

 >   http://autobuild.buildroot.net/results/b8c6af95b244272220c63847e7cc929c9c58eee4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
