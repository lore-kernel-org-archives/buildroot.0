Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8023BFA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D35760B99;
	Tue,  1 Nov 2022 08:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D35760B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8Jv03q2Thkp; Tue,  1 Nov 2022 08:32:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB3560B1A;
	Tue,  1 Nov 2022 08:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB3560B1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A90B1BF30E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 08:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F40D381375
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 08:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40D381375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSFSM9rJWPSl for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 08:32:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741D28136D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 741D28136D
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 08:32:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:50d3:260a:b461:e6c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2A84519F5A7;
 Tue,  1 Nov 2022 09:32:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Nov 2022 09:32:06 +0100
Date: Tue, 1 Nov 2022 09:32:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221101083206.GI2992523@scaer>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf> <20221031125405.GC1058960@scaer>
 <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667291531;
 bh=RIPm52GlitIy1lgXSM7dXcM0uIdC03Av2XjIGDHAy/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ryCDYhv07cdxr9XotqEj8I7+Ww1NbvTLPIUQ/jbrAoixUmkcRCigcHAQJaTlXOI/9
 dDQ6PWB2QcwvlMMKNfcat+JzRV9nlBmwdYxvf3wqPKbWaKNbJvxhk8ouEK+Ta37e7t
 1o5blGivjnGYIZOBz41WGI+3xdJaKcJ1KXA30CGFDIwDie++Kfx1Uzx/haYqUpEZqm
 ekOOW+rw9zcXs8pfYhbpG+/45v9qoL0E5bb9bzRdCjcq3VB4XrDSx4tUHI5EN1si9s
 MVoAIKp1d/9Rnm+zXLHLLxtHRXIzdbqNsCGgQdblNE2oxaMvKZIzCUyHik7d9G4t7u
 0RL0gqI/1nzMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ryCDYhv0
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-11-01 03:27 +0100, Giulio Benetti spake thusly:
> On 31/10/22 13:54, Yann E. MORIN wrote:
> >On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake thusly:
> >>On Wed, 19 Oct 2022 01:46:17 +0200
> >>Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >>>At the moment all APIs folders are copied to target increasing the size of
> >>>rootfs of ~190MB. Allow to select which API folders we want to copy to
> >>>target to shrink rootfs down.
> >>>
> >>>Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >>Practically speaking, could you describe which folders are needed in a
> >>typical scenario you've had?
> >Yes, can you provide a rationale for when only a subset of APIs is
> >needed?
> I've answered on previous e-mail. I've realized only now that I could
> answer to your e-mail for both.

Hey, what you answered Thomas is not a rationale, it is an example. ;-)
A rationale is "an explanation of controlling principles of opinion,
belief, practice, or phenomena", or "an underlying reason". [0]

As a rationale, I would have expected something that explains the reason
why there are so many directories, and so why, under some circumstances,
we can get rid of them (or not). It needs not be too long, but just
provide an overview. For example, here is a totally made up blurb:

    mono provides support for a lot of legacy APIs for backward
    compatibility for existing applications, way back from the first
    stable API, 2.0 and up to the current version. The set of APIs are
    split in two categories: version-based APIs, and the rest (gac, the
    FooBar set of common Baz; monodoc, which renders documentation while
    riding a unicycle...).

    For a custom application, the set of required versioned APIs is
    limited; most often only the latest or the very few latest are
    needed. Only gac is always required, and monodoc is never used on
    the target as we never render the documentation there.

[0] https://www.merriam-webster.com/dictionary/rationale

[--SNIP--]
> >>Should we instead have a single string option
> >>BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
> >>empty, it means all folders are installed. Otherwise, only the
> >>specified folders are installed.
> >Agreed. I expect that having no API level installed would yield a
> >non-working system, so:
> >     config BR2_PACKAGE_MONO_API_VERSIONS
> >         string "API versions to install"
> >         help
> >           Keep empty to install all.
> Ok, I go with that then!

ACK.

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
