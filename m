Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9495AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341E661039
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 341E661039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC6B60871;
	Mon, 25 Oct 2021 11:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VCH3NGZLmtx; Mon, 25 Oct 2021 11:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855426086E;
	Mon, 25 Oct 2021 11:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56E9E1BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C4D4037F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAbuH6DY2ox3 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3725340373
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:43:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 91959C000B;
 Mon, 25 Oct 2021 11:43:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meyO7-0008WP-SC; Mon, 25 Oct 2021 13:43:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20211015125944.10587-1-peter@korsgaard.com>
 <CA+h8R2oSqdJLkx1Uxmipv7aG98OXLDLQ7XzbSHxdecLHksarYg@mail.gmail.com>
Date: Mon, 25 Oct 2021 13:43:35 +0200
In-Reply-To: <CA+h8R2oSqdJLkx1Uxmipv7aG98OXLDLQ7XzbSHxdecLHksarYg@mail.gmail.com>
 (Christian Stewart's message of "Sun, 17 Oct 2021 21:28:43 -0700")
Message-ID: <87sfwpwcrc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-cli: security bump to
 version 20.10.9
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:


 > Reviewed-by: Christian Stewart <christian@paral.in>
 > On Fri, Oct 15, 2021 at 5:59 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> Fixes the following security issue:
 >> 
 >> - CVE-2021-41092: Ensure default auth config has address field set, to
 >> prevent credentials being sent to the default registry.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
