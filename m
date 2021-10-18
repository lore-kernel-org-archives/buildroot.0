Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FFDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5053F61378
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5053F61378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A2380EE4;
	Tue, 19 Oct 2021 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-wq2KQEBWNY; Tue, 19 Oct 2021 17:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F1B80E9F;
	Tue, 19 Oct 2021 17:54:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA1581BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B73DE402B5
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxpFtEobWGYR for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:53:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C5DA4022B
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:53:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A25B920004;
 Tue, 19 Oct 2021 17:53:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mctIx-0005Xe-35; Tue, 19 Oct 2021 19:53:39 +0200
Resent-To: Yann E. MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 19 Oct 2021 19:53:39 +0200
Resent-Message-ID: <87wnm8aokc.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Oct 18 14:36:03 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20211013160230.001B195578@busybox.osuosl.org>
Date: Mon, 18 Oct 2021 14:36:03 +0200
In-Reply-To: <20211013160230.001B195578@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 13 Oct 2021 18:01:34 +0200")
Message-ID: <87h7deeci4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] fs/ext2: fir (again) namespace for
 variables
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5ece6be60b8147d05c7c51fd49f64e0140399727
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As reported by Jens [0], commit db7d78614098 (fs/ext2: fix namespace for
 > variables) forgot to rename one variable expansion, resulting in the
 > ext2 label as set by the user to be ignored, with an empty label set.

 > [0] https://github.com/buildroot/buildroot/commit/db7d78614098#commitcomment-57918423

 > Reported-by: Jens Maus <mail@jens-maus.de>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

fir? ;)

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
