Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11701C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB4881E46;
	Sat,  5 Nov 2022 21:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB4881E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjp-ZW8M3rUX; Sat,  5 Nov 2022 21:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B5B81E39;
	Sat,  5 Nov 2022 21:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B5B81E39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 805F81BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C42260AB0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C42260AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY5azR5V_vIg for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394C860AAE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 394C860AAE
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:42:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2F781C0002;
 Sat,  5 Nov 2022 21:42:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1orQwE-00FaDV-0v; Sat, 05 Nov 2022 22:42:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026193508.482276-1-christian@paral.in>
 <20221026215058.1e623bb4@windsurf>
Date: Sat, 05 Nov 2022 22:42:49 +0100
In-Reply-To: <20221026215058.1e623bb4@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 26 Oct 2022 21:50:58 +0200")
Message-ID: <87iljtkrhi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.19.2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 26 Oct 2022 12:35:08 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> go1.19.2 includes security fixes to the archive/tar, net/http/httputil, and
 >> regexp packages, as well as bug fixes to the compiler, the linker, the runtime,
 >> and the go/types package.
 >> 
 >> https://go.dev/doc/devel/release#go1.19
 >> https://github.com/golang/go/issues?q=milestone%3AGo1.19.2+label%3ACherryPickApproved
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> package/go/go.hash | 2 +-
 >> package/go/go.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

I have instead updated 2022.02.x and 2022.08.x to 1.18.8, which includes
the same security fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
