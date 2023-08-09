Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BF1C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604DD418A1;
	Wed,  9 Aug 2023 22:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604DD418A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHnQWJKhL7NT; Wed,  9 Aug 2023 22:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E31F41897;
	Wed,  9 Aug 2023 22:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E31F41897
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6BD1BF82C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55539607C9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 22:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55539607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWQveVgG1z87 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 22:11:25 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F41C160AA0
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 22:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41C160AA0
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1ptQmn1vNj-00glYz; Thu, 10
 Aug 2023 00:11:22 +0200
Date: Thu, 10 Aug 2023 00:11:21 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230810001121.63610cd5@gmx.net>
In-Reply-To: <20230808200844.6db0eb89@windsurf>
References: <20230808172625.20598-1-ps.report@gmx.net>
 <20230808200844.6db0eb89@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:TM+M9+wW00JryXz7r4GsmFl2NxljeT8iwdZQlxsKC5SZwUuIzGm
 uGYYFg2zb75ttvoMhtdD6AozjqYh8UAAp1TYYkvGAn4qcaaUzDzSJpUsS4Hu/MSa8FXrtzR
 sxZ/bl+SX42LAlZTpp+0yqTV5kVTUzmd4rTuCtBjxQHqxPVAHdVuqwFoPPrAOHDXOC9fdjK
 iMszoLdY7dOEzsXvM/+lg==
UI-OutboundReport: notjunk:1;M01:P0:+2U4XAmjoEU=;kEdumiB01q6KYF0VsWzbrjB9QGm
 iMGI9R73qibjob0fbLDxYBcubow6p+EW6ZDZre+aLkafbe4C7Svs1+c0gAIfFCEBbVFATwoid
 yNmnPJb8BHRG2ZdBY6I3mvViqKb3EQ7TfK/s/sXk2iTck8iarN8WEbCpDo1Te4oZ/u8FRE1CU
 MpMLuicgjnHRepFF50fZdDPRecitFbVPqztrRcSVv5WggAGVmGwl43IyTMS2g2ElKOrY6+1ds
 TJ+Y+xKmGtuiSsr4d4c+BRH/Nul1gBP1V1a+5hstLdnqGBlmI+LBasSOgbUZgpM3tUhSvNVMa
 YXC122powamDyRTUFst2f8edo6uasmMk9A4Q943ooiG7IRvId6oniNDUV+hqmXdq9i7deMjFs
 +xaWw2U2WBzz9DoF9dTwP1/Bdl+iznZL3kUAVvMxDUcer9AMk1Tww7Bd2jClMtTk2hsg7dN2y
 ERCsKmAvEog8A/n8WPQqWy65orp1q6yeN8flH+Tgu1q7f/A01sPGkdZOK3Hj1OjH1ZMofT1pl
 rwL1RvmifxMoFo4chEiaDc61sv8TuYShgCpk9fVB/mzRwkGSOj49qjFbRy1drd/PMsdQcksg4
 QopuqVhl8+dZMAcB/mEYKOxe8cAjcTXCOerlFpW+s/km1ssev0brF3OJfCHx1qp37wlJWCINm
 LXuQp/RWGg/3SqSI9RPB9bHi3RbEWjAVNQ4TyG6ioBPWfMMX74ICAj/8RlFCotkzaO9GT4sbf
 tQt+z5Top9bFRGwoNRXnlifgC203B7jhbbuTsziv85dmM2bsSpL6jxm88720ObDKi3pJwHUTv
 SrPznA5nmbRZbykIHR6fFEOg+V9NqpHTBrahLFuM9MRh9Z09xHqsp4FMFAQGfEEsOmXUbTwHZ
 4UXro3fvzFL+UG3fifUNH34B4LKdvB/+bMKSMqW4nZlfBHsuch72fFTLeawGIR15wWjaLNRDW
 b3bG+s2xIWLXIbugLiFafXDNYno=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691619082; x=1692223882; i=ps.report@gmx.net;
 bh=1KrXzMAzjqS/Q5rnq1ISBqrhP6Cl3pxwNTU6eHxQ1lg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cV+1Zyr2kGYKfnUfT35bmvry0QOIKkLo2AV3DiPJyN7PKcForWPkU2kXFLS0eY/1KvuZos7
 LBgFmIK3+6/ebO/FrZGNvhR3NniY8OUSKoNMPtF3bWgrlvEbNmMpEJ/bsr4pMjqYTOZDTAtJW
 INa3wWGSvmKnooj+S88qrMYNMCp0pj2mMbR1xXoLSIMcLMJgGO+epkw2jncNYbFiaFGdgugk3
 ao06b4sgNCBHUAY3xgnwzCAZaIx8YNTWshyjbindohvfNhKRG6xWYLEbsGIS9biSvhoLS/yy8
 t0EQcFqQEqrC0iV9pVzEGiLDeMP0spz6n12LLj6IllodWvFMKxcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=cV+1Zyr2
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2a
 (fixes CVE-2023-4012)
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

Hello Thomas,

On Tue, 8 Aug 2023 20:08:44 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Tue,  8 Aug 2023 19:26:25 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Fixes CVE-2023-4012 (see [1] for details).
> >
> > [1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> For security bumps, we like the commit title to be:
>
> 	package/ntpsec: security bump to version 1.2.2a

O.k.

>
> and have the details of which CVE is addressed in the rest of the
> commit message.
>
> I fixed that up when applying to master. Thanks!

Thanks for fixing (and applying)!

Regards,
Peter


>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
