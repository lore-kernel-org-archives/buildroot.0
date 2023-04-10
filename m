Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EB0C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3F9613E3;
	Mon, 10 Apr 2023 19:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3F9613E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMSFN6L1YYce; Mon, 10 Apr 2023 19:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B49FD613DF;
	Mon, 10 Apr 2023 19:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49FD613DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E09E1BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A9881E0B
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A9881E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwV6D1sGSHvS for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:24:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE7C81E53
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FE7C81E53
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:24:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DBF61BF205;
 Mon, 10 Apr 2023 19:24:44 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plx88-0039Pq-58; Mon, 10 Apr 2023 21:24:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
References: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
 <20230327141122.103829-2-luca.ceresoli@bootlin.com>
Date: Mon, 10 Apr 2023 21:24:44 +0200
In-Reply-To: <20230327141122.103829-2-luca.ceresoli@bootlin.com> (Luca
 Ceresoli via buildroot's message of "Mon, 27 Mar 2023 16:11:22 +0200")
Message-ID: <87jzyjv8ub.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] docs/manual: ditch redundant -f 'rm'
 flag
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Luca" == Luca Ceresoli via buildroot <buildroot@buildroot.org> writes:

 > The value of the RM variable in make is 'rm -f', thus the additional -f is
 > redundant. Avoid it on the docs to avoid developers taking it as a good
 > example to follow.

 > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
