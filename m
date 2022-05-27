Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B378C43219
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BEAE427D4;
	Fri, 27 May 2022 07:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uzq8bwmaCRLk; Fri, 27 May 2022 07:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E93427AE;
	Fri, 27 May 2022 07:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 860101BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D078427B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88eFtOYl6z0O for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:57:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B07684279
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:57:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 247281BF207;
 Fri, 27 May 2022 07:57:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuUr0-001CJg-94; Fri, 27 May 2022 09:57:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220423205934.446813-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 09:57:50 +0200
In-Reply-To: <20220423205934.446813-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 23 Apr 2022 22:59:34 +0200")
Message-ID: <87leuno1a9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: fix legal info
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 10648db92bc5c4bfd49b58ce4f1c213defdfc7de forgot to update hash of
 > LICENCE file (update in year:
 > https://github.com/PCRE2Project/pcre2/commit/3103b8f20a3b9944b177e812fde29fbfb8b90558):

 >>>> pcre2 10.40 Collecting legal info
 >  ERROR: LICENCE has wrong sha256 hash:
 >  ERROR: expected: 15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025
 >  ERROR: got     : 87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987

 > Fixes:
 >  - http://autobuild.buildroot.org/results/275c5478d63d3d4016d440870e96f04230df69d6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
