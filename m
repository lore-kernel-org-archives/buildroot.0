Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF6CC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 16:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E665360A9B;
	Sun,  4 Dec 2022 16:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E665360A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLSFzrsvfKlh; Sun,  4 Dec 2022 16:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43290605C9;
	Sun,  4 Dec 2022 16:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43290605C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2DAA1BF3A1
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 16:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EBED80B6E
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 16:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EBED80B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0EeXhuATeyY for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 16:58:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635B880061
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 635B880061
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 16:58:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 388436000C;
 Sun,  4 Dec 2022 16:58:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p1sJs-00BxrE-Un; Sun, 04 Dec 2022 17:58:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
 <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
 <CA+fTLhgzznFVkSGXGhR5S_ik2K0RA_wRve1PF0FaogexfmH3tg@mail.gmail.com>
Date: Sun, 04 Dec 2022 17:58:24 +0100
In-Reply-To: <CA+fTLhgzznFVkSGXGhR5S_ik2K0RA_wRve1PF0FaogexfmH3tg@mail.gmail.com>
 (Indrek Kruusa's message of "Sun, 4 Dec 2022 17:05:19 +0200")
Message-ID: <874jub85sf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Indrek" == Indrek Kruusa <indrek.kruusa@gmail.com> writes:

Hi,

 >> Maybe needs to select:
 >> BR2_PACKAGE_PYTHON3_PYEXPAT
 >> 

 > Somehow I missed that option. Yes, it fixes the problem.

How did you end up with pip without python3-pyexpat?

python-pip selects python3-setuptools (and ssl), and python3-setuptools
selects pyexpat (and zlib).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
