Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6CBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEE560F9D
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AEE560F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46BD8403B1;
	Mon, 25 Oct 2021 11:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zF9SFvuTLTRq; Mon, 25 Oct 2021 11:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4801403A9;
	Mon, 25 Oct 2021 11:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 880DC1BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B8F80BF7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2eXkcJ7ygjZL for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:20:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CBAD80BF6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:20:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8BD642000D;
 Mon, 25 Oct 2021 11:20:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mey1o-0007l5-LY; Mon, 25 Oct 2021 13:20:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <be4f2e4a-4068-6467-27fa-df96969f1049@benettiengineering.com>
 <20211015081601.2472850-1-giulio.benetti@benettiengineering.com>
Date: Mon, 25 Oct 2021 13:20:32 +0200
In-Reply-To: <20211015081601.2472850-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 15 Oct 2021 10:16:01 +0200")
Message-ID: <875ytlxse7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/sunxi-mali-mainline-driver:
 update help section to make it work on Linux >= 4.20
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > On Linux version >= 4.20 in order to have mali working we need to pass
 > drm_kms_helper.drm_leak_fbdev_smem=1 and at least
 > drm_kms_helper.drm_fbdev_overalloc=200 to have a double buffer fbdev.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
