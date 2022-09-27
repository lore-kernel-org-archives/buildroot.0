Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62236C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 08:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCE661038;
	Tue, 27 Sep 2022 08:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCE661038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMZKG5NIZYuZ; Tue, 27 Sep 2022 08:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A3C6102F;
	Tue, 27 Sep 2022 08:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A3C6102F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 976481BF2EA
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7308640567
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 08:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7308640567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZ426bPSQ718 for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 08:52:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21ADB400AF
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21ADB400AF
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 08:52:05 +0000 (UTC)
Received: from x230_1.trabucayre.com ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 28R8q2nH029931
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 10:52:03 +0200
Date: Tue, 27 Sep 2022 10:52:31 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220927105231.67f88168@x230_1.trabucayre.com>
In-Reply-To: <20220923235149.5b312376@windsurf>
References: <1663937486-98556-1-git-send-email-gwenj@trabucayre.com>
 <20220923235149.5b312376@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: bump version to
 3.10.4.0
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

Hello
On Fri, 23 Sep 2022 23:51:49 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 23 Sep 2022 14:51:26 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > Note:
> > Since gnuradio 3.10 swig was replaced by pybind. Now python libraries
> > and python wrappers are produces using pybind: this why pybind is a
> > buildtime and runtime dependency. numpy also become a buildtime dependency
> > since some cpp bindings uses numpy's functions directly: this library
> > is now required in both situation.  
> 
> I am sorry, but this is still not clear. In this text, nowhere you are
> talking about "host" or "targ!)et" packages.
> 
> > -	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> > +	select BR2_PACKAGE_PYTHON_NUMPY  
> 
> This change is incorrect: target numpy is still only a runtime
> dependency. Your change to gnuradio.mk adds host-python-numpy as a
> build-time dependency, but not python-numpy.
Yes! True: I have to revert that (and add a new coffee machine with
stronger coffee!)
> 
> Remember:
> 
>  - Target packages are named "foo" and have a corresponding Config.in
>    symbol called BR2_PACKAGE_FOO
> 
>  - Host packages are named "host-foo" and generally do not have a
>    corresponding Config.in symbol.
> 
> Therefore:
> 
>  - A host build-time dependency is added by doing <pkg>_DEPENDENCIES =
>    host-foo
> 
>  - Target build-time dependency is added by doing <pkg>_DEPENDENCIES =
>    foo *AND* selecting BR2_PACKAGE_FOO
> 
>  - Target run-time dependency is added by selecting BR2_PACKAGE_FOO
> 
> My understanding regarding numpy is that it is a:
> 
>  - Target run-time dependency
>  - Host build-time dependency
> 
> >  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> > -GNURADIO_DEPENDENCIES += python3
> > +GNURADIO_DEPENDENCIES += python3 python-pybind \  
> 
> This python-pybind looks weird. Why would the *target* package be
> needed at build-time? Are you sure it's not host-python-pybind that is
> needed? I don't see how python-pybind can be used at build time, since
> it's a target package.
In fact pybind is not clear at all to me. After re-reading current pybind's .mk
nothing is installed on target, only on stagging (it's look like an host
package without being it...). Gnuradio at build time uses headers and cmake's
scripts provided by pybind to build bindings. Since nothing is installed to the
target the Config.in select must be dropped (I'm wrong) and .mk dependency must
be keep. No?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Thanks
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
