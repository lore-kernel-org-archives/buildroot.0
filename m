Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9525C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 14:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8876A4056A;
	Tue, 28 Dec 2021 14:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9boDEmzTmwC9; Tue, 28 Dec 2021 14:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A894052C;
	Tue, 28 Dec 2021 14:24:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 615661BF46A
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C5714052C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 14:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IG0sgiM48NXO for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 14:24:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E334013A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 14:24:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AE796240006;
 Tue, 28 Dec 2021 14:24:12 +0000 (UTC)
Date: Tue, 28 Dec 2021 15:24:11 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228152411.5a0519e3@windsurf>
In-Reply-To: <20211228152059.78f64362@windsurf>
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
 <20211228152059.78f64362@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: Adrien =?UTF-8?B?R2FsbG91w6t0?= <adrien@gallouet.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Dec 2021 15:20:59 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I fail to understand why adding -g would cause that build failure.
> There is already -g0 in the command line, then -g, which enables
> debugging symbols, this shouldn't cause any build failure.
> 
> Perhaps the issue is more related to the addition of -flto=4, which
> enables link-time optimization?
> 
> But even then, I don't quite understand this ac_test_CFLAGS stuff. Do
> you understand why their configure.ac script is doing:
> 
> # Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
> if test "$ac_test_CFLAGS" != set ; then
>   bird_cflags_default=yes
> fi
> 
> in the first place?
> 
> Could you help me connect the dots here ?

Also, I thought we had already fixed this issue with
https://git.buildroot.org/buildroot/commit/package/bird?id=03c148c8dec4e8c3fa13fcde4a730b3ab97f3f10 ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
