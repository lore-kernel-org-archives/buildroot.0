Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89251C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52173826B4;
	Tue, 30 Nov 2021 16:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWjyHh65IZ-R; Tue, 30 Nov 2021 16:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0971826BB;
	Tue, 30 Nov 2021 16:24:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9261BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B7BC6070E
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BQ9KuD3uTxH for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8015E6070A
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:24:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8EF0020000D;
 Tue, 30 Nov 2021 16:24:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ms5vo-0005Xw-0A; Tue, 30 Nov 2021 17:24:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20211128131842.274555-1-texier.pj2@gmail.com>
Date: Tue, 30 Nov 2021 17:24:35 +0100
In-Reply-To: <20211128131842.274555-1-texier.pj2@gmail.com> (Pierre-Jean
 Texier's message of "Sun, 28 Nov 2021 14:18:42 +0100")
Message-ID: <87tuftfw70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/genimage: bump to version 15
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

>>>>> "Pierre-Jean" == Pierre-Jean Texier <texier.pj2@gmail.com> writes:

 > This includes the following changes:

[snip]

Not exactly the most useful summary to read, but OK. Diff'ing the
readme, I notice:

 > 1d72d80 image-hd: stricter option handling

Which introduces a partition-table-type = none/mbr/gpt/hybrid and
deprecates partition-table, which is used by:

board/altera/socrates_cyclone5/genimage.cfg

Care to send a followup patch to update that? Given

 > 5bd7283 image-hd.c: ignore in-partition-table when the image has no partition table

You can presumably drop the explicit in-partition-table from that file
as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
