Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8392C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505EC81AF4;
	Thu,  1 Dec 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505EC81AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qykAnvL68VaC; Thu,  1 Dec 2022 20:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 853A881992;
	Thu,  1 Dec 2022 20:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853A881992
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 292F71BF267
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A4D41009
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A4D41009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cA_G9FJpt3sW for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:59:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E67740B76
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E67740B76
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:59:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CFA9720002;
 Thu,  1 Dec 2022 20:59:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0qe5-006vhg-I4; Thu, 01 Dec 2022 21:59:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221201104313.25K7I8a6@myt5-1a3effcffc39.qloud-c.yandex.net>
 <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
 <20221201165150.4746c32e@windsurf>
 <a89a5a97-317a-b634-65ad-5fa11e526bc0@yuriev.ru>
 <20221201174145.5e70863c@windsurf>
Date: Thu, 01 Dec 2022 21:59:01 +0100
In-Reply-To: <20221201174145.5e70863c@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 1 Dec 2022 17:41:45 +0100")
Message-ID: <87edtic02y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-30
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
Cc: Leonid Yuriev <leo@yuriev.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 1 Dec 2022 19:01:55 +0300
 > Leonid Yuriev <leo@yuriev.ru> wrote:

 >> Commit f54bf3ecc638b62162a43f8c276407ad1ffa0dd4

 > Thanks, but please keep the Buildroot mailing list in Cc when replying
 > :-)

Are you sure about that commit? We don't seem to such a commit in
buildroot, and as far as I can see on
https://gitflic.ru/project/erthink/libmdbx/commit/f54bf3ecc638b62162a43f8c276407ad1ffa0dd4,
neither does upstream libmdbx?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
