Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3339C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2749B402A8;
	Mon, 18 Mar 2024 11:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaH0XGPiUcxK; Mon, 18 Mar 2024 11:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BDAF40646
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BDAF40646;
	Mon, 18 Mar 2024 11:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F13A91BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE158148B
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGtGcQH-MiSp for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F20408164B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20408164B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F20408164B
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:39:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B9241C0009;
 Mon, 18 Mar 2024 11:39:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmBKc-002bTI-1P;
 Mon, 18 Mar 2024 12:39:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sen Hastings <sen@hastings.org>
References: <20240213120714.393026-1-sen@hastings.org>
Date: Mon, 18 Mar 2024 12:39:06 +0100
In-Reply-To: <20240213120714.393026-1-sen@hastings.org> (Sen Hastings's
 message of "Tue, 13 Feb 2024 12:07:14 +0000")
Message-ID: <87jzlzhiqt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: make current
 version cell scrollable
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

>>>>> "Sen" == Sen Hastings <sen@hastings.org> writes:

 > *Resubmitted to mailing list because I messed up the subject line.*
 > I realized that instead of truncating the version number,
 > we could simply make the cell horizontally scrollable.
 > This of course allows us to have a fixed cell width,
 > while preserving the full version number.

 > A demo is available here:
 > https://sen-h.codeberg.page/pkg-stats-demos/@pages/make-current-version-cell-scrollable.html

 > Signed-off-by: Sen Hastings <sen@hastings.org>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
