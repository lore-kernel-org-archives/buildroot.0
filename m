Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB823ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE0E40541;
	Fri, 23 Sep 2022 08:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE0E40541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpMeieOkqEKa; Fri, 23 Sep 2022 08:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF0740443;
	Fri, 23 Sep 2022 08:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF0740443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 866091BF2A2
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 08:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F3E940443
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 08:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3E940443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVAV2hg9_wtK for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 08:39:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FED400FB
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40FED400FB
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 08:39:39 +0000 (UTC)
Received: from x230_1.trabucayre.com ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 28N8davk021721
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 10:39:37 +0200
Date: Fri, 23 Sep 2022 10:40:05 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220923104005.30fed5a3@x230_1.trabucayre.com>
In-Reply-To: <20220917175705.325903a1@windsurf>
References: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
 <20220917175705.325903a1@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
On Sat, 17 Sep 2022 17:57:05 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 16 Sep 2022 15:04:23 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> > index 103175946c..fd693c1851 100644
> > --- a/package/gnuradio/Config.in
> > +++ b/package/gnuradio/Config.in
> > @@ -15,19 +15,19 @@ config BR2_PACKAGE_GNURADIO
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >  	depends on BR2_USE_MMU # use fork()
> >  	depends on BR2_USE_WCHAR # boost
> > -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS #
> > boost-atomic, boost-filesystem
> > +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS #
> > boost-atomic, boost-thread depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
> >  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
> >  	select BR2_PACKAGE_BOOST
> >  	select BR2_PACKAGE_BOOST_ATOMIC
> >  	select BR2_PACKAGE_BOOST_DATE_TIME
> > -	select BR2_PACKAGE_BOOST_FILESYSTEM
> >  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> >  	select BR2_PACKAGE_BOOST_REGEX
> >  	select BR2_PACKAGE_BOOST_SYSTEM
> >  	select BR2_PACKAGE_BOOST_THREAD
> >  	select BR2_PACKAGE_LOG4CPP
> >  	select BR2_PACKAGE_GMP
> > +	select BR2_PACKAGE_SPDLOG
> >  	select BR2_PACKAGE_VOLK
> >  	help
> >  	  GNU Radio is a free & open-source software development
> > @@ -80,7 +80,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
> >  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> >  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL #
> > python-numpy select BR2_PACKAGE_BOOST_PYTHON
> > -	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> > +	select BR2_PACKAGE_PYTHON_NUMPY  
> 
> Why are you removing the "# runtime" comment here? Your patch doesn't
> change numpy to a build time dependency.
> 
Your review of v1 has highliteted the fact numpy is required at runtime (of
course) but also at the buildtime (cmake checks for dependencies and stop when
a requirement isn't satisfied). This why I have removed this comment.
> > +	select BR2_PACKAGE_PYTHON_PYBIND  
> 
> The target pybind is a build time dependency?
It's the same principle as numpy: pybind is required in both case.
> 
> > -# host-python-mako and host-python-six are needed for volk to compile
> >  GNURADIO_DEPENDENCIES = \
> >  	host-python3 \
> > -	host-python-mako \
> > -	host-python-six \
> > -	host-swig \
> >  	boost \
> >  	log4cpp \
> >  	gmp \
> > +	spdlog \
> >  	volk
> >  
> >  GNURADIO_CONF_OPTS = \
> > @@ -115,7 +112,8 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> > -GNURADIO_DEPENDENCIES += python3
> > +GNURADIO_DEPENDENCIES += python3 python-pybind \
> > +	host-python-numpy host-python-packaging  
> 
> Could you clarify if you need python-pybind on the target or on the
> host? And also explain in the commit log why host-python-numpy and
> host-python-packaging are now needed?
True. I will do that. And bump to the 3.10.4.0 version at the same time.
> 
> Thanks!
> 
> Thomas

Thanks
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
