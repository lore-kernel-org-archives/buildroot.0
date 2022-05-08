Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8486340629;
	Sun,  8 May 2022 09:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_57X2AoKsHi; Sun,  8 May 2022 09:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBBA64019D;
	Sun,  8 May 2022 09:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEF4C1BF487
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 09:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDE7860EAE
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 09:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oPDu9Xcf416 for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 09:06:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0BF76058F
 for <buildroot@buildroot.org>; Sun,  8 May 2022 09:06:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B4211C0008;
 Sun,  8 May 2022 09:06:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nncsB-000xXh-7s; Sun, 08 May 2022 11:06:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alex <earthquake.de@freenet.de>
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
 <874k221y8l.fsf@dell.be.48ers.dk>
 <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de>
Date: Sun, 08 May 2022 11:06:39 +0200
In-Reply-To: <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de> (Alex's message
 of "Sun, 8 May 2022 10:35:34 +0200")
Message-ID: <87zgjsxujk.fsf@dell.be.48ers.dk>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alex" == Alex  <earthquake.de@freenet.de> writes:

 > Hi,
 > I created a target package for ACE(+TAO).
 > From the package I need the Idl compiler for the host.
 > Therefore I created a host makefile for building the IDL compiler
 > (just the idl compiler (with static option...)).

 > So, if I build the idl compiler for the target, compile is
 > successfull. (make with TARGET_CONFIGURE_OPTS)
 > But buiding for the host (make with HOST_CONFIGURE_OPTS) the build
 > fails with

 >  g++: error: /usr/bin/g++": No such file or directory

 > In buildroot-config, BR2_TOOLCHAIN_BUILDROOT_CXX is set.

 > So how can I get a g++ for host building?

You need to instal g++ on your build machine.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
