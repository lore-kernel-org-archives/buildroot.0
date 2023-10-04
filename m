Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D888E8FDD1
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 07:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BA982A26;
	Wed,  4 Oct 2023 07:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BA982A26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7WN4JCLt-DM; Wed,  4 Oct 2023 07:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 129D0828DF;
	Wed,  4 Oct 2023 07:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 129D0828DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1F211BF281
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 07:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719E940988
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 07:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719E940988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1vuFu4aGIi5 for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 07:02:27 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090EA40985
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 07:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090EA40985
Received: from pwmachine.localnet (unknown [82.77.158.143])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4E8CB20B74C0;
 Wed,  4 Oct 2023 00:02:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E8CB20B74C0
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 04 Oct 2023 10:02:21 +0300
Message-ID: <12296775.O9o76ZdvQC@pwmachine>
In-Reply-To: <20231003203646.GG2957@scaer>
References: <20231003152101.40980-1-flaniel@linux.microsoft.com>
 <20231003203646.GG2957@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1696402945;
 bh=2bsBqd05mE7JPmi1HnlnUkao7dsx/IkicBsm1J7qr18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A8aKIuFR81hH8XinO596m8erKHm4LRZ5mCDxSHj2HluowVp2Fl1V+8NT4mxQRCTHU
 Vx1XDRakZRlgODgIXgdO3POkKdw8nMpUv1aqDlFTLhIcDxJ0GQNYrBoUoKY6W0TP1o
 XymLBspsfAW8+WR/orFj+oDOTRfQS62vzC4gFHyo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=A8aKIuFR
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: bump to version 2021.10.0.
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

Le mardi 3 octobre 2023, 23:36:46 EEST Yann E. MORIN a =E9crit :
> Francis, All,
> =

> On 2023-10-03 18:21 +0300, Francis Laniel spake thusly:
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Applied to master, thanks.

Thank you!

For the record, this is part of a series to bump sysdig to latest version b=
ut =

they added extra complication to have it built the "buildroot way" and I wa=
s =

not successful yesterday at getting it compiled.
I will nonetheless try again later but I cannot really guarantee I will com=
e =

up with something.

> Regards,
> Yann E. MORIN.

Best regards.

> > ---
> > =

> >  package/tbb/tbb.hash | 2 +-
> >  package/tbb/tbb.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> > index 579581cfe4..1caf81c5c5 100644
> > --- a/package/tbb/tbb.hash
> > +++ b/package/tbb/tbb.hash
> > @@ -1,3 +1,3 @@
> > =

> >  # Locally calculated
> > =

> > -sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f=
8b =

> > tbb-2021.8.0.tar.gz +sha256 =

> > eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b =

> > tbb-2021.10.0.tar.gz> =

> >  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0a=
b4 =

> >  LICENSE.txt> =

> > diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> > index c3e06a4e6d..75cca5e99d 100644
> > --- a/package/tbb/tbb.mk
> > +++ b/package/tbb/tbb.mk
> > @@ -4,7 +4,7 @@
> > =

> >  #
> >  ######################################################################=
###
> >  #######> =

> > -TBB_VERSION =3D 2021.8.0
> > +TBB_VERSION =3D 2021.10.0
> > =

> >  TBB_SITE =3D $(call github,01org,tbb,v$(TBB_VERSION))
> >  TBB_INSTALL_STAGING =3D YES
> >  TBB_LICENSE =3D Apache-2.0
> > =

> > --
> > 2.34.1
> > =

> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
