Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01477C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB276406D4;
	Mon, 25 Mar 2024 18:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8G4mSN85nD0c; Mon, 25 Mar 2024 18:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CE3406DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CE3406DB;
	Mon, 25 Mar 2024 18:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5188C1BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E96360659
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KESQBJGAtrQW for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F54D605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F54D605BB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F54D605BB
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:15:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E069C0008;
 Mon, 25 Mar 2024 18:15:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rooqe-0090Zc-2i;
 Mon, 25 Mar 2024 19:15:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240324181919.D8B6283C77@busybox.osuosl.org>
Date: Mon, 25 Mar 2024 19:15:04 +0100
In-Reply-To: <20240324181919.D8B6283C77@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Sun, 24 Mar 2024 19:16:25
 +0100")
Message-ID: <87a5mmb2l3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/busybox: remove tc from
 default config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=44c221c856a473179daeb9e49bcb89af2b1b1405
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Busybox tc fails to build with kernel >= 6.8
 > For details see https://bugs.busybox.net/show_bug.cgi?id=15934

 > In addition, tc is a very rarely used tool, so not something that you
 > expect to be available in busybox by default.

 > Therefore, remove it from the default config.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
