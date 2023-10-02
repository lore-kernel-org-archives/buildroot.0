Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CDE784AC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 11:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D400A82F20;
	Mon,  2 Oct 2023 11:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D400A82F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2fZy0EKW92V; Mon,  2 Oct 2023 11:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC9982F4A;
	Mon,  2 Oct 2023 11:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC9982F4A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 211A11BF404
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 11:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECFC841DBC
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 11:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECFC841DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_B9365fr0Xv for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 11:23:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4F1B4049C
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 11:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F1B4049C
Received: by mail.gandi.net (Postfix) with ESMTPSA id F21AB240002;
 Mon,  2 Oct 2023 11:23:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qnH1S-000YFx-8u; Mon, 02 Oct 2023 13:23:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231001094408.3880093-1-peter@korsgaard.com>
Date: Mon, 02 Oct 2023 13:23:34 +0200
In-Reply-To: <20231001094408.3880093-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 1 Oct 2023 11:44:08 +0200")
Message-ID: <87cyxxgte1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gnuplot: unbreak !gd builds since
 5.4.9 bump
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433/

 > Fix a build failure for --without-gd builds since the bump to 5.4.9 with
 > commit 6dc3d3c3606 (package/gnuplot: bump version to 5.4.9):

 > In file included from term.h:298,
 >                  from term.c:1211:
 > ../term/post.trm:4016:11: error: expected declaration specifiers or '...' before string constant
 >  4016 |     fputs("%%%%BeginImage\n", gppsfile);

 > Add a patch fixing that.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

This is now merged upstream - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
