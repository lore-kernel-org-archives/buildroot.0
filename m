Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9124C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9C0403C7;
	Tue,  1 Feb 2022 22:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJGV5WADN5KQ; Tue,  1 Feb 2022 22:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08E540304;
	Tue,  1 Feb 2022 22:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE1501BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93C7400CE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsj5w0ZC-IeH for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:17:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DDE3400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:17:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77807FF802;
 Tue,  1 Feb 2022 22:17:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nF1Sa-00004t-Cb; Tue, 01 Feb 2022 23:17:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220131123441.3645526-1-giulio.benetti@benettiengineering.com>
Date: Tue, 01 Feb 2022 23:17:12 +0100
In-Reply-To: <20220131123441.3645526-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 31 Jan 2022 13:34:41 +0100")
Message-ID: <87sft21bbr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/at: bump version to 3.2.4
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > All local patches except on have been upstreamed, so let's remove them and
 > rename/rebase the remaining one.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 >  +++ b/Makefile.in
 > -@@ -99,43 +99,42 @@ atrun: atrun.in
 > +@@ -25,6 +25,10 @@ DESTDIR 	= $(IROOT)
 > + $(warning IROOT is deprecated, you should use DESTDIR instead)
 > + endif
 > + 
 > ++ifdef IROOT
 > ++DESTDIR		= $(DESTDIR)
 > ++endif

What does this do?

 > +++ b/package/at/at.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -AT_VERSION = 3.2.2
 > +AT_VERSION = 3.2.4
 >  AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 >  AT_SITE = http://software.calhariz.com/at
 >  AT_AUTORECONF = YES

Is autoreconf still needed?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
