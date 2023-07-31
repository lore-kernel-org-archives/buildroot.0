Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46DC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20C1D40514;
	Mon, 31 Jul 2023 22:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C1D40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tv8IyRosJ_Rs; Mon, 31 Jul 2023 22:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BB8E40C13;
	Mon, 31 Jul 2023 22:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB8E40C13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6C31BF97D
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE41812FE
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE41812FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dB8_a80Yxb-Y for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:41:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D4E78137E
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4E78137E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79129C0002;
 Mon, 31 Jul 2023 22:41:06 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:41:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230801004105.1c21526b@windsurf>
In-Reply-To: <20230718114608.60593e6d@windsurf>
References: <20230716170126.438652-1-bernd@kuhls.net>
 <20230718114608.60593e6d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690843266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSDGMDeH3WlMZMYgr9d5OsrTP2WAI59BI9EKxyl+45c=;
 b=hRG8+2WueUjNRvbc6zACSej7yrV0vFLBe9U1YylsrQgDVC3VhZR2wfV/RRHgBCsZIimwXn
 qwjpYqAYQwWRutvi4V30RqwPqBM0SoqGSs/AR38HsT7z9u+oewPKngMO22y6/pid9Txmtc
 thRKyRbVhDUizquwrs3CM9WBQJsROImnrmOwoG8tODx5NTyNkiCByjmGgu7l36MCS2g3CI
 oxxwx+k0M+pWzyI4Lqpw2hLqTTUY8TUenEG+xSKxDE5fmBXWD90vmXwLHEAnlTpRktynzq
 W6ktXgiebutMCYrBDm08D+k74ERpdIvgfWKaOBaAMKGBo9jIbZdwBsLZTaURmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hRG8+2Wu
Subject: Re: [Buildroot] [PATCH 1/2] package/xscreensaver: fix build
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

Do you think you could follow-up on the below comments? It would help
getting the patch merged.

Thanks!

Thomas

On Tue, 18 Jul 2023 11:46:08 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Bernd,
> 
> On Sun, 16 Jul 2023 19:01:25 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > diff --git a/.checkpackageignore b/.checkpackageignore
> > index 504b96951b..fa557733e8 100644
> > --- a/.checkpackageignore
> > +++ b/.checkpackageignore
> > @@ -1638,6 +1638,8 @@ package/xinetd/0004-configure-rlim_t.patch Upstream
> >  package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch Upstream
> >  package/xl2tp/xl2tpd TrailingSpace
> >  package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
> > +package/xscreensaver/0001-disable-check-for-pam.patch
> > +package/xscreensaver/0002-build-Do-not-build-po-files.patch  
> 
> Is this valid syntax? You're saying to ignore some warnings, but not
> which ones.
> 
> Also, for new patches, adding them in the checkpackageignore file is
> quite odd. We definitely want those new patches to have an "Upstream:"
> tag.
> 
> >  package/xxhash/0001-fix-man-page-installation.patch Upstream
> >  package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
> >  package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
> > diff --git a/package/xscreensaver/0001-disable-check-for-pam.patch b/package/xscreensaver/0001-disable-check-for-pam.patch
> > new file mode 100644
> > index 0000000000..6d052a53e9
> > --- /dev/null
> > +++ b/package/xscreensaver/0001-disable-check-for-pam.patch
> > @@ -0,0 +1,16 @@
> > +Fix cross-build
> > +
> > +Detecting features of the host does not make sense when cross-compiling.
> > +
> > +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>  
> 
> Meh, no Git repository of the project to have a nice Git formatted patch? :-/
> 
> > diff --git a/package/xscreensaver/0002-build-Do-not-build-po-files.patch b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
> > new file mode 100644
> > index 0000000000..03674f5d50
> > --- /dev/null
> > +++ b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
> > @@ -0,0 +1,58 @@
> > +From 6b5d022f6dd9848a2d5ca08a1968929b8c140981 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 16 Jul 2022 09:59:40 -0700
> > +Subject: [PATCH 2/2] build: Do not build po files  
> 
> No patch numbering, this raises a check-package warning.
> 
> I see Khem has been able to generate a git formatted patch, I wonder
> against which Git repository?
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
