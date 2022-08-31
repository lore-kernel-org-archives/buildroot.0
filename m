Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42142ECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 08:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F438277E;
	Wed, 31 Aug 2022 08:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81F438277E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYFKOdvgVSbP; Wed, 31 Aug 2022 08:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6033823DD;
	Wed, 31 Aug 2022 08:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6033823DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 784301BF909
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1CE61016
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 08:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1CE61016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9YO7X8ICo1P for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 08:56:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44AB260B78
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44AB260B78
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 08:56:20 +0000 (UTC)
Received: from x230_1.trabucayre.com ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 27V8uHGU006231
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 10:56:17 +0200
Date: Wed, 31 Aug 2022 10:56:46 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220831105646.7a17421f@x230_1.trabucayre.com>
In-Reply-To: <20220815125815.2a11d116@windsurf>
References: <20220808080910.14164-1-gwenj@trabucayre.com>
 <20220815125815.2a11d116@windsurf>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH] package/gnuradio: bump version to 3.10.3.0
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
On Mon, 15 Aug 2022 12:58:15 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Mon,  8 Aug 2022 10:09:10 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > - remove all no more required patches
> > - add dependency to SPDLOG
> > - add pybind dependency where python is set
> > 
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> >  
> 
> Thanks for this version bump. A few questions below.
> 
> >  	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> > +	select BR2_PACKAGE_PYTHON_PYBIND # runtime  
> 
> So here you're saying that python-numpy and python-pybind are runtime
> dependencies.
> 
> >  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> > -GNURADIO_DEPENDENCIES += python3
> > +GNURADIO_DEPENDENCIES += python3 python-numpy python-pybind \  
> 
> But you have them as build-time dependencies here. Could you check this?
gnuradio build check for both libraries at build time and fails when not found.
But maybe I have to remove #runtime since they are required at runtime AND
build time.
> 
> > +	host-python-mako host-python-numpy host-python-packaging  
> 
> Are these host-python-* really needed? Why would gnuradio needs numpy
> at build time? Or are they just here to satisfy some broken build
> system that verifies NumPy is installed on the build machine, even
> though really they are needed only on the target?
host-python-mako must be removed: I wasn't noticed this library is now only
required in a specific case not covered by buildroot. numpy and pybind are
required to have cmake happy.
> 
Thanks

Gwenhael

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
