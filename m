Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B97C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F49561292;
	Tue,  6 Feb 2024 16:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F49561292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcbzgLzEbpYx; Tue,  6 Feb 2024 16:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E488611C5;
	Tue,  6 Feb 2024 16:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E488611C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE9151BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DCE408BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2DCE408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrDsFAY7NVZf for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:30:42 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6826F400E7
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6826F400E7
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6F4E213FA35;
 Tue,  6 Feb 2024 17:30:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 17:30:37 +0100
Date: Tue, 6 Feb 2024 17:30:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <ZcJerQV0cR4EccKi@landeda>
References: <20240206144030.18329-1-ismael@iodev.co.uk>
 <ZcJLd7drFQn9tz6I@landeda> <ZcJOjrDfe79fPfpz@pirotess>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcJOjrDfe79fPfpz@pirotess>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707237039;
 bh=1TQMbliXekNNU47pGI7LXwnyqx7DRthor7pd/XKIm8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4AhCaAfTJftq4xakyfNSdMjsdmK3ftRfrQm26zCVr/WWud0wvnVOLaOFk45ha3w2
 acaUR5dSya56iszIkWW3SA9TrqKqi+n2AekW+xxkTMQtv2xIU0BLIJMhp/dqkPlTzS
 M7Jo+QlI7p6FxxPzbCpGgyWDFjshvxAcDjNuClOBj4qV79Kl2kbYVo+qyEc1PNBMhP
 1jGrsHBVxZ0cVIzBmxnHh1LcwfWpridk02ZlbAku3k854u7hSF6XpGOzaHCt7Tyi5M
 ONtKUhy6aGEP/EjBgiOHuxj11tDVKEDthSmSiDPgUkXZ7weQ7zKRurP0osJ+1tEBNQ
 x0VUpYGZ2QFvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f4AhCaAf
Subject: Re: [Buildroot] [RFC PATCH] docs/website: Add Makefile to
 pre-generate the website
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

Ismael, All,

On 2024-02-06 16:21 +0100, Ismael Luceno spake thusly:
> On 06/Feb/2024 16:08, Yann E. MORIN wrote:
[--SNIP--]
> > > +SRCDIR := ${CURDIR}
> > Use parentheses not curly braces, to expand variables in Makefiles,
> > like we do everyelse in Buildroot: $(..)
> > 
> > (yes, both are valid, but lets be consistent throughout our code base)
> OK, I'll change it for v3. I mentioned this before, according to
> both GNU and BSD this is legacy syntax, and new stuff should use
> curly braces...

There is no such deprecation in POSIX:
    https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html

> > What is the rationale for using smu and tidy to do the deployement?
> > We don't need/want to minimify the content...
> smu is for having some markup support, not used for .html files; as
> for tidy, it just normalises the html indentation, no minification is
> going on.

As we discussed IRL, there is no reason to run smu, as we have no markup
currently; if we want to add markup in the future, then will be the
moment to add the processing, not now. Ditto, cleanup the files with
tidy, if that is even needed, should be done as a linter step to fixup
the files in the tree, not at deployment time.

> > [0] In case of error, we do want to exit in error and be sure this is
> > caught at the Makefile level; by using gawk, you can call:
> >     exit 42
> That also works with any other AWK.

Ah, right:
    https://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html

There is however no requirement on any awk implementation for Buildroot,
then just default to: AWK=awk

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
