Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8924C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5886460B08;
	Wed,  2 Nov 2022 22:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5886460B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZymxWxfhUHl6; Wed,  2 Nov 2022 22:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 878B460AC0;
	Wed,  2 Nov 2022 22:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878B460AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC411BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4428281758
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4428281758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQNPPDYWW1Sx for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDAF8174D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEDAF8174D
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:00:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac44:26e4:6f4e:920d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 90F67200385;
 Wed,  2 Nov 2022 23:00:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Nov 2022 23:00:54 +0100
Date: Wed, 2 Nov 2022 23:00:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221102220054.GC3918838@scaer>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
 <20221101234024.27b5bc48@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101234024.27b5bc48@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667426457;
 bh=DnMwdtjoUy5XflhM/ID/lD5l+MyxX0RLi7WfhL1XOC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nkwCA4KxXlgSrnTBJMHnCQFu1o/ageSeZQpRWEaD0Gu4RwiTM/BK+l5CXFRasBIXl
 HNOCPWsYs9UL8pnPl0gmbYb+gDAS34U1/1Oi0o5icM9nX1hmKMVmipFs5upCgpnJjF
 l7Us39s+3vgUNJpbRHyNEpvTgnXyvo8aaY8lN1Pc3cFnEaK12hSqPzUlpfSdh3a5b6
 PuBl+Tqz/WSPgBdA8QYUTYn8jwp9wCjtlweuF3Nwn/BrhxpQaThCzta0bbcWXL2DLX
 avASvQksgs3F36qWQ4e3KgedNP6G6rCujeg2tZuZ1DIHbZJKHUXbFvi+rgC7yKPp1p
 6PY+wRVkSZqTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nkwCA4Kx
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: add patch to silence
 build errors
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-01 23:40 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Fri,  7 Oct 2022 18:50:01 -0500
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > As part of pkg-kconfig, the .config file gets regenerated after fixups.
> > 
> > When Busybox is built with per-package directories enabled, the
> > toolchain is not available for Busybox's makefile to determine compiler
> > capabilities so certain calls will fail and emit errors.
> > 
> > For now, assume the following are true:
> > 
> > Buildroot will not use GCC < 4
> >   Skip a call to cc-ifversion to avoid the following error
> > 
> >   /buildroot/output/build/busybox-1.35.0/scripts/gcc-version.sh: line 11: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: No such file or directory
> > 
> > Target system is linux
> >   Skip a call to -dumpmachine to avoid the following error
> > 
> >   make[2]: /buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: Command not found
> > 
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> 
> Hm, it's a bit annoying to patch Busybox for this, especially with a
> patch that most likely cannot be accepted upstream because it's really
> related to Buildroot details.
> 
> Do we have a better solution?

Yes: we should be relatively confident that we can convince busybox that
they wil never be built against a gcc < 4 nowadays, no?

scripts/gcc-version.sh is used to get the gcc version. This is in turn
used to test whether gcc >= 4.00, in which case -Wold-style-definition
is added to CFLAGS.

That is is only one case where this is needed. gcc 4.0.0 was release in
2005-04-20, 17+ years ago now. This is probably the oldest gcc version
one may reasnably expect to compile current code aganst. nowadays...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
