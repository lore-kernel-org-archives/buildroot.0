Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7308C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 518146110C;
	Tue,  7 Mar 2023 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518146110C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gW62YLEEtcl4; Tue,  7 Mar 2023 21:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9BE46110A;
	Tue,  7 Mar 2023 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9BE46110A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 897271BF33B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63D9981E5E
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D9981E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXrwqVUar2y5 for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:19:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623A081E5D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 623A081E5D
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:19:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DA1540005;
 Tue,  7 Mar 2023 21:19:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pZeiE-003Qb0-94; Tue, 07 Mar 2023 22:19:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB0493CA480A72DCB0A86ECFAE9FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Tue, 07 Mar 2023 22:19:10 +0100
In-Reply-To: <VI1P190MB0493CA480A72DCB0A86ECFAE9FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 (Lang Daniel via buildroot's message of "Thu, 2 Mar 2023 08:50:35
 +0000")
Message-ID: <87a60o45v5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools: force cross compiling
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:

 > By default autotools enters cross-compiling mode if --build and --host
 > differ [0]. Depending on the host architecture and how toolchain
 > providers set the triplet it might be the same. This triggers autotools to
 > compile and run a program on the host. If it is executable
 > cross-compiling isn't entered.
 > As pointed out by the autoconf mailing list [1] one can force cross
 > compiling.

 > [0]:
 > https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html
 > [1]: https://lists.gnu.org/archive/html/bug-autoconf/2023-03/msg00001.html

 > Fixes:
 >  - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/

 > Signed-off-by: Daniel Lang <d.lang@abatec.at>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
