Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04510C77B75
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 13:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA40415E7;
	Mon, 22 May 2023 13:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA40415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4LW7F7iwW9I; Mon, 22 May 2023 13:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5F9415DF;
	Mon, 22 May 2023 13:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5F9415DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C615C1BF397
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E258415DF
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 13:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E258415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Dm6PfPMnnz5 for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 13:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A5B415D3
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A5B415D3
 for <buildroot@buildroot.org>; Mon, 22 May 2023 13:29:17 +0000 (UTC)
Received: from pwmachine.localnet (193.124.191.92.dynamic.jazztel.es
 [92.191.124.193])
 by linux.microsoft.com (Postfix) with ESMTPSA id F086020FB97A;
 Mon, 22 May 2023 06:29:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F086020FB97A
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 22 May 2023 14:29:11 +0100
Message-ID: <2682606.mvXUDI8C0e@pwmachine>
In-Reply-To: <20230513175649.GV2582048@scaer>
References: <20230421113627.20594-1-flaniel@linux.microsoft.com>
 <20230513175649.GV2582048@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1684762154;
 bh=Qr0AN293r/OYLXBGG2dCyy8Z5ZD2nPO4V1Q88cVLRhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=INACcPSkiRXptGva9+mo1ssrguOYIx1xXubbVnuqquK6mgfsXY38A01vjDgli0Ln9
 T2AN0JES7zdan+5s5dapaHU+cG9Twt78T+hGuv/bhZ/8Rq/ur3equaghDezggu/TkG
 rzdT/0bhTTy8DVuA8/2DH+sPSwzZrFfqwd6yNJMU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=INACcPSk
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.25
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

Le samedi 13 mai 2023, 18:56:49 WEST Yann E. MORIN a =E9crit :
> Francis, All,
> =

> On 2023-04-21 12:36 +0100, Francis Laniel spake thusly:
> > https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=3Dv1=
.25
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Applied to master, thanks.

Thank you for the review and the merge!
 =

> Regards,
> Yann E. MORIN.
> =

> > ---
> > =

> >  package/pahole/pahole.hash | 2 +-
> >  package/pahole/pahole.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
> > index 5610b252a3..9dc676d9f4 100644
> > --- a/package/pahole/pahole.hash
> > +++ b/package/pahole/pahole.hash
> > @@ -1,3 +1,3 @@
> > =

> >  # Locally computed
> > =

> > -sha256  eeb88a62c3aaa1f4c389117b7e7cc08a49acc8a0e7f165f76dd9c5ab9af2c2=
66 =

> > pahole-1.24.tar.gz +sha256 =

> > db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631 =

> > pahole-1.25.tar.gz> =

> >  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666=
c6 =

> >  COPYING> =

> > diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
> > index 82bba2f777..1a3e156ebb 100644
> > --- a/package/pahole/pahole.mk
> > +++ b/package/pahole/pahole.mk
> > @@ -4,7 +4,7 @@
> > =

> >  #
> >  ######################################################################=
###
> >  #######> =

> > -PAHOLE_VERSION =3D 1.24
> > +PAHOLE_VERSION =3D 1.25
> > =

> >  PAHOLE_SITE =3D
> >  https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
> >  HOST_PAHOLE_DEPENDENCIES =3D \
> >  =

> >  	host-elfutils \




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
