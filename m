Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 08:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049B7418D5;
	Thu, 10 Mar 2022 08:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2w-PDpBQyaoP; Thu, 10 Mar 2022 08:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1180418CC;
	Thu, 10 Mar 2022 08:51:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D75721BF38D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE57D418CC
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8mTuiKz2QaQ for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 08:51:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A349418C6
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 08:51:51 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 282676000D;
 Thu, 10 Mar 2022 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646902308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcVsji07H7eC/AYUFu3Ympcdb8ok/024n8RR6Gve+Wc=;
 b=V1xgIYKxwgiC3FIGdLSr6Ct+q6HL1uvul7PhIqVnhdk1Iv9aXXEm0NAkCz8JXtCcAcy2sV
 5cmNCqXjQ2BWaWB3Dbd2e+ju9EhI6yPytPhCXdj70i1LR/d4XRDQ/mRvAaOmBf2xCBXyad
 mCpTC31q7Mcw1cJcJM0A88To71rB4gFtNlSesWaMOBrJMXIR26gkSSORcwxU9GDGRDxTys
 3HmxO2sAtZsOQ92UzZQ89oMDYvTvJsZ2AyoUIuXsNBPVjuB2kszEQzyzjoNQL0QC7NlwRx
 hTjL88oXFBr+LCPIzgHsMKkh56tx9arFlkwtGHhNra0s2uEWPj8ynyBlYgj+og==
Date: Thu, 10 Mar 2022 09:51:46 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Yim8Im1WiRShHIxH@kb-xps>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
 <20220225113400.802049-5-kamel.bouhara@bootlin.com>
 <20220226113538.6def80d0@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220226113538.6def80d0@windsurf>
Subject: Re: [Buildroot] [PATCH 4/4] package/libodb-boost: add host variant
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Feb 26, 2022 at 11:35:38AM +0100, Thomas Petazzoni wrote:
> On Fri, 25 Feb 2022 12:34:00 +0100
> Kamel Bouhara via buildroot <buildroot@buildroot.org> wrote:
>
> > Add host variant of libodb-boost required by host-odb package.
>
> This is a bit short, and I think just like PATCH 3/4, it needs a more
> extensive explanation that the ODB compiler needs the libodb-boost
> headers at compile time, and therefore installed in $(HOST_DIR).
>

Ack.

> > diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> > index bac5f1e78f..7f2ad1fe72 100644
> > --- a/package/libodb-boost/libodb-boost.mk
> > +++ b/package/libodb-boost/libodb-boost.mk
> > @@ -11,7 +11,10 @@ LIBODB_BOOST_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_BOOST_VE
> >  LIBODB_BOOST_INSTALL_STAGING = YES
> >  LIBODB_BOOST_LICENSE = GPL-2.0
> >  LIBODB_BOOST_LICENSE_FILES = LICENSE
> > -LIBODB_BOOST_DEPENDENCIES = boost libodb
> > +LIBODB_BOOST_DEPENDENCIES = boost libodb \
> > +			    host-boost \
> > +			    host-libodb
>
> This seems wrong. Why is libodb-boost depending on host-libodb-boost.
> At least, this makes the dependencies added in your PATCH 2/4 a bit
> irrelevant.
>

Actually, that is the host variant that is depending on it. Your
following comments are completely right.

Thanks !

> I guess what you need to do instead is:
>
> HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
>
> And rely on the logic in odb.mk to pull in host-libodb-boost when
> BR2_PACKAGE_LIBODB_BOOST=y.
>

> Could you fix your patch series, and send a new iteration?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
