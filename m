Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DAC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 13:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA5581E0B;
	Mon,  4 Dec 2023 13:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA5581E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWuFyVJWtEK8; Mon,  4 Dec 2023 13:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D18581E21;
	Mon,  4 Dec 2023 13:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D18581E21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B80B1BF969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CDEB4015F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CDEB4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYJe9j9EBzWD for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 13:52:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF0C4015E
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 13:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF0C4015E
Received: from pwmachine.localnet (85-170-33-133.rev.numericable.fr
 [85.170.33.133])
 by linux.microsoft.com (Postfix) with ESMTPSA id 596F020B74C0;
 Mon,  4 Dec 2023 05:52:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 596F020B74C0
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Dec 2023 14:52:03 +0100
Message-ID: <2709416.mvXUDI8C0e@pwmachine>
In-Reply-To: <d015344c-2fab-4eea-a9c4-b4b0362e2094@korsgaard.com>
References: <20231120135443.45265-1-flaniel@linux.microsoft.com>
 <d015344c-2fab-4eea-a9c4-b4b0362e2094@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1701697926;
 bh=ryADqjhWWS9hieQZUPsqVyJXeF481v8D5yUcKoXTQqM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dABKDB2jJrnR76xZD8E5bvzMmY7AVIvyu71CncHQ7T4+uJGKf3QoSQWc6yJp8h/I2
 M6tmitoZwr7dVRGJUYzNyJ68yRVrJ4he4c4N4LBKb/yPHMh4UEZPlfQWTtUOiV7BJB
 pYWs7+qgqTpOHUptavqDj6VXsI9KUOSHheT2QWhs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=dABKDB2j
Subject: Re: [Buildroot] [PATCH] package/tbb: bump to version 2021.11.0.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le dimanche 3 d=E9cembre 2023, 19:09:10 CET Peter Korsgaard a =E9crit :
> On 20/11/2023 14.54, Francis Laniel wrote:
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Committed to next, thanks.

Thank you for the merge!
 =

> > ---
> > =

> >   package/tbb/tbb.hash | 2 +-
> >   package/tbb/tbb.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> > index 085d54109a..4d2cb10da8 100644
> > --- a/package/tbb/tbb.hash
> > +++ b/package/tbb/tbb.hash
> > @@ -1,3 +1,3 @@
> > =

> >   # Locally calculated
> > =

> > -sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c8370=
0b =

> > tbb-2021.10.0.tar.gz +sha256 =

> > 782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363 =

> > tbb-2021.11.0.tar.gz> =

> >   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0=
ab4
> >    LICENSE.txt> =

> > diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> > index 75cca5e99d..1b0afbb889 100644
> > --- a/package/tbb/tbb.mk
> > +++ b/package/tbb/tbb.mk
> > @@ -4,7 +4,7 @@
> > =

> >   #
> >   #####################################################################=
###
> >   ########> =

> > -TBB_VERSION =3D 2021.10.0
> > +TBB_VERSION =3D 2021.11.0
> > =

> >   TBB_SITE =3D $(call github,01org,tbb,v$(TBB_VERSION))
> >   TBB_INSTALL_STAGING =3D YES
> >   TBB_LICENSE =3D Apache-2.0




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
