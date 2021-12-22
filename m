Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E37C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414C440273;
	Wed, 22 Dec 2021 17:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjXm-q7ggGw9; Wed, 22 Dec 2021 17:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18C9D40ABE;
	Wed, 22 Dec 2021 17:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 315611BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E3EB410A0
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06iSVNh_jrnK for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:32:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EEE0409C0
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:32:16 +0000 (UTC)
Received: from machine.localnet (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id E289820B7179;
 Wed, 22 Dec 2021 09:32:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E289820B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640194335;
 bh=d7sMWOWzjn/EqFxuMHV3IuY2MEip3tbx7oAtxHpgpVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WECr9LYgjQKi0rLe1AzEMPUwjmOTXjFEwOcZMuhiwPTL2CK2b303KG3UsbLJg8JnK
 xvDOpN+Lmk1pAugJSGaUF+//bZZo7tdt/w/rqw3EttlXGGdr8ZNmkOdWDziHShdhlS
 g2/WnHheZvwN/SYQgFHDaysreCgdkMFXwHZf2WZM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Dec 2021 18:32:12 +0100
Message-ID: <2476071.F8Ik9J7oW7@machine>
In-Reply-To: <fd7b51bd-5e63-ea80-1ea5-18c539c3a9c8@mind.be>
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
 <20211221145428.43829-2-flaniel@linux.microsoft.com>
 <fd7b51bd-5e63-ea80-1ea5-18c539c3a9c8@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/pahole: new host package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


Thank you for your reviews, I comment some inline.

Le mardi 21 d=E9cembre 2021 22:44:56 CET, vous avez =E9crit :
>   Hi Francis,
> =

>   Some relatively minor nitpicks.
> =

> On 21/12/2021 15:54, Francis Laniel wrote:
> > pahole is a tool used to show data structure embedded in debugging
> > information formats like DWARF.
> > It is notably needed by the Linux kernel to generate BPF Type Format (B=
TF)
> > information used by Compile Once - Run Everywhere (CO-RE) BPF tools.
> > =

> > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> > ---
> > =

> >   DEVELOPERS                    |  3 +++
> >   package/Config.in.host        |  1 +
> >   package/pahole/Config.in.host |  6 ++++++
> >   package/pahole/pahole.hash    |  2 ++
> >   package/pahole/pahole.mk      | 20 ++++++++++++++++++++
> >   5 files changed, 32 insertions(+)
> >   create mode 100644 package/pahole/Config.in.host
> >   create mode 100644 package/pahole/pahole.hash
> >   create mode 100644 package/pahole/pahole.mk
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 64db6c51d0..70df957415 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -939,6 +939,9 @@ N:	Floris Bos <bos@je-eigen-domein.nl>
> > =

> >   F:	package/ipmitool/
> >   F:	package/odhcploc/
> > =

> > +N:	Francis Laniel <flaniel@linux.microsoft.com>
> > +F:	package/pahole/
> > +
> > =

> >   N:	Francisco Gonzalez <gzmorell@gmail.com>
> >   F:	package/ser2net/
> > =

> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index 6e5a5c5fc5..ae512c5643 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -60,6 +60,7 @@ menu "Host utilities"
> > =

> >   	source "package/omap-u-boot-utils/Config.in.host"
> >   	source "package/openocd/Config.in.host"
> >   	source "package/opkg-utils/Config.in.host"
> > =

> > +	source "package/pahole/Config.in.host"
> > =

> >   	source "package/parted/Config.in.host"
> >   	source "package/patchelf/Config.in.host"
> >   	source "package/pigz/Config.in.host"
> > =

> > diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.h=
ost
> > new file mode 100644
> > index 0000000000..e427629632
> > --- /dev/null
> > +++ b/package/pahole/Config.in.host
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_HOST_PAHOLE
> > +	bool "host pahole"
> > +	help
> > +	  Pahole and other DWARF utils.
> > +
> > +	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
> > diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
> > new file mode 100644
> > index 0000000000..2573fde8c9
> > --- /dev/null
> > +++ b/package/pahole/pahole.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256 76b7eaf5747dbb7250a1a50185136d4639e0d70aa11c5d7c68139c0c8ca9be80
> > pahole-v1.22-br1.tar.gz
>   You should also add COPYING to the hash file.
> =

> > diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
> > new file mode 100644
> > index 0000000000..1f69f5391e
> > --- /dev/null
> > +++ b/package/pahole/pahole.mk
> > @@ -0,0 +1,20 @@
> > +######################################################################=
##
> > +#
> > +# pahole
> > +#
> > +######################################################################=
##
> > +
> > +PAHOLE_VERSION =3D v1.22
> =

>   There's a v1.23 now.

Thank you for it, I jumped to v1.23.

> > +PAHOLE_SITE =3D git://git.kernel.org/pub/scm/devel/pahole/pahole.git
> =

>   kernel.org also has a tarball download:
> =

> PAHOLE_SITE =3D
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
> =

> (cfr. e.g. f2fs-tools).
> =

>   That also allows you to set VERSION without the v, which we prefer beca=
use
> that way it can be used in CPE info and in release-monitoring.
> =

> > +PAHOLE_SITE_METHOD =3D git
> > +# pahole contains git submodule and relies on them to be built.
> =

>   Darn, so much for the tarball download :-(
> =

>   This is something we'd typically put in a comment or the commit message=
 so
> later down the line people remember why we didn't choose a tarball
> download.
> =

>   However, we normally prefer to unbundle dependencies, and we already ha=
ve
> libbpf (though not for the host at the moment). For host packages, the
> unbundling isn't terribly important, so if it's difficult, don't bother. =
But
> if it's easy to use an external bpf rather than the submodule, then please
> do that.

I tried to modify libbpf recipe to add host-libbpf and add it at dependenci=
es =

to host-pahole but sadly I was not successful.
Thus, I stick with getting pahole from its git repository with its submodul=
es.

> > +# We need to add this option to fetch the submodules before creating t=
he
> > +# archive.
> =

>   This comment is redundant, the first sentence was enough.
> =

> > +PAHOLE_GIT_SUBMODULES =3D YES
> > +# Better to build it statically so we do not rely on the host having
> > +# corresponding libraries.
> =

>   This doesn't make a whole lot of sense to me... We're building it, so t=
he
> libraries are there, otherwise it would fail to build, right? Again, not
> terribly important for a host package, but we prefer to do special stuff =
if
> not needed.
> =

> > +HOST_PAHOLE_CONF_OPTS =3D -DBUILD_SHARED_LIBS=3DOFF -D__LIB=3Dlib
> =

>   Why is the __LIB=3Dlib needed? What does it do? It's enough to mention =
this
> in the commit message.

This seems needed as directory for some build artifact, it is described in =

pahole README to build it.
I added a comment in pahole.mk as well as in commit message.

>   Regards,


Best regards.
>   Arnout
> =

> > +PAHOLE_LICENSE =3D GPL-2.0
> > +PAHOLE_LICENSE_FILES =3D COPYING
> > +
> > +$(eval $(host-cmake-package))




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
