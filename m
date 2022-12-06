Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E241C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12492417B9;
	Tue,  6 Dec 2022 22:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12492417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCSzjvDFohll; Tue,  6 Dec 2022 22:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A84941777;
	Tue,  6 Dec 2022 22:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A84941777
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30641BF37E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC7160AE3
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC7160AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUTWt6bKw8uk for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:03:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EE060AD6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07EE060AD6
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:03:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB944FF806;
 Tue,  6 Dec 2022 22:03:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2g28-00FYka-EY; Tue, 06 Dec 2022 23:03:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20221028223844.1180418-1-james.hilliard1@gmail.com>
 <20221030083033.GC1058960@scaer> <20221117085339.4a4d5d8f@windsurf>
 <620448da-4dda-3d9d-cb39-5c8a278767d6@mind.be>
Date: Tue, 06 Dec 2022 23:03:24 +0100
In-Reply-To: <620448da-4dda-3d9d-cb39-5c8a278767d6@mind.be> (Arnout
 Vandecappelle's message of "Fri, 25 Nov 2022 15:06:21 +0100")
Message-ID: <874ju86vgz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 17/11/2022 08:53, Thomas Petazzoni via buildroot wrote:
 >> On Sun, 30 Oct 2022 09:30:33 +0100
 >> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
 >> 
 >>> Should this not be limitied to the intial compiler only? Otherwise, why
 >>> would we need it for the final compiler?
 >> I confirm limiting the work-around to gcc-initial works.
 >> However, I have reported the bug to gcc upstream, and they say the
 >> issue is in glibc:
 >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107728

 >  James previously already reported the problem to glibc:

 > https://sourceware.org/bugzilla/show_bug.cgi?id=29621

 >  I picked up the thread in both issues, I was able to narrow the
 >  problem down a little more, but in the end the conclusion seems to be
 > "We can't support that on the glibc side at present."

 >  So I applied this patch to master, after making two major changes:

 > - move it to host-gcc-initial only;
 > - instead of putting the full condition in the .mk file, make a
 >   Config.in symbol BR2_TOOLCHAIN_HAS_GCC_BUG_107728.

 >  ... And now I notice I forgot to put the changes I made in the commit
 >  message. But it's pushed already.

 >  Anyway, applied to master, thanks!

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
