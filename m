Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025F1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 764EB611F2
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 764EB611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD76405BB;
	Mon,  4 Oct 2021 21:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gj8qu-52B4Wc; Mon,  4 Oct 2021 21:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F45F405B8;
	Mon,  4 Oct 2021 21:57:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15931BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A89D83C4F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6I-HVpQCeCO for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:57:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3293C83C4D
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:57:04 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 58E17100002;
 Mon,  4 Oct 2021 21:57:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXVxG-0005ui-My; Mon, 04 Oct 2021 23:57:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210922192613.081A18C9E3@busybox.osuosl.org>
Date: Mon, 04 Oct 2021 23:57:02 +0200
In-Reply-To: <20210922192613.081A18C9E3@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 22 Sep 2021 21:21:37 +0200")
Message-ID: <87mtnoe9n5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libsndfile: add security patch
 for CVE-2021-3246
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=cb18218ad125c1e4c13010c8ee946057ee07103c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > A heap buffer overflow vulnerability in msadpcm_decode_block of libsndfile
 > 1.0.30 allows attackers to execute arbitrary code via a crafted WAV file.

 > https://nvd.nist.gov/vuln/detail/CVE-2021-3246

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
