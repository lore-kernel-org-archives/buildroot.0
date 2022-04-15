Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193BBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 10:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E5F84125;
	Fri, 15 Apr 2022 10:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCLV8pTi1WoQ; Fri, 15 Apr 2022 10:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9D184119;
	Fri, 15 Apr 2022 10:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120411BF33E
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 10:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F39A4419A0
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 10:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bbu6Pa6vDQtw for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 10:06:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397A74198E
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 10:06:33 +0000 (UTC)
Received: from pwmachine.localnet (238.red-83-59-6.dynamicip.rima-tde.net
 [83.59.6.238])
 by linux.microsoft.com (Postfix) with ESMTPSA id EA94720C353F;
 Fri, 15 Apr 2022 03:06:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EA94720C353F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650017192;
 bh=RVYxFeiQVq7H9oCuujAh3OtIQ1DLlpAbNOTtVODJfng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gq35y5BKjpHifckWKSRb6XK825h18gSxaVEQOiMJgtmVIzqCC56d1u3eTsaXKnwR0
 gsOyIvsUFOQsB7fC83AvcNzDlO6QK0hwa5buNsdyDi5x3B+Fb5Jy6sXmLdDsyPeHof
 fZTyie/DFmzoefRebsrYPF02I2TDqJ3MJkt0HzMo=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Apr 2022 11:06:28 +0100
Message-ID: <11959024.O9o76ZdvQC@pwmachine>
Organization: Microsoft
In-Reply-To: <b2544177-df85-95a4-9b28-699545c69e4a@mind.be>
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
 <7fa2e422-fbb5-6627-efb6-1eb7d599cae3@mind.be>
 <b2544177-df85-95a4-9b28-699545c69e4a@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/sysdig: bump to 0.29.1
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
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le jeudi 14 avril 2022, 20:05:06 BST Arnout Vandecappelle a =E9crit :
> On 14/04/2022 20:54, Arnout Vandecappelle wrote:
> > On 14/04/2022 19:43, Francis Laniel wrote:
> [snip]
> =

> >> +# sysdig needs falcosecurity-libs sources, so we set the souce direct=
ory
> >> here. +# It will sadly compile again falcosecurity-libs, so we also ne=
ed
> >> to set again +# grpc_cpp_plugin.
> >> +SYSDIG_CONF_OPTS +=3D
> >> -DFALCOSECURITY_LIBS_SOURCE_DIR=3D$(BUILD_DIR)/falcosecurity-libs-e5c5=
3d648
> >> f3c4694385bbe488e7d47eaa36c229a
> >> -DGRPC_CPP_PLUGIN=3D$(HOST_DIR)/bin/grpc_cpp_plugin \
> > =

> >  This is not nice (as you wrote in the cover letter). If there's really=
 no
> > way to tell sysdig to use the libs installed in STAGING_DIR, then the
> > solution is to remove falconsecurity-libs and instead download it as pa=
rt
> > of the sysdig package. There are (fortunately) not many examples of that
> > in Buildroot, but there's something a bit similar in android-tools.
> =

>   Just to be clear: the *preferred* solution is to patch
> cmake/modules/falcosecurity-libs.cmake so it supports a system-installed
> falcosecurity-libs. (And then send that patch upstream to sysdig, of
> course).

Thank for your reviews and sorry for some misake I made (I was not aware of =

make legal-info, I will take the habit to run it now).

I will try to find the best solution.
Another one I thought about was to set falcosecurity-libs as a generic-
package, so the .mk will just the source and the compilation can happen in =

sysdig.mk.
What it is your opinion about this proposal?

> =

>   Regards,
>   Arnout
> =

> > # Take this version from cmake/modules/falcosecurity-libs.cmake
> > SYSDIG_FALCOSECURITY_LIBS_VERSION =3D
> > e5c53d648f3c4694385bbe488e7d47eaa36c229a SYSDIG_EXTRA_DOWNLOADS =3D $(c=
all
> > github,falcosecurity,libs,$(SYSDIG_FALCOSECURITY_LIBS_VERSION))/falcose=
cur
> > ity-libs-$(SYSDIG_FALCOSECURITY_LIBS_VERSION).tar.gz define
> > SYSDIG_EXTRACT_FALCOSECURITY_LIBS
> >         $(call suitable-extractor,$(notdir $(SYSDIG_EXTRA_DOWNLOADS))) \
> >                 $(SYSDIG_DL_DIR)/$(notdir $(SYSDIG_EXTRA_DOWNLOADS)) | \
> >                 $(TAR) -C $(@D)/falcosecurity-libs --strip-components=
=3D1 \
> >             $(TAR_OPTIONS) -
> > endef
> > SYSDIG_POST_EXTRACT_HOOKS +=3D SYSDIG_EXTRACT_FALCOSECURITY_LIBS
> > =

> > (you'll need to adapt the above to make sure it's extracted in the right
> > place.)
> > =

> > =

> >  Since the driver etc. are then part of the sysdig package again, not as
> > much will change. Just some directory names.
> > =

> >  BTW, please also mention in the commit message that the issue with the
> > driver is fixed in recent falcosecurity/libs
> > =

> >  Regards,
> >  Arnout
> > =

> >> + -DVALIJSON_INCLUDE=3D$(BUILD_DIR)/valijson-0.6/include/valijson
> >>     SYSDIG_MODULE_SUBDIRS =3D driver
> >>   SYSDIG_MODULE_MAKE_OPTS =3D KERNELDIR=3D$(LINUX_DIR)
> >>   -$(eval $(kernel-module))
> >>   $(eval $(cmake-package))




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
