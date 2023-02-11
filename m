Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CD1C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 15:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F029A40420;
	Sat, 11 Feb 2023 15:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F029A40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSM1Od8vq1Yn; Sat, 11 Feb 2023 15:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C6DF40360;
	Sat, 11 Feb 2023 15:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6DF40360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B489E1BF293
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF5B81FF8
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF5B81FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN4LO_6y58Xi for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 15:25:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D56881FF4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D56881FF4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 15:25:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 394A4FF804;
 Sat, 11 Feb 2023 15:25:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQrl0-001YzO-5u; Sat, 11 Feb 2023 16:25:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
 <87h6vw5l2r.fsf@dell.be.48ers.dk>
 <7f57a607-bf3c-0250-ed23-c6fbf73961a3@gmail.com>
Date: Sat, 11 Feb 2023 16:25:42 +0100
In-Reply-To: <7f57a607-bf3c-0250-ed23-c6fbf73961a3@gmail.com> (Raphael
 Pavlidis's message of "Sat, 11 Feb 2023 14:53:15 +0100")
Message-ID: <87r0uwcjgp.fsf@dell.be.48ers.dk>
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

 > Hi Peter,
 > On 08.02.23 14:43, Peter Korsgaard wrote:
 > [--SNIP--]
 >> How did you test this? Here wlroots with x11 support doesn't build
 >> as we
 >> don't have an Xwayland .pc file or binary in Buildroot.
 >> 
 > I create a xwayland package, which build the xserver binary, but did
 > not send the patch yet. (This will fix the problems with weston, too)

Ok, thanks - Will you submit the xwayland package?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
