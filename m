Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3A1C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 09:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DE2B40620;
	Fri, 23 Sep 2022 09:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE2B40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMTIYGorlZfu; Fri, 23 Sep 2022 09:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E5F4063C;
	Fri, 23 Sep 2022 09:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E5F4063C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E27A1BF2A2
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 09:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1014F83E16
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 09:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1014F83E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTgpLNCkoq2G for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 09:02:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C619B81336
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C619B81336
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 09:02:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 116C0100003;
 Fri, 23 Sep 2022 09:02:00 +0000 (UTC)
Date: Fri, 23 Sep 2022 11:01:59 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220923110159.558e373f@windsurf>
In-Reply-To: <20220923104005.30fed5a3@x230_1.trabucayre.com>
References: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
 <20220917175705.325903a1@windsurf>
 <20220923104005.30fed5a3@x230_1.trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663923725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9KGMR+eSYkXQzOXpkjRiVb2sZyRUdWWiT8Lqda9jVUc=;
 b=bUPsZkY1rZ/R/T1sMMatbiyUtK94nGIAGkfUH/RkNUwRYAOsOY9wjggaRNqT3RhOb0q5t4
 9uBfLQ3u4w1emi9EHoCGdqCRDhzi6YwQmLJMNS5nE+Kh2H90cOA104eMUH8++xPSA8L3+n
 nWRkSweUZwkwsCGSEJktTRQtp7UmBChSTjvuKjbBoLZZkVoDhtb/gXSOKYd3vnh6RLU/yQ
 orJ3/Q3+l0+myM+sieFivJntzAo2zKmuD83ONvj2J2Md4Ca0uAzVKL8fNa9gwB9q77UJ1i
 fnIYASagz2jjyXpMngd6lVp7oxq1QDpBrUNACZQ783+9xiJ9pR32gWwPH+Rtvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bUPsZkY1
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: bump version to
 3.10.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 23 Sep 2022 10:40:05 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> > > +	select BR2_PACKAGE_PYTHON_NUMPY    
> > 
> > Why are you removing the "# runtime" comment here? Your patch doesn't
> > change numpy to a build time dependency.
> >   
> Your review of v1 has highliteted the fact numpy is required at runtime (of
> course) but also at the buildtime (cmake checks for dependencies and stop when
> a requirement isn't satisfied). This why I have removed this comment.

But how come target numpy is needed at *build* time ? Isn't this just a
silly check that makes sense in native build situation, but not in
cross-compilation situation ?

> > >  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> > > -GNURADIO_DEPENDENCIES += python3
> > > +GNURADIO_DEPENDENCIES += python3 python-pybind \
> > > +	host-python-numpy host-python-packaging    
> > 
> > Could you clarify if you need python-pybind on the target or on the
> > host? And also explain in the commit log why host-python-numpy and
> > host-python-packaging are now needed?  
> True. I will do that. And bump to the 3.10.4.0 version at the same time.

Thanks! Make sure to be very clear on the explanations of which
dependency is needed on the host vs. on the target, and which is needed
at build time vs. run time.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
