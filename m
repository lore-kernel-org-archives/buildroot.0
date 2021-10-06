Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D325C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DBA60F92
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9DBA60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF35F40589;
	Wed,  6 Oct 2021 12:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2RT5UyUuPRy; Wed,  6 Oct 2021 12:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23AD340551;
	Wed,  6 Oct 2021 12:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA6C1BF42C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B14240551
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJGKRZCbgtoK for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77C134054B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:03 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0C453FF803;
 Wed,  6 Oct 2021 12:53:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY6Qp-0001JU-8A; Wed, 06 Oct 2021 14:53:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210926214229.8BC688D30A@busybox.osuosl.org>
Date: Wed, 06 Oct 2021 14:53:59 +0200
In-Reply-To: <20210926214229.8BC688D30A@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 26 Sep 2021 23:37:21 +0200")
Message-ID: <87bl428gbc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/python-django: bump to version
 3.2.7
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f71e240229894acee49ed556b2d939a875939dc6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Bugfix release, fixing a number of regressions:

 > - Fixed a regression in Django 3.2 that caused a crash validating "NaN"
 >   input with a forms.DecimalField when additional constraints, e.g.
 >   max_value, were specified (#32949).

 > - Fixed a bug in Django 3.2 where a system check would crash on a model with
 >   a reverse many-to-many relation inherited from a parent class (#32947).

 > - Fixed a regression in Django 3.2 that caused the incorrect offset
 >   extraction from fixed offset timezones (#32992).

 > https://docs.djangoproject.com/en/3.2/releases/3.2.6/
 > https://docs.djangoproject.com/en/3.2/releases/3.2.7/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
