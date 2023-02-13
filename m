Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D77C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8202281D47;
	Mon, 13 Feb 2023 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8202281D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDNhMk5fGXeL; Mon, 13 Feb 2023 19:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D573D81D18;
	Mon, 13 Feb 2023 19:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D573D81D18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC851BF284
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9E8041484
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 19:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E8041484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8O3q21giW8nw for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 19:26:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704D14146F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 704D14146F
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 19:26:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AC4E40002;
 Mon, 13 Feb 2023 19:26:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pReSx-002i8j-12; Mon, 13 Feb 2023 20:26:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
 <87h6vw5l2r.fsf@dell.be.48ers.dk>
 <7f57a607-bf3c-0250-ed23-c6fbf73961a3@gmail.com>
 <87r0uwcjgp.fsf@dell.be.48ers.dk>
 <13e96c75-2880-9631-0ae6-92be1e36c219@gmail.com>
Date: Mon, 13 Feb 2023 20:26:18 +0100
In-Reply-To: <13e96c75-2880-9631-0ae6-92be1e36c219@gmail.com> (Raphael
 Pavlidis's message of "Mon, 13 Feb 2023 19:46:55 +0100")
Message-ID: <87pmad9xk5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sway: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:

 > On 11.02.23 16:25, Peter Korsgaard wrote:
 >>>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:
 >> > Hi Peter,
 >> > On 08.02.23 14:43, Peter Korsgaard wrote:
 >> > [--SNIP--]
 >> >> How did you test this? Here wlroots with x11 support doesn't build
 >> >> as we
 >> >> don't have an Xwayland .pc file or binary in Buildroot.
 >> >>
 >> > I create a xwayland package, which build the xserver binary, but did
 >> > not send the patch yet. (This will fix the problems with weston, too)
 >> Ok, thanks - Will you submit the xwayland package?
 >> 

 > Yes, but I have to do some cleanups. Should I add you to CC then?

Ok, please do.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
