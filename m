Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7112DC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7866817C0;
	Sun, 27 Nov 2022 20:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7866817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq0slbwK0bRI; Sun, 27 Nov 2022 20:22:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471B0817A7;
	Sun, 27 Nov 2022 20:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 471B0817A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3A1F1BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF3A5817A7
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3A5817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hu8VQghhHViZ for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:22:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C711E8174C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C711E8174C
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:22:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ABCAAC0006;
 Sun, 27 Nov 2022 20:22:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ozOAe-000oey-O8; Sun, 27 Nov 2022 21:22:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20221124124546.9933F84504@busybox.osuosl.org>
Date: Sun, 27 Nov 2022 21:22:36 +0100
In-Reply-To: <20221124124546.9933F84504@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 24 Nov 2022 13:39:36 +0100")
Message-ID: <8735a4du5v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libopenssl: drop useless
 option for rc5
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d7178dd432e4905cf96383e5aa316553cf30f178
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit a83d41867c8d (package/libopenssl: add option to enable some
 > features) added an option to enable rc5. However, since commit
 > 1fff94121936 (Fixup non-x86 openssl build), dated 2002-12-30, rc5
 > has always been forcibly disabled in Buildroot.

 > Given that it was unconditionally disabled all this time, and no
 > one complained, it means there is virtually no-one using rc5, so we
 > can just drop the option.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
 > Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
