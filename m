Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438D0C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E50EA41597;
	Tue,  6 Feb 2024 15:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50EA41597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOF1PBNw1u-r; Tue,  6 Feb 2024 15:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E676D415BD;
	Tue,  6 Feb 2024 15:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E676D415BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A407B1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DA3F6128F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA3F6128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vc6CAnf3ThpB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:54 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B196128C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B196128C
Received: from pirotess (unknown [85.119.216.19])
 by iodev.co.uk (Postfix) with ESMTPSA id 7A78C2909A7;
 Tue,  6 Feb 2024 16:21:51 +0100 (CET)
Date: Tue, 6 Feb 2024 16:21:50 +0100
From: Ismael Luceno <ismael@iodev.co.uk>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZcJOjrDfe79fPfpz@pirotess>
References: <20240206144030.18329-1-ismael@iodev.co.uk>
 <ZcJLd7drFQn9tz6I@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcJLd7drFQn9tz6I@landeda>
X-Spam: Yes
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

On 06/Feb/2024 16:08, Yann E. MORIN wrote:
<...>
> Make that gawk, so that we can do [0] (see below)

Mawk might be more complete than you think ;-).

> > +SRCDIR := ${CURDIR}
> 
> Use parentheses not curly braces, to expand variables in Makefiles,
> like we do everyelse in Buildroot: $(..)
> 
> (yes, both are valid, but lets be consistent throughout our code base)

OK, I'll change it for v3. I mentioned this before, according to
both GNU and BSD this is legacy syntax, and new stuff should use
curly braces...

<...>
> What is the rationale for using smu and tidy to do the deployement?
> We don't need/want to minimify the content...

smu is for having some markup support, not used for .html files; as
for tidy, it just normalises the html indentation, no minification is
going on.

<...>
> [0] In case of error, we do want to exit in error and be sure this is
> caught at the Makefile level; by using gawk, you can call:
> 
>     exit 42

That also works with any other AWK.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
