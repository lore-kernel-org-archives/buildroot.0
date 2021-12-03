Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3E4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4507682C91;
	Fri,  3 Dec 2021 16:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZMOwRBy_At7; Fri,  3 Dec 2021 16:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28FF83032;
	Fri,  3 Dec 2021 16:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 905991BF589
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F5E960B86
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyAiH1RJ04tz for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:43:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4005B607A3
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:43:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B32BEE000A
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:43:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mtBeF-0006IP-Sj
 for buildroot@buildroot.org; Fri, 03 Dec 2021 17:42:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211202223245.16511-1-peter@korsgaard.com>
Date: Fri, 03 Dec 2021 17:42:59 +0100
In-Reply-To: <20211202223245.16511-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Dec 2021 23:32:43 +0100")
Message-ID: <8735n9d4h8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/icu: backport upstream security fix
 for CVE-2021-30535
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2021-30535: Double free in ICU in Google Chrome prior to
 > 91.0.4472.77 allowed a remote attacker to potentially exploit heap
 > corruption via a crafted HTML page.

 > https://nvd.nist.gov/vuln/detail/CVE-2021-30535

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
