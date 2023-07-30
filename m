Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760C9C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F38B360AFC;
	Sun, 30 Jul 2023 20:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F38B360AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EideQfND-5T; Sun, 30 Jul 2023 20:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F61161020;
	Sun, 30 Jul 2023 20:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F61161020
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA5591BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 935F440359
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 935F440359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiaK2wMGkKVC for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:58:17 +0000 (UTC)
X-Greylist: delayed 34264 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 30 Jul 2023 20:58:17 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 170BF401CA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 170BF401CA
 for <buildroot@uclibc.org>; Sun, 30 Jul 2023 20:58:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F2CBC0002;
 Sun, 30 Jul 2023 20:58:14 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:58:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730225814.108f5fcf@windsurf>
In-Reply-To: <pan$23df6$8f2c97e9$80972a17$d2124f06@ID-313208.user.individual.net>
References: <20230730054316.D9D0E400FE__49774.3708708853$1690695823$gmane$org@smtp2.osuosl.org>
 <pan$23df6$8f2c97e9$80972a17$d2124f06@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690750695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7dJ6w3kw7GUWtfJJK4jMDoBcoOQxgs73zOJBZPODY8=;
 b=bXail7zcDt0rE5bKytYbsJVaNhZel4eu0MeT1rAF5SYY3abxKaWTJnNdDR3zad496YcNbK
 0IRWIfjHzyGT5rD/QDRIr9Od4jhZ0j95M3vxhel/AU0FpWwEPKWdHC0tTuk6WmYJV1jheR
 4S+b3pEoYLYzMYdSXfzz5Ny1jyl7C1vPz6VrHTAqeth9M+bwthkKCbIk+t4aYoIj62JBZ2
 Skm1nfXmGSIublMvuxa46iBYGgrNXE1xaJK9giwAbS07fEvjsriwiOlGUW+R1aCRynCNmx
 jfphU8vb5owdx60ApNkL7smtCWXlgtpcdc96v7h5h6nfCYMfHNiA0NSZFG0EAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bXail7zc
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-07-29
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 22:25:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Am Sun, 30 Jul 2023 05:43:11 -0000 schrieb Thomas Petazzoni via buildroot:
> 
> >    http://autobuild.buildroot.net/results/  
> d377efffbe2112f7bdf73bbee55e655ce1e03d44
> >    | s390x     |       host-ccache-4.8.2        | NOK |
> >    http://autobuild.buildroot.net/results/  
> a49c1eac4ba5ec6de71bd2dcbd201183cd28aa8d
> >    | ORPH
> >     or1k     |       host-ccache-4.8.2        | NOK |
> >     http://autobuild.buildroot.net/results/  
> d84de4df9e4186ee2ac6c0903fd44a53e7916fb3
> >     | ORPH  
> 
> these build errors are caused by an ICE in host gcc, in our case 
> gcc-12.3.1 on br-autobuild-1:
> 
> According to https://bugs.gentoo.org/906310#c3 the error was fixed 
> upstream: https://gcc.gnu.org/git/gitweb.cgi?
> p=gcc.git;h=396a4e76afec30d2461638f569cae18955eb4ad2
> 
> Is it possible to update the toolchain on br-autobuild-1?

br-autobuild-1 is currently using Fedora 37, and we are up-to-date with
Fedora 37. It has the following version of gcc:

gcc version 12.3.1 20230508 (Red Hat 12.3.1-1) (GCC) 

Problem is that commit 396a4e76afec30d2461638f569cae18955eb4ad2 is part
the 12.3.0 tag, and there is no gcc release that contains this commit,
which is probably why Fedora didn't pick it up.

GCC bug is at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109241.
Apparently, it will be fixed in GCC 12.4.0. No idea when 12.4.0 is
planned though :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
