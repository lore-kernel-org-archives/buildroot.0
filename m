Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824A5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD5380B24;
	Tue,  3 May 2022 14:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgjDkE2KcNi1; Tue,  3 May 2022 14:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E6B81AEA;
	Tue,  3 May 2022 14:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 213C51BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 110B280B24
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4zY4ix3CqSe for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:16:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8112A80B0B
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:16:04 +0000 (UTC)
Received: from pwmachine.localnet (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id BA89320EAB7F;
 Tue,  3 May 2022 07:16:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA89320EAB7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651587363;
 bh=dovrW3NtN9z/1I/0zC3AqKlumMh1i4dpzt1KbbO1TnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JJef/OQ6qKpCyZrs38cwrmJJ4NDvPUeabavCxfnzFO+woyWCtXuX+irlhDWMSclT4
 CCUtnUagpd4u+zu8mxYsurc2fD/2sa/rkNpftV4xR3dGXkrp7UJY4EFDQOezqQHEEF
 ibOTL5kw6Lpy5EwBfiVggycXWViJFhQfACDcsbU8=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 May 2022 15:15:59 +0100
Message-ID: <5563067.DvuYhMxLoT@pwmachine>
Organization: Microsoft
In-Reply-To: <bd76474e-7711-7bc2-83b8-5babd021cc39@mind.be>
References: <20220425164319.24788-1-flaniel@linux.microsoft.com>
 <20220425164319.24788-2-flaniel@linux.microsoft.com>
 <bd76474e-7711-7bc2-83b8-5babd021cc39@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v4 1/2] falcosecurity-libs: add new
 package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

Le samedi 30 avril 2022, 18:57:04 BST Arnout Vandecappelle a =E9crit :
> On 25/04/2022 18:43, Francis Laniel wrote:
> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

>   I've added a bit of explanation both in the commit message and in the .=
mk
> file itself that we're not building the userspace components and why.
> =

> > ---
> > =

> >   DEVELOPERS                                    |  1 +
> >   package/Config.in                             |  1 +
> >   ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
> >   package/falcosecurity-libs/Config.in          | 30 +++++++
> >   .../falcosecurity-libs.hash                   |  5 ++
> >   .../falcosecurity-libs/falcosecurity-libs.mk  | 80 +++++++++++++++++++
> >   6 files changed, 151 insertions(+)
> >   create mode 100644
> >   package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.=
pa
> >   tch create mode 100644 package/falcosecurity-libs/Config.in
> >   create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
> >   create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index ca9decb58f..d45d3d2a7b 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -969,6 +969,7 @@ F:	package/ipmitool/
> > =

> >   F:	package/odhcploc/
> >   =

> >   N:	Francis Laniel <flaniel@linux.microsoft.com>
> > =

> > +F:	package/falcosecurity-libs
> > =

> >   F:	package/pahole/
> >   F:	package/sysdig/
> >   F:	package/tbb/
> > =

> > diff --git a/package/Config.in b/package/Config.in
> > index 24f7af5ea8..3070094cc0 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1935,6 +1935,7 @@ menu "Other"
> > =

> >   	source "package/eigen/Config.in"
> >   	source "package/elfutils/Config.in"
> >   	source "package/ell/Config.in"
> > =

> > +	source "package/falcosecurity-libs/Config.in"
> > =

> >   	source "package/fftw/Config.in"
> >   	source "package/flann/Config.in"
> >   	source "package/flatbuffers/Config.in"
> > =

> > diff --git
> > a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.=
pa
> > tch
> > b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.=
pa
> > tch new file mode 100644
> > index 0000000000..6141d8ef72
> > --- /dev/null
> > +++
> > b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.=
pa
> > tch @@ -0,0 +1,34 @@
> > +From 2e8a50cd4975df3ab60ee07c9675831cd5ad397f Mon Sep 17 00:00:00 2001
> > +From: Francis Laniel <flaniel@linux.microsoft.com>
> > +Date: Tue, 12 Apr 2022 19:54:11 +0100
> > +Subject: [PATCH] cmake: Permit setting GRPC_CPP_PLUGIN.
> > +
> > +This patch enables users to set GRPC_CPP_PLUGIN while calling cmake wi=
th:
> > +cmake -DGRPC_CPP_PLUGIN=3D/path
> > +
> > +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

>   Could you send this patch upstream?

Oh sorry, I sent the nlohmann-json one but forgot about it!
I will try to upstream it!

> =

>   Applied to master, thanks.

Thank you!

>   Regards,
>   Arnout
> =

> [snip]

Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
