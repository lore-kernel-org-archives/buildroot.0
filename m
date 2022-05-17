Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D085FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785DB41A1D;
	Tue, 17 May 2022 19:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00kR0SWoxv6k; Tue, 17 May 2022 19:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABF14188E;
	Tue, 17 May 2022 19:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6591BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEEF4188E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkEQWLJPuCnT for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:53:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FD194188C
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:53:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79CFCC0006;
 Tue, 17 May 2022 19:53:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nr3Ff-005N2W-1L; Tue, 17 May 2022 21:53:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
 <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
 <CADvTj4qtBNwvZw66NPhoKRLsKkJQjqFb9tMo_4qyi-B+GThDxg@mail.gmail.com>
 <87r14s40wu.fsf@dell.be.48ers.dk>
 <CADvTj4ohuiV+Ks3inWUiv9c-W+JT1obTHkUAEp4om6BQ2P4dUA@mail.gmail.com>
Date: Tue, 17 May 2022 21:53:03 +0200
In-Reply-To: <CADvTj4ohuiV+Ks3inWUiv9c-W+JT1obTHkUAEp4om6BQ2P4dUA@mail.gmail.com>
 (James Hilliard's message of "Tue, 17 May 2022 13:40:12 -0600")
Message-ID: <87mtfg3pi8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 5/5] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

Hi,

>> > I think patch 4 was needed for fixing some linker issues with pkg-config
 >> > resolved dependencies like icu.
 >> 
 >> That unfortunately seems unrelated, because the build fails with the
 >> same error here after applying patch 4 :/
 >> 
 >> From the command line passing -m32 to HOSTCC, it sounds like some cross
 >> compilation confusion to me.

 > Yeah, I recall there were a bunch of issues related to cross compile confusion,
 > guess I had missed this one, although I was mostly testing against aarch64.

Yes, so there might still be some patches neeed.

With that said, it is still better than the current situation which is
completely broken, so the best way to make progress is most likely to
apply it.

So I'll do that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
