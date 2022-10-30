Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5383C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E892402B9;
	Sun, 30 Oct 2022 21:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E892402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCzlYw-jktUL; Sun, 30 Oct 2022 21:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0E140239;
	Sun, 30 Oct 2022 21:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF0E140239
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6212B1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D55781247
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D55781247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S68owINGGzvJ for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:37:25 +0000 (UTC)
X-Greylist: delayed 00:07:49 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3AC80FAB
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D3AC80FAB
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:37:25 +0000 (UTC)
Received: from pwmachine.localnet (85-170-25-210.rev.numericable.fr
 [85.170.25.210])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9FC7020B9F80;
 Sun, 30 Oct 2022 14:29:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FC7020B9F80
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Oct 2022 22:29:32 +0100
Message-ID: <5616514.DvuYhMxLoT@pwmachine>
In-Reply-To: <CAPi7W821BMm3-zrAUGV=xV4qf2OQYLRNp-t-9mhAaBX+7JwrhA@mail.gmail.com>
References: <20221029082510.61178-1-fontaine.fabrice@gmail.com>
 <20221030215759.0d848e58@windsurf>
 <CAPi7W821BMm3-zrAUGV=xV4qf2OQYLRNp-t-9mhAaBX+7JwrhA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1667165375;
 bh=WH0cg+N1dK1nv2j/sIkn0cT+smHKOuf0M5rvQMsYSm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T791z4wJ/ebyYVG42NQKHlkhNYtyoRJfiuMkGROTbTA6X9qF6c3bb/qbn73bRzf7Y
 C3gIdSpJuwqUCHBEI/ZLw71e5r3mEw8RGlGcoHlv4S46RcvGxjFaYA/GtYzbAeLyx7
 8kcz7ics2u7URekVSm6LxHWt3aRGIfITzRS/l3FE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=T791z4wJ
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: bump to version 1.24
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Le dimanche 30 octobre 2022, 22:17:55 CET Fabrice Fontaine a =E9crit :
> Hello Thomas,
> =

> Le dim. 30 oct. 2022 =E0 21:58, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>
> a =E9crit :
> > Hello Fabrice,
> > =

> > On Sat, 29 Oct 2022 10:25:10 +0200
> > =

> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > > https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=3D=
v1.24
> > > =

> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > =

> > We have zillions of build failures for host-pahole:
> >   http://autobuild.buildroot.net/?reason=3Dhost-pahole%

Sorry for the disturbance.

> > Is this version bump fixing them? If not, do we have an idea on how to
> > fix this build issue (I didn't investigated myself)?
> =

> Nope, this version bump will not fix these build failures. I tried to
> investigate but I wasn't able to reproduce it locally on my machine.
> These build failures are mostly raised by your autobuilder.
> =

> My assumption is that your kernel is probably too old, bpf_link_type is
> only available since version 5.8 and
> https://github.com/torvalds/linux/commit/f2e10bff16a0fdd41ba278c84da98137=
00e
> 356af
> =

> However, I don't know how to add this dependency to host-pahole (and
> host-libbpf).

I proposed this patch set:
https://lore.kernel.org/buildroot/20220610165441.84812-1-flaniel@linux.micr=
osoft.com/
to fix the build failures.
As pointed above, I am also not able to reproduce locally and I do not have =

access to an autobuilder setup (or I do not know how I can mimic one) to =

investigate on it.

Do you think the above patch can do the trick?
If not, is it possible to deploy locally an autobuilder to check if I can =

reproduce the problem and propose a correct patch?

> > Thanks!
> > =

> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
> =

> Best Regards,
> =

> Fabrice


Best regards and thank you in advance.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
