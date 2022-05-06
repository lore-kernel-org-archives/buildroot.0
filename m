Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E77C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 15:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2383641913;
	Fri,  6 May 2022 15:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMyyeGD_a8jz; Fri,  6 May 2022 15:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBE7418F6;
	Fri,  6 May 2022 15:23:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2CE51C11A9
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0149416B5
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IvA5_AIEayvE for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 15:23:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9363141604
 for <buildroot@buildroot.org>; Fri,  6 May 2022 15:23:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A36F20011;
 Fri,  6 May 2022 15:23:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nmznf-00H8ya-04; Fri, 06 May 2022 17:23:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Earthquake <earthquake.de@freenet.de>, buildroot@buildroot.org
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
Date: Fri, 06 May 2022 17:23:22 +0200
In-Reply-To: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de> (Earthquake's
 message of "Fri, 6 May 2022 16:19:03 +0200")
Message-ID: <874k221y8l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot host builds with g++
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
Cc: busybox@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Earthquake" == Earthquake  <earthquake.de@freenet.de> writes:

 > Hi,
 > building package for the host, ends with:
 > g++: error: /usr/bin/g++": No such file or directory

 > Building the same package for the target works....

 > Package mk for host build calls generic-package and host-generic-package.

This sounds like a Buildroot question rather than a Busybox one, so
please followup on the Buildroot list (buildroot@buildroot.org).

With that said, if your package is written in C++ and you try to build
it for the host, then you need a C++ compiler on your host, but please
provide some more details about what exactly you are trying to do.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
