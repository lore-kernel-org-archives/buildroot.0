Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36567C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 07:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD8483F8D;
	Fri, 17 Dec 2021 07:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYdvI4QczTEV; Fri, 17 Dec 2021 07:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE3383F8F;
	Fri, 17 Dec 2021 07:58:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 915E71BF5A4
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 07:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E4D83F8F
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 07:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MxcxS_MVw2v for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 07:58:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A424F83F8D
 for <buildroot@busybox.net>; Fri, 17 Dec 2021 07:58:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id cf39so2902532lfb.8
 for <buildroot@busybox.net>; Thu, 16 Dec 2021 23:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uns8Xo8KQK/U9goVhtXsUQwzsbBRgen2gXK5ZmQ+enA=;
 b=EwGBXCYiQDFKSkNXZR2WU6MO1sw1jDnjsMRIOcViFGayRSDNkAXXPvBlT+jUC8Huk8
 ztcNsuoNUNirqoz5gaq/FR1e4VRSy9tm9gHJ3YWHvDD0xrCAN82RV5hPKgS+eFDs0P5m
 Uq1XXKO0RJvqkDu6qe7Mlh0tZR3P0gQIm7FFuS1OkBTP4o1VID/kF+fhdNLSCXXzQy1g
 VM2EFvuEOsG6+epK+IulKKER+iCOhJ4Gjh5Sk+e97cP+bafO1IYDi/fSQkoyubvzcVqx
 bWlCGIqZyP078ke3+LxiS3ERR6z4yM6+R56Q4Rl5LJTV1jWaCfy5+ZL6xNcMM9ah+z4s
 jr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uns8Xo8KQK/U9goVhtXsUQwzsbBRgen2gXK5ZmQ+enA=;
 b=bZRXSEnjh1NAPYDUgy9hWjnP0RW6ciCo/qAsilopGqB1uTCn6buRWc5TX+8HekQTDx
 yiGphcCUBgQPkdVXKXkutjDwdgg6tO3KtbqjRb8v3Yj3CBpDd/0C5yqN0ZpF/y/hublF
 ZT1tOFX2FtVeJWm5h+VxQ0VTVwDii8FA8zj7Br0pngZtBS2J/Bf1PUBEpXzyUSEpxQfs
 dvN81mOQd8B7HscJZCgrc8agOqWTABw3Qn9fNNKG3ZC4u8JgK87UbzzdyEfFMapMHnEq
 BWx3NXjwOALcepTp1S+LuzadbXE63H4H3pGsXneGZ03Kg8/MjrAT9jb1hpJEEFeGZqCL
 H5Ag==
X-Gm-Message-State: AOAM531+qP6sQMdgARjpCS73ftqkar0wvnmSfp/wS9hxX9msMe+oNUyO
 mkKorhXWIRoWtLqtGquBFDhWXCjnfPQ5LX8xzCU=
X-Google-Smtp-Source: ABdhPJy+Bs6ug+9stdqHY1eMmBi3fLNdSlUwlVSGjEY/oc/RDS7zlfsN2062jL73k325ggD/8LO/K7JwrTU1FLI8UF0=
X-Received: by 2002:a05:6512:b1d:: with SMTP id
 w29mr1863205lfu.219.1639727879089; 
 Thu, 16 Dec 2021 23:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20211025212541.12280-1-ps.report@gmx.net>
 <20211212200741.18143-1-guillaume.bressaix@gmail.com>
 <20211215214312.413bff44@gmx.net>
 <CAJe0E3fU6cf-PhrPO_f0JB0QFBA106Q86o8Yhk40ExOcsnN98Q@mail.gmail.com>
 <20211215231514.3b24c594@gmx.net>
In-Reply-To: <20211215231514.3b24c594@gmx.net>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Fri, 17 Dec 2021 08:57:33 +0100
Message-ID: <CAJe0E3fB=q_aX6PojV=C3Lm77cVUyksfKiSNHiZwVdkqoUXsHA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>, wbx@openadk.org
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: new package
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============3339650712964975635=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3339650712964975635==
Content-Type: multipart/alternative; boundary="000000000000c2f07905d352e5e7"

--000000000000c2f07905d352e5e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter, all,

I'm currently testing (runtime) on your V2 and will get back soon to you.

>Maybe take a look at package/mesa3d/mesa3d.mk and the dri-drivers handling=
:
>-Ddri-drivers=3D$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
I will not increment the v2 with new features, let's have it merged and we
start from there

>With libbsd enabled I get the following failure:
I solved that issue with similar -I flags,
but did not realize libbsd was not available to staging.
What do you think is best then, should we enable libbsd and provide a mini
libbsd patch along our ntpsec patch?
If we all say so, then we will wait for your v3

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mer. 15 d=C3=A9c. 2021 =C3=A0 23:15, Peter Seiderer <ps.report@gmx.net> =
a =C3=A9crit :

> Hello Guillaume,
>
> On Wed, 15 Dec 2021 22:21:31 +0100, Guillaume Bres <
> guillaume.bressaix@gmail.com> wrote:
>
> > Hello Peter,
> >
> > > Will prepare an update of my original patch with the version update
> and
> > some of
> > > your findings..., feel free to provide your improvements as add-on
> > patches ;-)
> > sounds good, i'll wait for your v2 and will test it on my side
> >
> > > Better done as an extra patch (easier to review)....
> > ok let's do that later
> >
> > >  libbsd is required
> > >> Are you sure?
> > >> With the original patch ntpsec builds fine without libbsd
> available...
> > it's listed in the dependencies for this pkg in debian.
> > Ran a quick grep in their sources, it's clearly in their CI basic
> > requirements too, but I cant figure where they actually use it. They
> > clearly pass -lbsd to the linker though.
>
>
> Checking for library bsd                 : not found
> [...]
>   LDFLAGS                       :  -Wl,-z,now -Wl,--strip-all -Wl,-z,relr=
o
>   LINKFLAGS_NTPD                :  -pie
>
>
> With libbsd enabled I get the following failure:
>
> --- building host ---
> Waf: Entering directory `.../build/ntpsec-1_2_1/build/host'
> [1/2] Processing ntpd/ntp_parser.y
> [2/2] Compiling build/host/ntpd/ntp_parser.tab.c
> In file included from ../../include/ntp.h:15,
>                  from .../build/ntpsec-1_2_1/ntpd/ntp_parser.y:16:
> ../../include/ntp_stdlib.h:20:10: fatal error: bsd/string.h: No such file
> or directory
>    20 | #include <bsd/string.h>
>       |          ^~~~~~~~~~~~~~
> compilation terminated.
>
>
> Can be avoided by the following patch:
>
> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
> index 256a75f15e..454cee3f37 100644
> --- a/package/libbsd/libbsd.mk
> +++ b/package/libbsd/libbsd.mk
> @@ -14,3 +14,4 @@ LIBBSD_CPE_ID_VENDOR =3D freedesktop
>  LIBBSD_INSTALL_STAGING =3D YES
>
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
> index 7275533d26..41013d1e99 100644
> --- a/package/ntpsec/Config.in
> +++ b/package/ntpsec/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NTPSEC
>         bool "ntpsec"
>         depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_LIBBSD
>         select BR2_PACKAGE_LIBCAP
>         select BR2_PACKAGE_OPENSSL
>         help
> diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> index 739ef0eab4..63eaf35268 100644
> --- a/package/ntpsec/ntpsec.mk
> +++ b/package/ntpsec/ntpsec.mk
> @@ -20,11 +20,12 @@ NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)
>  NTPSEC_DEPENDENCIES =3D \
>         host-pkgconf \
>         python3 \
> +       host-libbsd libbsd \
>         libcap \
>         openssl
>
>  NTPSEC_CONF_OPTS =3D \
> -       CC=3D"$(HOSTCC)" \
> +       CC=3D"$(HOSTCC) -I$(HOST_DIR)/include" \
>         PYTHON_CONFIG=3D"$(STAGING_DIR)/usr/bin/python3-config" \
>         --libdir=3D/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/=
ntp
> \
>         --cross-compiler=3D"$(TARGET_CC)" \
>
> >
> > >Would prefer one option per refclock to reduce dependencies...
> > I tried to do so at first, but am failing at correctly concatenating th=
e
> > refclocks in a comma separated string.
> > Expected format is "refclocks=3Dgpsd,nmea,shm"
> > Order does not matter. It is very important to only have valid refclock=
s
> in
> > the submitted string otherwise configure fails. refclocks=3D",nmea,shm"=
 and
> > refclocks=3D"shm," would fail.
> >
> > >Would prefer one option per refclock to reduce dependencies...
> > Actually there are no dependencies related to refclocks, it's up to the
> > user to provide a correct kernel config for specific hardware though.
> Only
> > "gpsd" will have unmet requirements at the moment and would get dropped
> out
> > by configure (smart detection). If you can provide a proper interface t=
o
> > concatenate the string, that would be useful (I'm not a good at shell
> > scripting). If we do so, I would recommend we stick to the list of
> actively
> > maintained refclocks (URL in my reply to v1)
>
> Maybe take a look at package/mesa3d/mesa3d.mk and the dri-drivers
> handling:
>
>         137         -Ddri-drivers=3D$(subst
> $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
>
> Regards,
> Peter
>
> >
> >
> > Guillaume W. Bres
> > Software engineer
> > <guillaume.bressaix@gmail.com>
> >
> >
> > Le mer. 15 d=C3=A9c. 2021 =C3=A0 21:43, Peter Seiderer <ps.report@gmx.n=
et> a
> =C3=A9crit :
> >
> > > Hello Guillaume,
> > >
> > > thanks of interest, testing and improvement of the ntpsec patch, some
> > > comments below...
> > >
> > > On Sun, 12 Dec 2021 21:07:41 +0100, guillaume.bressaix@gmail.com
> wrote:
> > >
> > > > From: Peter Seiderer <ps.report@gmx.net>
> > > >
> > > > - set 'CC=3Dgcc' to avoid cross-compile failure (see [1]):
> > > >
> > > >   /bin/sh: line 1:
> .../build/ntpsec-1_2_0/build/host/ntpd/keyword-gen:
> > > cannot execute binary file: Exec format error
> > > >
> > > >   Waf: Leaving directory `.../build/ntpsec-1_2_0/build/host'
> > > >   Build failed
> > > >    -> task in 'ntp_keyword.h' failed with exit status 126 (run with
> -v
> > > to display more information)
> > > >
> > > > - set '-std=3Dgnu99"' to avoid compile failure with old compilers
> > > >
> > > > - explicit set PYTHON_CONFIG
> > > >
> > > > - add patch
> > > 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch to
> > > >   fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related compile failure
> > > >
> > > > - add SYSV init file (S49ntp)
> > > >
> > > > - add example ntpd.conf (with legacy option enabled and provide
> skeleton
> > > >   for NTS configuration)
> > > >
> > > > - add config option for NTS support
> > > >
> > > > - depend on python3 (omit python2 to reduce test effort)
> > > >
> > > > - add ntp user/group and run ntpd as restricted user
> > > >
> > > > - add libcap dependency (compile time optional but needed for
> droproot
> > > >   support)
> > > >
> > > > - submit latest ntpsec version 1.2.1
> > >
> > > Interesting, not listed as release, but tagged and downloadable...
> > >
> > > >
> > > > - lib ntpc import in python is fixed by specifying the --libdir
> flag.
> > > >   -> removed the symlink trick
> > >
> > > Fine..., will test it...
> > >
> > > >
> > > > - add --refclock=3Dall flags to configure, see notes down below
> > > >
> > > > - add leap second management options & ntpviz
> > > >
> > > > - improved Config.in:
> > > >   libbsd is required
> > >
> > > Are you sure? With the original patch ntpsec builds fine without libb=
sd
> > > available...
> > >
> > > >   openssl is only needed when NTS encryption is enabled
> > >
> > > A build without NTS and without openssl gives:
> > >
> > >         Checking for OpenSSL/libcrypto (via pkg-config)
>  :
> > > not found
> > >         Checking for OpenSSL's crypto library
>  :
> > > not found
> > >         The configuration failed
> > >
> > > >   (depend on python3 only to simply things)
> > > >   improved classic mode help description
> > > >   improved early-drop-root feature description
> > > >
> > > > - early droproot should be an option: adapt libcap accordingly
> > >
> > > This will break (the hard coded) '-u npt:npt' option from
> > > package/ntpsec/S49ntp,
> > > any reason to avoid the security feature?
> > >
> > > >
> > > > - corrected CC=3Dgcc to CC=3D$(HOSTCC) in ntpsec.mk
> > >
> > > Good point...
> > >
> > > >
> > > > - provide service script for systemd infra along sysv infra
> > >
> > > Better done as an extra patch (easier to review)....
> > >
> > > >
> > > > - I don't think we need the patch if we restrict to
> !BR2_TOOLCHAIN_UCLIBC
> > > >   IMO it's better to keep the patch and allow all toolchains.
> > > >   I usually have glibc, but I just ran a sanity check on my
> zedboard
> > > with uclibc,
> > > >   it passed.
> > >
> > > Not important for the commit log...
> > >
> > > >
> > > > - used on zynq_zed_defconfig and beaglebone_defconfig
> > > >   daemon automatically started
> > > >   ntpq works fine
> > > >
> > > > [1] https://gitlab.com/NTPsec/ntpsec/-/issues/694
> > > >
> > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > > >
> > > > ---
> > > > notes on refclocks: https://docs.ntpsec.org/latest/refclock.html
> > > >   "For security reasons, we will no longer support any refclock
> > > >   that requires a closed-source driver to run", see webpage.
> > > >
> > > >   --refclock=3Dall is hardcoded at the moment
> > > >
> > > >   One must compile ntpsec with the 'refclock' option
> > > >   if they want to drive or interact with hardware.
> > > >
> > > >   In any case, refclocks are not critical for both buildtime &
> runtime:
> > > >
> > > >      [+] ./configure is smart enough to disable a refclock
> > > >      if requirements are not met. In the submitted context,
> > > >      this happens for refclock=3Dgpsd without BR2_PACKAGE_GPSD
> > > >      selected by user
> > > >
> > > >      [+] some refclocks naturally require a specific hw support
> > > >      with related kernel driver.
> > > >      This is not buildtime critical because build does not care
> > > >      about hw support.
> > > >      This is not runtime critical either because any missing
> > > >      hw support or unfeasible hardware access ends up as a logged
> > > >      error message. It is up to the user to correct it in the
> > > >      submitted context: example: 'nmea/gps' receivers without
> kernel
> > > support
> > > >      or hardware not plugged in.
> > >
> > > Would prefer one option per refclock to reduce dependencies...
> > >
> > > >
> > > > ntpd / ntpsec should be mutualy exclusive if we harcode S49ntp as
> the
> > > service script
> > > >
> > > > ---
> > > >  DEVELOPERS                                         |  1 +
> > > >  package/Config.in                                  |  1 +
> > > >  ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 61
> ++++++++++++++++
> > > >  package/ntpsec/Config.in                           | 68
> > > +++++++++++++++++
> > > >  package/ntpsec/S49ntp                              | 58
> +++++++++++++++
> > > >  package/ntpsec/ntpd.etc.conf                       | 33 +++++++++
> > > >  package/ntpsec/ntpd.service                        | 15 ++++
> > > >  package/ntpsec/ntpsec.hash                         |  4 +
> > > >  package/ntpsec/ntpsec.mk                           | 85
> > > ++++++++++++++++++++++
> > > >  9 files changed, 326 insertions(+)
> > > >  create mode 100644
> > >
> package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.=
patch
>
> > > >  create mode 100644 package/ntpsec/Config.in
> > > >  create mode 100644 package/ntpsec/S49ntp
> > > >  create mode 100644 package/ntpsec/ntpd.etc.conf
> > > >  create mode 100644 package/ntpsec/ntpd.service
> > > >  create mode 100644 package/ntpsec/ntpsec.hash
> > > >  create mode 100644 package/ntpsec/ntpsec.mk
> > > >
> > > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > > index 3023526..32b5e87 100644
> > > > --- a/DEVELOPERS
> > > > +++ b/DEVELOPERS
> > > > @@ -2196,6 +2196,7 @@ F:      package/iwd/
> > > >  F:   package/libevdev/
> > > >  F:   package/libuev/
> > > >  F:   package/log4cplus/
> > > > +F:   package/ntpsec/
> > > >  F:   package/postgresql/
> > > >  F:   package/python-colorzero/
> > > >  F:   package/python-flask-wtf/
> > > > diff --git a/package/Config.in b/package/Config.in
> > > > index 5720830..544a0fd 100644
> > > > --- a/package/Config.in
> > > > +++ b/package/Config.in
> > > > @@ -2271,6 +2271,7 @@ endif
> > > >       source "package/nmap/Config.in"
> > > >       source "package/noip/Config.in"
> > > >       source "package/ntp/Config.in"
> > > > +     source "package/ntpsec/Config.in"
> > > >       source "package/nuttcp/Config.in"
> > > >       source "package/odhcp6c/Config.in"
> > > >       source "package/odhcploc/Config.in"
> > > > diff --git
> > >
> a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
> > >
> b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
>
> > > > new file mode 100644
> > > > index 0000000..c2838fe
> > > > --- /dev/null
> > > > +++
> > >
> b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
>
> > > > @@ -0,0 +1,61 @@
> > > > +From 4015a1183d2f79dad6dd675ca5e0d329825f3fa3 Mon Sep 17 00:00:00
> 2001
> > > > +From: Peter Seiderer <ps.report@gmx.net>
> > > > +Date: Mon, 4 Oct 2021 22:25:58 +0200
> > > > +Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 related
> compile
> > > failure
> > > > +MIME-Version: 1.0
> > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > +Content-Transfer-Encoding: 8bit
> > > > +
> > > > +Use same define guard for definiton as for usage
> > > ('HAVE_STRUCT_NTPTIMEVAL_TAI'
> > > > +instead of 'NTP_API && NTP_API > 3').
> > > > +
> > > > +Fixes:
> > > > +
> > > > +  ../../ntptime/ntptime.c: In function =E2=80=98main=E2=80=99:
> > > > +  ../../ntptime/ntptime.c:349:17: error: =E2=80=98jfmt5=E2=80=99 u=
ndeclared (first
> use
> > > in this function); did you mean =E2=80=98jfmt6=E2=80=99?
> > > > +    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
> > > > +        |                 ^~~~~
> > > > +        |                 jfmt6
> > > > +  ../../ntptime/ntptime.c:349:17: note: each undeclared identifier
> is
> > > reported only once for each function it appears in
> > > > +  ../../ntptime/ntptime.c:349:25: error: =E2=80=98ofmt5=E2=80=99 u=
ndeclared (first
> use
> > > in this function); did you mean =E2=80=98ofmt6=E2=80=99?
> > > > +    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
> > > > +        |                         ^~~~~
> > > > +        |                         ofmt6
> > > > +  ../../ntptime/ntptime.c:321:15: warning: unused variable =E2=80=
=98jfmt6=E2=80=99
> > > [-Wunused-variable]
> > > > +    321 |   const char *jfmt6 =3D "";
> > > > +        |               ^~~~~
> > > > +  ../../ntptime/ntptime.c:311:15: warning: unused variable =E2=80=
=98ofmt6=E2=80=99
> > > [-Wunused-variable]
> > > > +    311 |   const char *ofmt6 =3D "\n";
> > > > +        |               ^~~~~
> > > > +
> > > > +[Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1245]
> > > > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > +---
> > > > + ntptime/ntptime.c | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c
> > > > +index ff861cb..5d58593 100644
> > > > +--- a/ntptime/ntptime.c
> > > > ++++ b/ntptime/ntptime.c
> > > > +@@ -305,7 +305,7 @@ main(
> > > > +             const char *ofmt2 =3D "  time %s, (.%0*d),\n";
> > > > +             const char *ofmt3 =3D "  maximum error %lu us,
> estimated
> > > error %lu us";
> > > > +             const char *ofmt4 =3D "  ntptime=3D%x.%x unixtime=3D%=
x.%0*d
> %s";
> > > > +-#if defined NTP_API && NTP_API > 3
> > > > ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
> > > > +             const char *ofmt5 =3D ", TAI offset %ld\n";
> > > > + #else
> > > > +             const char *ofmt6 =3D "\n";
> > > > +@@ -315,7 +315,7 @@ main(
> > > > +             const char *jfmt2 =3D
> > > "\"time\":\"%s\",\"fractional-time\":\".%0*d\",";
> > > > +             const char *jfmt3 =3D
> > > "\"maximum-error\":%lu,\"estimated-error\":%lu,";
> > > > +             const char *jfmt4 =3D
> > > "\"raw-ntp-time\":\"%x.%x\",\"raw-unix-time\":\"%x.%0*d %s\",";
> > > > +-#if defined NTP_API && NTP_API > 3
> > > > ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
> > > > +             const char *jfmt5 =3D "\"TAI-offset\":%d,";
> > > > + #else
> > > > +             const char *jfmt6 =3D "";
> > > > +--
> > > > +2.33.0
> > > > +
> > > > diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
> > > > new file mode 100644
> > > > index 0000000..9044aa4
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/Config.in
> > > > @@ -0,0 +1,68 @@
> > > > +comment "ntpsec needs a toolchain w/ wchar, thread, dynamic librar=
y"
> > > > +     depends on BR2_STATIC_LIBS
> > > > +     depends on !BR2_USE_WCHAR
> > > > +     depends on !BR2_TOOLCHAIN_HAS_THREADS # libbsd
> > > > +
> > > > +comment "ntpsec needs libbsd"
> > > > +     depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > > > +     depends on !BR2_STATIC_LIBS # libbsd
> > > > +
> > > > +comment "ntpsec needs python3"
> > > > +     depends on !BR2_PACKAGE_PYTHON3
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC
> > > > +     bool "ntpsec"
> > > > +     depends on !BR2_STATIC_LIBS # libbsd
> > > > +     depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > > > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> > > > +     depends on BR2_PACKAGE_PYTHON3
> > > > +     select BR2_PACKAGE_LIBCAP
> > > > +     select BR2_PACKAGE_LIBBSD
> > > > +     select BR2_PACKAGE_PPS_TOOLS # refclock(pps)
> > > > +     help
> > > > +       NTPsec is a secure, hardened, and improved
> > > > +       implementation of Network Time Protocol derived
> > > > +       from NTP Classic, Dave Mills=E2=80=99s original.
> > > > +
> > > > +       Provides things like ntpd, ntpdate, ntpq, etc...
> > > > +
> > > > +       https://www.ntpsec.org/
> > > > +
> > > > +if BR2_PACKAGE_NTPSEC
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC_CLASSIC_MODE
> > > > +     bool "ntpsec-classic"
> > > > +     help
> > > > +       Enable strict configuration and log-format compatibility
> > > > +       with NTP Classic.
> > > > +       This option is not recommended as it makes the module
> > > > +       less efficient.
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC_NTS
> > > > +     bool "ntpsec-nts"
> > > > +     select BR2_PACKAGE_OPENSSL
> > > > +     help
> > > > +       Enable Network Time Security (NTS) support.
> > > > +
> > > > +comment "ntpsec-ntploggpsd needs gpsd"
> > > > +     depends on !BR2_PACKAGE_GPSD
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC_LEAP_SMEAR
> > > > +     bool "ntpsec-leap-smear"
> > > > +     help
> > > > +       Activates leap second smearing,
> > > > +       https://docs.ntpsec.org/latest/leapsmear.html
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC_LEAP_TESTING
> > > > +     bool "ntpsec-leap-testing"
> > > > +     help
> > > > +       Enables leap seconds on other than 1st day of month
> > > > +
> > > > +config BR2_PACKAGE_NTPSEC_EARLY_DROPROOT
> > > > +     bool "ntpsec-early-droproot"
> > > > +     help
> > > > +       Drops root privileges as early as possible.
> > > > +       This requires the refclock devices to be owned
> > > > +       by owner/group running 'ntpd'
> > > > +
> > > > +endif
> > > > diff --git a/package/ntpsec/S49ntp b/package/ntpsec/S49ntp
> > > > new file mode 100644
> > > > index 0000000..f3db514
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/S49ntp
> > > > @@ -0,0 +1,58 @@
> > > > +#!/bin/sh
> > > > +#
> > > > +# Starts Network Time Protocol daemon
> > > > +#
> > > > +
> > > > +DAEMON=3D"ntpd"
> > > > +PIDFILE=3D"/var/run/$DAEMON.pid"
> > > > +
> > > > +NTPD_ARGS=3D"-g -u ntp:ntp -s /var/run/ntp"
> > > > +
> > > > +# shellcheck source=3D/dev/null
> > > > +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> > > > +
> > > > +mkdir -p /var/run/ntp && chown ntp:ntp /var/run/ntp
> > > > +
> > > > +start() {
> > > > +     printf 'Starting %s: ' "$DAEMON"
> > > > +     # shellcheck disable=3DSC2086 # we need the word splitting
> > > > +     start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" =
\
> > > > +             -- $NTPD_ARGS -p "$PIDFILE"
> > > > +     status=3D$?
> > > > +     if [ "$status" -eq 0 ]; then
> > > > +             echo "OK"
> > > > +     else
> > > > +             echo "FAIL"
> > > > +     fi
> > > > +     return "$status"
> > > > +}
> > > > +
> > > > +stop() {
> > > > +     printf 'Stopping %s: ' "$DAEMON"
> > > > +     start-stop-daemon -K -q -p "$PIDFILE"
> > > > +     status=3D$?
> > > > +     if [ "$status" -eq 0 ]; then
> > > > +             rm -f "$PIDFILE"
> > > > +             echo "OK"
> > > > +     else
> > > > +             echo "FAIL"
> > > > +     fi
> > > > +     return "$status"
> > > > +}
> > > > +
> > > > +restart() {
> > > > +     stop
> > > > +     sleep 1
> > > > +     start
> > > > +}
> > > > +
> > > > +case "$1" in
> > > > +     start|stop|restart)
> > > > +             "$1";;
> > > > +     reload)
> > > > +             # Restart, since there is no true "reload" feature.
> > > > +             restart;;
> > > > +     *)
> > > > +             echo "Usage: $0 {start|stop|restart|reload}"
> > > > +             exit 1
> > > > +esac
> > > > diff --git a/package/ntpsec/ntpd.etc.conf
> b/package/ntpsec/ntpd.etc.conf
> > > > new file mode 100644
> > > > index 0000000..e0f45c1
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/ntpd.etc.conf
> > > > @@ -0,0 +1,33 @@
> > > > +#
> > > > +# legacy NTP configuration
> > > > +#
> > > > +pool 0.pool.ntp.org iburst
> > > > +pool 1.pool.ntp.org iburst
> > > > +pool 2.pool.ntp.org iburst
> > > > +pool 3.pool.ntp.org iburst
> > > > +
> > > > +#
> > > > +# NTS configuration
> > > > +#
> > > > +# Notes:
> > > > +#  - uncomment the following lines to enable NTS support (but
> > > > +#    make sure the initial clock is up-to-date (otherwise the
> > > > +#    NTS certificate validation will fail with 'NTSc: certificate
> > > invalid:
> > > > +#    9=3D>certificate is not yet valid' as on boards without RTC
> support)
> > > > +#    and/or keep at least one line from the legacy NTP lines
> > > > +#  - enable BR2_PACKAGE_CA_CERTIFICATES to gain access to the
> > > certificate
> > > > +#    files
> > > > +#
> > > > +# server time.cloudflare.com nts  # Global, anycast
> > > > +# server nts.ntp.se:4443 nts      # Sweden
> > > > +# server ntpmon.dcs1.biz nts      # Singapore
> > > > +# server ntp1.glypnod.com nts     # San Francisco
> > > > +# server ntp2.glypnod.com nts     # London
> > > > +#
> > > > +# ca /usr/share/ca-certificates/mozilla
> > > > +
> > > > +# Allow only time queries, at a limited rate, sending KoD when in
> > > excess.
> > > > +# Allow all local queries (IPv4, IPv6)
> > > > +restrict default nomodify nopeer noquery limited kod
> > > > +restrict 127.0.0.1
> > > > +restrict [::1]
> > > > diff --git a/package/ntpsec/ntpd.service
> b/package/ntpsec/ntpd.service
> > > > new file mode 100644
> > > > index 0000000..b7db4a2
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/ntpd.service
> > > > @@ -0,0 +1,15 @@
> > > > +[Unit]
> > > > +Description=3DNetwork Time Service
> > > > +After=3Dnetwork.target
> > > > +
> > > > +[Service]
> > > > +Type=3Dforking
> > > > +PIDFile=3D/run/ntpd.pid
> > > > +# Turn off DNSSEC validation for hostname look-ups, since those
> need the
> > > > +# correct time to work, but we likely won't acquire that without
> NTP.
> > > Let's
> > > > +# break this chicken-and-egg cycle here.
> > > > +Environment=3DSYSTEMD_NSS_RESOLVE_VALIDATE=3D0
> > > > +ExecStart=3D/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntpd.pid
> > >
> > > The @NTPD_EXTRA_ARGS@ handling needs the sed command instead of the
> > > simple install one (see package/ntp/ntp.mk)...
> > >
> > > > +
> > > > +[Install]
> > > > +WantedBy=3Dmulti-user.target
> > > > diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.has=
h
> > > > new file mode 100644
> > > > index 0000000..49dc4e4
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/ntpsec.hash
> > > > @@ -0,0 +1,4 @@
> > > > +# Locally calculated
> > > > +sha256
> > > 71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c67d72e89
> > > ntpsec-NTPsec_1_2_1.tar.bz2
> > > > +sha256
> > > b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce4895ed91da4
> > > LICENSE.adoc
> > > > +sha256
> > > d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856
> > > docs/copyright.adoc
> > > > diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> > > > new file mode 100644
> > > > index 0000000..55b4bb0
> > > > --- /dev/null
> > > > +++ b/package/ntpsec/ntpsec.mk
> > > > @@ -0,0 +1,85 @@
> > > >
> > >
> +########################################################################=
########
>
> > > > +#
> > > > +# ntpsec
> > > > +#
> > > >
> > >
> +########################################################################=
########
>
> > > > +
> > > > +NTPSEC_VERSION_MAJOR =3D 1
> > > > +NTPSEC_VERSION_MINOR =3D 2
> > > > +NTPSEC_VERSION_POINT =3D 1
> > > > +NTPSEC_VERSION =3D
> > >
> $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
> > > > +NTPSEC_SOURCE =3D ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
> > > > +NTPSEC_SITE =3D
> > > https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
> > > > +NTPSEC_LICENSE =3D BSD-2-Clause NTP BSD-3-Clause MIT
> > > > +NTPSEC_LICENSE_FILES =3D LICENSE.adoc docs/copyright.adoc
> > > > +
> > > > +NTPSEC_CPE_ID_VENDOR =3D ntpsec
> > > > +NTPSEC_CPE_ID_VERSION =3D
> $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MINOR)
> > > > +NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)
> > > > +
> > > > +NTPSEC_DEPENDENCIES =3D \
> > > > +     $(if $(BR2_PACKAGE_PYTHON),python,python3) \
> > > > +     libbsd \
> > > > +     pps-tools
> > > > +
> > > > +NTPSEC_PYVER =3D $(if
> > >
> $(BR2_PACKAGE_PYTHON),python$(PYTHON_VERSION_MAJOR),python$(PYTHON3_VERSI=
ON_MAJOR))
>
> > > > +
> > > > +NTPSEC_CONF_OPTS =3D \
> > > > +     CC=3D$(HOSTCC) \
> > > > +     PYTHON_CONFIG=3D"$(STAGING_DIR)/usr/bin/$(if
> > > $(BR2_PACKAGE_PYTHON),python,python3)-config" \
> > > > +     --cross-compiler=3D"$(TARGET_CC)" \
> > > > +     --cross-cflags=3D"$(TARGET_CFLAGS) -std=3Dgnu99" \
> > > > +     --cross-ldflags=3D"$(TARGET_LDFLAGS)" \
> > > > +     --notests \
> > > > +     --disable-mdns-registration \
> > > > +     --enable-pylib=3Dffi \
> > > > +     --nopyc \
> > > > +     --nopyo \
> > > > +     --nopycache \
> > > > +     --disable-doc \
> > > > +     --disable-manpage \
> > > > +     --refclock=3Dall \
> > > > +     --libdir=3D/usr/lib/$(NTPSEC_PYVER)/site-packages/ntp
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_NTPSEC_CLASSIC_MODE),y)
> > > > +NTPSEC_CONF_OPTS +=3D --enable-classic-mode
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_NTPSEC_NTS),y)
> > > > +NTPSEC_DEPENDENCIES +=3D openssl
> > > > +else
> > > > +NTPSEC_CONF_OPTS +=3D --disable-nts
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_NTPSEC_EARLY_DROPROOT),y)
> > > > +NTPSEC_DEPENDENCIES +=3D libcap
> > > > +NTPSEC_CONF_OPTS +=3D --enable-early-droproot
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_SMEAR),y)
> > > > +NTPSEC_CONF_OPTS +=3D --enable-leap-smear
> > > > +endif
> > > > +
> > > > +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_TESTING),y)
> > > > +NTPSEC_CONF_OPTS +=3D --enable-leap-testing
> > > > +endif
> > > > +
> > > > +define NTPSEC_INSTALL_NTPSEC_CONF
> > > > +     $(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf
> > > $(TARGET_DIR)/etc/ntp.conf
> > > > +endef
> > > > +NTPSEC_POST_INSTALL_TARGET_HOOKS +=3D NTPSEC_INSTALL_NTPSEC_CONF
> > > > +
> > > > +define NTPSEC_INSTALL_INIT_SYSV
> > > > +     $(INSTALL) -D -m 755 $(NTPSEC_PKGDIR)/S49ntp
> > > $(TARGET_DIR)/etc/init.d/S49ntp
> > > > +endef
> > > > +
> > > > +define NTPSEC_INSTALL_INIT_SYSTEMD
> > > > +     $(INSTALL) -D -m 644 $(NTPSEC_PKGDIR)/ntpd.service \
> > > > +             $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
> > > > +endef
> > > > +
> > > > +define NTPSEC_USERS
> > > > +     ntp -1 ntp -1 * - - - ntpd user
> > > > +endef
> > > > +
> > > > +$(eval $(waf-package))
> > >
> > > Will prepare an update of my original patch with the version update a=
nd
> > > some of
> > > your findings..., feel free to provide your improvements as add-on
> patches
> > > ;-)
> > >
> > > Regards,
> > > Peter
> > >
> > >
>
>

--000000000000c2f07905d352e5e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Peter, all,<br><br>I&#39;m currently testing (runtime) on =
your V2 and will get back soon to you.<br><br>&gt;Maybe take a look at pack=
age/mesa3d/<a href=3D"http://mesa3d.mk/" rel=3D"noreferrer" target=3D"_blan=
k">mesa3d.mk</a>=C2=A0and the dri-drivers handling:<br>&gt;-Ddri-drivers=3D=
$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))<br>I will not increment =
the v2 with new features, let&#39;s have it merged and we start from there<=
br><br>&gt;With libbsd enabled I get the following failure:<br>I solved tha=
t issue with similar -I flags,<div>but did not realize libbsd was not avail=
able to staging.<br>What do you think is best then, should we=C2=A0enable=
=C2=A0libbsd and provide a mini libbsd patch along our ntpsec patch?<br>If =
we all say so, then we will wait for your v3<br><br clear=3D"all"><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><di=
v><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></fon=
t></div><font face=3D"arial,helvetica,sans-serif">Software engineer</font><=
br></div><font face=3D"arial,helvetica,sans-serif"></font></div><font face=
=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gm=
ail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font><=
/div></div></div></div></div></div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 15 d=C3=A9c. 2021=
 =C3=A0=C2=A023:15, Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net"=
>ps.report@gmx.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Guillaume,<br>
<br>
On Wed, 15 Dec 2021 22:21:31 +0100, Guillaume Bres &lt;<a href=3D"mailto:gu=
illaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com<=
/a>&gt; wrote:<br>
<br>
&gt; Hello Peter,<br>
&gt; <br>
&gt; &gt; Will prepare an update of my original patch with the version upda=
te and=C2=A0 <br>
&gt; some of<br>
&gt; &gt; your findings..., feel free to provide your improvements as add-o=
n=C2=A0 <br>
&gt; patches ;-)<br>
&gt; sounds good, i&#39;ll wait for your v2 and will test it on my side<br>
&gt; <br>
&gt; &gt; Better done as an extra patch (easier to review)....=C2=A0 <br>
&gt; ok let&#39;s do that later<br>
&gt; <br>
&gt; &gt;=C2=A0 libbsd is required=C2=A0 <br>
&gt; &gt;&gt; Are you sure?<br>
&gt; &gt;&gt; With the original patch ntpsec builds fine without libbsd ava=
ilable...=C2=A0 <br>
&gt; it&#39;s listed in the dependencies for this pkg in debian.<br>
&gt; Ran a quick grep in their sources, it&#39;s clearly in their CI basic<=
br>
&gt; requirements too, but I cant figure where they actually use it. They<b=
r>
&gt; clearly pass -lbsd to the linker though.<br>
<br>
<br>
Checking for library bsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: not found<br>
[...]<br>
=C2=A0 LDFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:=C2=A0 -Wl,-z,now -Wl,--strip-all -Wl,-z,relro <br=
>
=C2=A0 LINKFLAGS_NTPD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :=C2=A0 -pie <br>
<br>
<br>
With libbsd enabled I get the following failure:<br>
<br>
--- building host --- <br>
Waf: Entering directory `.../build/ntpsec-1_2_1/build/host&#39;<br>
[1/2] Processing ntpd/ntp_parser.y<br>
[2/2] Compiling build/host/ntpd/ntp_parser.tab.c<br>
In file included from ../../include/ntp.h:15,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from .../buil=
d/ntpsec-1_2_1/ntpd/ntp_parser.y:16:<br>
../../include/ntp_stdlib.h:20:10: fatal error: bsd/string.h: No such file o=
r directory<br>
=C2=A0 =C2=A020 | #include &lt;bsd/string.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~<br>
compilation terminated.<br>
<br>
<br>
Can be avoided by the following patch:<br>
<br>
diff --git a/package/libbsd/<a href=3D"http://libbsd.mk" rel=3D"noreferrer"=
 target=3D"_blank">libbsd.mk</a> b/package/libbsd/<a href=3D"http://libbsd.=
mk" rel=3D"noreferrer" target=3D"_blank">libbsd.mk</a><br>
index 256a75f15e..454cee3f37 100644<br>
--- a/package/libbsd/<a href=3D"http://libbsd.mk" rel=3D"noreferrer" target=
=3D"_blank">libbsd.mk</a><br>
+++ b/package/libbsd/<a href=3D"http://libbsd.mk" rel=3D"noreferrer" target=
=3D"_blank">libbsd.mk</a><br>
@@ -14,3 +14,4 @@ LIBBSD_CPE_ID_VENDOR =3D freedesktop<br>
=C2=A0LIBBSD_INSTALL_STAGING =3D YES<br>
<br>
=C2=A0$(eval $(autotools-package))<br>
+$(eval $(host-autotools-package))<br>
diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in<br>
index 7275533d26..41013d1e99 100644<br>
--- a/package/ntpsec/Config.in<br>
+++ b/package/ntpsec/Config.in<br>
@@ -1,6 +1,7 @@<br>
=C2=A0config BR2_PACKAGE_NTPSEC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;ntpsec&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PYTHON3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBBSD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBCAP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
diff --git a/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"noreferrer"=
 target=3D"_blank">ntpsec.mk</a> b/package/ntpsec/<a href=3D"http://ntpsec.=
mk" rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
index 739ef0eab4..63eaf35268 100644<br>
--- a/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"noreferrer" target=
=3D"_blank">ntpsec.mk</a><br>
+++ b/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"noreferrer" target=
=3D"_blank">ntpsec.mk</a><br>
@@ -20,11 +20,12 @@ NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)<br>
=C2=A0NTPSEC_DEPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-pkgconf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-libbsd libbsd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 openssl<br>
<br>
=C2=A0NTPSEC_CONF_OPTS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(HOSTCC)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(HOSTCC) -I$(HOST_DIR)/include&quot=
; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON_CONFIG=3D&quot;$(STAGING_DIR)/usr/bin/py=
thon3-config&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D/usr/lib/python$(PYTHON3_VERSION_MAJ=
OR)/site-packages/ntp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --cross-compiler=3D&quot;$(TARGET_CC)&quot; \<b=
r>
<br>
&gt; <br>
&gt; &gt;Would prefer one option per refclock to reduce dependencies...=C2=
=A0 <br>
&gt; I tried to do so at first, but am failing at correctly concatenating t=
he<br>
&gt; refclocks in a comma separated string.<br>
&gt; Expected format is &quot;refclocks=3Dgpsd,nmea,shm&quot;<br>
&gt; Order does not matter. It is very important to only have valid refcloc=
ks in<br>
&gt; the submitted string otherwise configure fails. refclocks=3D&quot;,nme=
a,shm&quot; and<br>
&gt; refclocks=3D&quot;shm,&quot; would fail.<br>
&gt; <br>
&gt; &gt;Would prefer one option per refclock to reduce dependencies...=C2=
=A0 <br>
&gt; Actually there are no dependencies related to refclocks, it&#39;s up t=
o the<br>
&gt; user to provide a correct kernel config for specific hardware though. =
Only<br>
&gt; &quot;gpsd&quot; will have unmet requirements at the moment and would =
get dropped out<br>
&gt; by configure (smart detection). If you can provide a proper interface =
to<br>
&gt; concatenate the string, that would be useful (I&#39;m not a good at sh=
ell<br>
&gt; scripting). If we do so, I would recommend we stick to the list of act=
ively<br>
&gt; maintained refclocks (URL in my reply to v1)<br>
<br>
Maybe take a look at package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"nor=
eferrer" target=3D"_blank">mesa3d.mk</a> and the dri-drivers handling:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 137=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddri-driv=
ers=3D$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))<br>
<br>
Regards,<br>
Peter<br>
<br>
&gt; <br>
&gt; <br>
&gt; Guillaume W. Bres<br>
&gt; Software engineer<br>
&gt; &lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">=
guillaume.bressaix@gmail.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Le mer. 15 d=C3=A9c. 2021 =C3=A0 21:43, Peter Seiderer &lt;<a href=3D"=
mailto:ps.report@gmx.net" target=3D"_blank">ps.report@gmx.net</a>&gt; a =C3=
=A9crit :<br>
&gt; <br>
&gt; &gt; Hello Guillaume,<br>
&gt; &gt;<br>
&gt; &gt; thanks of interest, testing and improvement of the ntpsec patch, =
some<br>
&gt; &gt; comments below...<br>
&gt; &gt;<br>
&gt; &gt; On Sun, 12 Dec 2021 21:07:41 +0100, <a href=3D"mailto:guillaume.b=
ressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a> wrote=
:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net=
" target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - set &#39;CC=3Dgcc&#39; to avoid cross-compile failure (see=
 [1]):<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0/bin/sh: line 1: .../build/ntpsec-1_2_0/build/ho=
st/ntpd/keyword-gen:=C2=A0 <br>
&gt; &gt; cannot execute binary file: Exec format error=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Waf: Leaving directory `.../build/ntpsec-1_2_0/b=
uild/host&#39;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Build failed=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 -&gt; task in &#39;ntp_keyword.h&#39; failed wi=
th exit status 126 (run with -v=C2=A0 <br>
&gt; &gt; to display more information)=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - set &#39;-std=3Dgnu99&quot;&#39; to avoid compile failure =
with old compilers<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - explicit set PYTHON_CONFIG<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add patch=C2=A0 <br>
&gt; &gt; 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch to=
=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related comp=
ile failure<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add SYSV init file (S49ntp)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add example ntpd.conf (with legacy option enabled and prov=
ide skeleton<br>
&gt; &gt; &gt;=C2=A0 =C2=A0for NTS configuration)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add config option for NTS support<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - depend on python3 (omit python2 to reduce test effort)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add ntp user/group and run ntpd as restricted user<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add libcap dependency (compile time optional but needed fo=
r droproot<br>
&gt; &gt; &gt;=C2=A0 =C2=A0support)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - submit latest ntpsec version 1.2.1=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Interesting, not listed as release, but tagged and downloadable..=
.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - lib ntpc import in python is fixed by specifying the --lib=
dir flag.=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0-&gt; removed the symlink trick=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Fine..., will test it...<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add --refclock=3Dall flags to configure, see notes down be=
low<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - add leap second management options &amp; ntpviz<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - improved Config.in:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0libbsd is required=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Are you sure? With the original patch ntpsec builds fine without =
libbsd<br>
&gt; &gt; available...<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0openssl is only needed when NTS encryption is en=
abled=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; A build without NTS and without openssl gives:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Checking for OpenSSL/libcrypto (=
via pkg-config)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0:<br>
&gt; &gt; not found<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Checking for OpenSSL&#39;s crypt=
o library=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; &gt; not found<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The configuration failed<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0(depend on python3 only to simply things)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0improved classic mode help description<br>
&gt; &gt; &gt;=C2=A0 =C2=A0improved early-drop-root feature description<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - early droproot should be an option: adapt libcap according=
ly=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; This will break (the hard coded) &#39;-u npt:npt&#39; option from=
<br>
&gt; &gt; package/ntpsec/S49ntp,<br>
&gt; &gt; any reason to avoid the security feature?<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - corrected CC=3Dgcc to CC=3D$(HOSTCC) in <a href=3D"http://=
ntpsec.mk" rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a>=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Good point...<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - provide service script for systemd infra along sysv infra=
=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Better done as an extra patch (easier to review)....<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - I don&#39;t think we need the patch if we restrict to !BR2=
_TOOLCHAIN_UCLIBC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0IMO it&#39;s better to keep the patch and allow =
all toolchains.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0I usually have glibc, but I just ran a sanity ch=
eck on my zedboard=C2=A0 <br>
&gt; &gt; with uclibc,=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0it passed.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Not important for the commit log...<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - used on zynq_zed_defconfig and beaglebone_defconfig<br>
&gt; &gt; &gt;=C2=A0 =C2=A0daemon automatically started<br>
&gt; &gt; &gt;=C2=A0 =C2=A0ntpq works fine<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/issues/694=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/NTPsec/ntpsec/-/i=
ssues/694</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.repor=
t@gmx.net" target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guill=
aume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>=
&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; notes on refclocks: <a href=3D"https://docs.ntpsec.org/lates=
t/refclock.html" rel=3D"noreferrer" target=3D"_blank">https://docs.ntpsec.o=
rg/latest/refclock.html</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0&quot;For security reasons, we will no longer su=
pport any refclock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0that requires a closed-source driver to run&quot=
;, see webpage.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0--refclock=3Dall is hardcoded at the moment<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0One must compile ntpsec with the &#39;refclock&#=
39; option<br>
&gt; &gt; &gt;=C2=A0 =C2=A0if they want to drive or interact with hardware.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0In any case, refclocks are not critical for both=
 buildtime &amp; runtime:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 [+] ./configure is smart enough to disab=
le a refclock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if requirements are not met. In the subm=
itted context,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 this happens for refclock=3Dgpsd without=
 BR2_PACKAGE_GPSD<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 selected by user<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 [+] some refclocks naturally require a s=
pecific hw support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 with related kernel driver.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 This is not buildtime critical because b=
uild does not care<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 about hw support.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 This is not runtime critical either beca=
use any missing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 hw support or unfeasible hardware access=
 ends up as a logged<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 error message. It is up to the user to c=
orrect it in the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 submitted context: example: &#39;nmea/gp=
s&#39; receivers without kernel=C2=A0 <br>
&gt; &gt; support=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 or hardware not plugged in.=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Would prefer one option per refclock to reduce dependencies...<br=
>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ntpd / ntpsec should be mutualy exclusive if we harcode S49n=
tp as the=C2=A0 <br>
&gt; &gt; service script=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 6=
1 ++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 package/ntpsec/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 68=
=C2=A0 <br>
&gt; &gt; +++++++++++++++++=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 package/ntpsec/S49ntp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 58 +++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 package/ntpsec/ntpd.etc.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++++++<b=
r>
&gt; &gt; &gt;=C2=A0 package/ntpsec/ntpd.service=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++<br>
&gt; &gt; &gt;=C2=A0 package/ntpsec/ntpsec.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +<b=
r>
&gt; &gt; &gt;=C2=A0 package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"nor=
eferrer" target=3D"_blank">ntpsec.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 85=C2=A0 <b=
r>
&gt; &gt; ++++++++++++++++++++++=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 9 files changed, 326 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644=C2=A0 <br>
&gt; &gt; package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-c=
ompile-.patch=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/Config.in<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/S49ntp<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/ntpd.etc.conf<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/ntpd.service<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/ntpsec.hash<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 package/ntpsec/<a href=3D"http://nt=
psec.mk" rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; &gt; &gt; index 3023526..32b5e87 100644<br>
&gt; &gt; &gt; --- a/DEVELOPERS<br>
&gt; &gt; &gt; +++ b/DEVELOPERS<br>
&gt; &gt; &gt; @@ -2196,6 +2196,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/iwd/<br=
>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/libevdev/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/libuev/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/log4cplus/<br>
&gt; &gt; &gt; +F:=C2=A0 =C2=A0package/ntpsec/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/postgresql/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/python-colorzero/<br>
&gt; &gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/python-flask-wtf/<br>
&gt; &gt; &gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; &gt; &gt; index 5720830..544a0fd 100644<br>
&gt; &gt; &gt; --- a/package/Config.in<br>
&gt; &gt; &gt; +++ b/package/Config.in<br>
&gt; &gt; &gt; @@ -2271,6 +2271,7 @@ endif<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/nmap/Config.i=
n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/noip/Config.i=
n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ntp/Config.in=
&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/ntpsec/Config.in&q=
uot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/nuttcp/Config=
.in&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/odhcp6c/Confi=
g.in&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/odhcploc/Conf=
ig.in&quot;<br>
&gt; &gt; &gt; diff --git=C2=A0 <br>
&gt; &gt; a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related=
-compile-.patch<br>
&gt; &gt; b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related=
-compile-.patch=C2=A0 <br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..c2838fe<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++=C2=A0 <br>
&gt; &gt; b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related=
-compile-.patch=C2=A0 <br>
&gt; &gt; &gt; @@ -0,0 +1,61 @@<br>
&gt; &gt; &gt; +From 4015a1183d2f79dad6dd675ca5e0d329825f3fa3 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.ne=
t" target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; &gt; &gt; +Date: Mon, 4 Oct 2021 22:25:58 +0200<br>
&gt; &gt; &gt; +Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 relat=
ed compile=C2=A0 <br>
&gt; &gt; failure=C2=A0 <br>
&gt; &gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Use same define guard for definiton as for usage=C2=A0 <br>
&gt; &gt; (&#39;HAVE_STRUCT_NTPTIMEVAL_TAI&#39;=C2=A0 <br>
&gt; &gt; &gt; +instead of &#39;NTP_API &amp;&amp; NTP_API &gt; 3&#39;).<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Fixes:<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c: In function =E2=80=98main=
=E2=80=99:<br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c:349:17: error: =E2=80=98jfmt=
5=E2=80=99 undeclared (first use=C2=A0 <br>
&gt; &gt; in this function); did you mean =E2=80=98jfmt6=E2=80=99?=C2=A0 <b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 349 |=C2=A0 =C2=A0printf(json ? jfmt5 : ofmt5=
, (long)ntv.tai);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jfmt6<br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c:349:17: note: each undeclare=
d identifier is=C2=A0 <br>
&gt; &gt; reported only once for each function it appears in=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c:349:25: error: =E2=80=98ofmt=
5=E2=80=99 undeclared (first use=C2=A0 <br>
&gt; &gt; in this function); did you mean =E2=80=98ofmt6=E2=80=99?=C2=A0 <b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 349 |=C2=A0 =C2=A0printf(json ? jfmt5 : ofmt5=
, (long)ntv.tai);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ofmt6<br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c:321:15: warning: unused vari=
able =E2=80=98jfmt6=E2=80=99=C2=A0 <br>
&gt; &gt; [-Wunused-variable]=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 321 |=C2=A0 =C2=A0const char *jfmt6 =3D &quot=
;&quot;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; +=C2=A0 ../../ntptime/ntptime.c:311:15: warning: unused vari=
able =E2=80=98ofmt6=E2=80=99=C2=A0 <br>
&gt; &gt; [-Wunused-variable]=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 311 |=C2=A0 =C2=A0const char *ofmt6 =3D &quot=
;\n&quot;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +[Upstream: <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/me=
rge_requests/1245" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/=
NTPsec/ntpsec/-/merge_requests/1245</a>]<br>
&gt; &gt; &gt; +Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.repo=
rt@gmx.net" target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + ntptime/ntptime.c | 4 ++--<br>
&gt; &gt; &gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c<br>
&gt; &gt; &gt; +index ff861cb..5d58593 100644<br>
&gt; &gt; &gt; +--- a/ntptime/ntptime.c<br>
&gt; &gt; &gt; ++++ b/ntptime/ntptime.c<br>
&gt; &gt; &gt; +@@ -305,7 +305,7 @@ main(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*ofmt2 =3D &quot;=C2=A0 time %s, (.%0*d),\n&quot;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*ofmt3 =3D &quot;=C2=A0 maximum error %lu us, estimated=C2=A0 <br>
&gt; &gt; error %lu us&quot;;=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*ofmt4 =3D &quot;=C2=A0 ntptime=3D%x.%x unixtime=3D%x.%0*d %s&quot;;<br>
&gt; &gt; &gt; +-#if defined NTP_API &amp;&amp; NTP_API &gt; 3<br>
&gt; &gt; &gt; ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*ofmt5 =3D &quot;, TAI offset %ld\n&quot;;<br>
&gt; &gt; &gt; + #else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*ofmt6 =3D &quot;\n&quot;;<br>
&gt; &gt; &gt; +@@ -315,7 +315,7 @@ main(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*jfmt2 =3D=C2=A0 <br>
&gt; &gt; &quot;\&quot;time\&quot;:\&quot;%s\&quot;,\&quot;fractional-time\=
&quot;:\&quot;.%0*d\&quot;,&quot;;=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*jfmt3 =3D=C2=A0 <br>
&gt; &gt; &quot;\&quot;maximum-error\&quot;:%lu,\&quot;estimated-error\&quo=
t;:%lu,&quot;;=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*jfmt4 =3D=C2=A0 <br>
&gt; &gt; &quot;\&quot;raw-ntp-time\&quot;:\&quot;%x.%x\&quot;,\&quot;raw-u=
nix-time\&quot;:\&quot;%x.%0*d %s\&quot;,&quot;;=C2=A0 <br>
&gt; &gt; &gt; +-#if defined NTP_API &amp;&amp; NTP_API &gt; 3<br>
&gt; &gt; &gt; ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*jfmt5 =3D &quot;\&quot;TAI-offset\&quot;:%d,&quot;;<br>
&gt; &gt; &gt; + #else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =
*jfmt6 =3D &quot;&quot;;<br>
&gt; &gt; &gt; +--<br>
&gt; &gt; &gt; +2.33.0<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; diff --git a/package/ntpsec/Config.in b/package/ntpsec/Confi=
g.in<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..9044aa4<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/Config.in<br>
&gt; &gt; &gt; @@ -0,0 +1,68 @@<br>
&gt; &gt; &gt; +comment &quot;ntpsec needs a toolchain w/ wchar, thread, dy=
namic library&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_USE_WCHAR<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS #=
 libbsd<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +comment &quot;ntpsec needs libbsd&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_LIBBSD_ARCH_SUP=
PORTS<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libbsd<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +comment &quot;ntpsec needs python3&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_PYTHON3<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libbsd<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBBSD_ARCH_SUPP=
ORTS<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # =
libbsd<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_PYTHON3<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBCAP<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBBSD<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PPS_TOOLS # refclock=
(pps)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NTPsec is a secure, hardened, an=
d improved<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0implementation of Network Time P=
rotocol derived<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0from NTP Classic, Dave Mills=E2=
=80=99s original.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Provides things like ntpd, ntpda=
te, ntpq, etc...<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.ntpsec.or=
g/" rel=3D"noreferrer" target=3D"_blank">https://www.ntpsec.org/</a><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +if BR2_PACKAGE_NTPSEC<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC_CLASSIC_MODE<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-classic&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable strict configuration and =
log-format compatibility<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0with NTP Classic.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This option is not recommended a=
s it makes the module<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0less efficient.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC_NTS<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-nts&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Network Time Security (NT=
S) support.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +comment &quot;ntpsec-ntploggpsd needs gpsd&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_GPSD<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC_LEAP_SMEAR<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-leap-smear&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Activates leap second smearing,<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.ntpsec.o=
rg/latest/leapsmear.html" rel=3D"noreferrer" target=3D"_blank">https://docs=
.ntpsec.org/latest/leapsmear.html</a><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC_LEAP_TESTING<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-leap-testing&quot;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enables leap seconds on other th=
an 1st day of month<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +config BR2_PACKAGE_NTPSEC_EARLY_DROPROOT<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-early-droproot&quot;<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Drops root privileges as early a=
s possible.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This requires the refclock devic=
es to be owned<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0by owner/group running &#39;ntpd=
&#39;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; diff --git a/package/ntpsec/S49ntp b/package/ntpsec/S49ntp<b=
r>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..f3db514<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/S49ntp<br>
&gt; &gt; &gt; @@ -0,0 +1,58 @@<br>
&gt; &gt; &gt; +#!/bin/sh<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# Starts Network Time Protocol daemon<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +DAEMON=3D&quot;ntpd&quot;<br>
&gt; &gt; &gt; +PIDFILE=3D&quot;/var/run/$DAEMON.pid&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPD_ARGS=3D&quot;-g -u ntp:ntp -s /var/run/ntp&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +# shellcheck source=3D/dev/null<br>
&gt; &gt; &gt; +[ -r &quot;/etc/default/$DAEMON&quot; ] &amp;&amp; . &quot;=
/etc/default/$DAEMON&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +mkdir -p /var/run/ntp &amp;&amp; chown ntp:ntp /var/run/ntp=
<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +start() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s: &#39; &quot;$D=
AEMON&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0# shellcheck disable=3DSC2086 # we need=
 the word splitting<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon -S -q -p &quot;$PIDFI=
LE&quot; -x &quot;/usr/sbin/$DAEMON&quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- $NTPD_AR=
GS -p &quot;$PIDFILE&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
OK&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
FAIL&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +stop() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;$D=
AEMON&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon -K -q -p &quot;$PIDFI=
LE&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot=
;$PIDFILE&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
OK&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
FAIL&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +restart() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +case &quot;$1&quot; in<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&qu=
ot;;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, =
since there is no true &quot;reload&quot; feature.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;=
Usage: $0 {start|stop|restart|reload}&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; &gt; &gt; +esac<br>
&gt; &gt; &gt; diff --git a/package/ntpsec/ntpd.etc.conf b/package/ntpsec/n=
tpd.etc.conf<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..e0f45c1<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/ntpd.etc.conf<br>
&gt; &gt; &gt; @@ -0,0 +1,33 @@<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# legacy NTP configuration<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +pool <a href=3D"http://0.pool.ntp.org" rel=3D"noreferrer" t=
arget=3D"_blank">0.pool.ntp.org</a> iburst<br>
&gt; &gt; &gt; +pool <a href=3D"http://1.pool.ntp.org" rel=3D"noreferrer" t=
arget=3D"_blank">1.pool.ntp.org</a> iburst<br>
&gt; &gt; &gt; +pool <a href=3D"http://2.pool.ntp.org" rel=3D"noreferrer" t=
arget=3D"_blank">2.pool.ntp.org</a> iburst<br>
&gt; &gt; &gt; +pool <a href=3D"http://3.pool.ntp.org" rel=3D"noreferrer" t=
arget=3D"_blank">3.pool.ntp.org</a> iburst<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# NTS configuration<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# Notes:<br>
&gt; &gt; &gt; +#=C2=A0 - uncomment the following lines to enable NTS suppo=
rt (but<br>
&gt; &gt; &gt; +#=C2=A0 =C2=A0 make sure the initial clock is up-to-date (o=
therwise the<br>
&gt; &gt; &gt; +#=C2=A0 =C2=A0 NTS certificate validation will fail with &#=
39;NTSc: certificate=C2=A0 <br>
&gt; &gt; invalid:=C2=A0 <br>
&gt; &gt; &gt; +#=C2=A0 =C2=A0 9=3D&gt;certificate is not yet valid&#39; as=
 on boards without RTC support)<br>
&gt; &gt; &gt; +#=C2=A0 =C2=A0 and/or keep at least one line from the legac=
y NTP lines<br>
&gt; &gt; &gt; +#=C2=A0 - enable BR2_PACKAGE_CA_CERTIFICATES to gain access=
 to the=C2=A0 <br>
&gt; &gt; certificate=C2=A0 <br>
&gt; &gt; &gt; +#=C2=A0 =C2=A0 files<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# server <a href=3D"http://time.cloudflare.com" rel=3D"nore=
ferrer" target=3D"_blank">time.cloudflare.com</a> nts=C2=A0 # Global, anyca=
st<br>
&gt; &gt; &gt; +# server <a href=3D"http://nts.ntp.se:4443" rel=3D"noreferr=
er" target=3D"_blank">nts.ntp.se:4443</a> nts=C2=A0 =C2=A0 =C2=A0 # Sweden<=
br>
&gt; &gt; &gt; +# server <a href=3D"http://ntpmon.dcs1.biz" rel=3D"noreferr=
er" target=3D"_blank">ntpmon.dcs1.biz</a> nts=C2=A0 =C2=A0 =C2=A0 # Singapo=
re<br>
&gt; &gt; &gt; +# server <a href=3D"http://ntp1.glypnod.com" rel=3D"norefer=
rer" target=3D"_blank">ntp1.glypnod.com</a> nts=C2=A0 =C2=A0 =C2=A0# San Fr=
ancisco<br>
&gt; &gt; &gt; +# server <a href=3D"http://ntp2.glypnod.com" rel=3D"norefer=
rer" target=3D"_blank">ntp2.glypnod.com</a> nts=C2=A0 =C2=A0 =C2=A0# London=
<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# ca /usr/share/ca-certificates/mozilla<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +# Allow only time queries, at a limited rate, sending KoD w=
hen in=C2=A0 <br>
&gt; &gt; excess.=C2=A0 <br>
&gt; &gt; &gt; +# Allow all local queries (IPv4, IPv6)<br>
&gt; &gt; &gt; +restrict default nomodify nopeer noquery limited kod<br>
&gt; &gt; &gt; +restrict 127.0.0.1<br>
&gt; &gt; &gt; +restrict [::1]<br>
&gt; &gt; &gt; diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/nt=
pd.service<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..b7db4a2<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/ntpd.service<br>
&gt; &gt; &gt; @@ -0,0 +1,15 @@<br>
&gt; &gt; &gt; +[Unit]<br>
&gt; &gt; &gt; +Description=3DNetwork Time Service<br>
&gt; &gt; &gt; +After=3Dnetwork.target<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +[Service]<br>
&gt; &gt; &gt; +Type=3Dforking<br>
&gt; &gt; &gt; +PIDFile=3D/run/ntpd.pid<br>
&gt; &gt; &gt; +# Turn off DNSSEC validation for hostname look-ups, since t=
hose need the<br>
&gt; &gt; &gt; +# correct time to work, but we likely won&#39;t acquire tha=
t without NTP.=C2=A0 <br>
&gt; &gt; Let&#39;s=C2=A0 <br>
&gt; &gt; &gt; +# break this chicken-and-egg cycle here.<br>
&gt; &gt; &gt; +Environment=3DSYSTEMD_NSS_RESOLVE_VALIDATE=3D0<br>
&gt; &gt; &gt; +ExecStart=3D/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntp=
d.pid=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; The @NTPD_EXTRA_ARGS@ handling needs the sed command instead of t=
he<br>
&gt; &gt; simple install one (see package/ntp/<a href=3D"http://ntp.mk" rel=
=3D"noreferrer" target=3D"_blank">ntp.mk</a>)...<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +[Install]<br>
&gt; &gt; &gt; +WantedBy=3Dmulti-user.target<br>
&gt; &gt; &gt; diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntp=
sec.hash<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..49dc4e4<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/ntpsec.hash<br>
&gt; &gt; &gt; @@ -0,0 +1,4 @@<br>
&gt; &gt; &gt; +# Locally calculated<br>
&gt; &gt; &gt; +sha256=C2=A0 <br>
&gt; &gt; 71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c67d72e89<=
br>
&gt; &gt; ntpsec-NTPsec_1_2_1.tar.bz2=C2=A0 <br>
&gt; &gt; &gt; +sha256=C2=A0 <br>
&gt; &gt; b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce4895ed91da4<=
br>
&gt; &gt; LICENSE.adoc=C2=A0 <br>
&gt; &gt; &gt; +sha256=C2=A0 <br>
&gt; &gt; d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856<=
br>
&gt; &gt; docs/copyright.adoc=C2=A0 <br>
&gt; &gt; &gt; diff --git a/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=
=3D"noreferrer" target=3D"_blank">ntpsec.mk</a> b/package/ntpsec/<a href=3D=
"http://ntpsec.mk" rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..55b4bb0<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"nor=
eferrer" target=3D"_blank">ntpsec.mk</a><br>
&gt; &gt; &gt; @@ -0,0 +1,85 @@<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; +################################################################=
################=C2=A0 <br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt; +# ntpsec<br>
&gt; &gt; &gt; +#<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; +################################################################=
################=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPSEC_VERSION_MAJOR =3D 1<br>
&gt; &gt; &gt; +NTPSEC_VERSION_MINOR =3D 2<br>
&gt; &gt; &gt; +NTPSEC_VERSION_POINT =3D 1<br>
&gt; &gt; &gt; +NTPSEC_VERSION =3D=C2=A0 <br>
&gt; &gt; $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_=
POINT)=C2=A0 <br>
&gt; &gt; &gt; +NTPSEC_SOURCE =3D ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2<b=
r>
&gt; &gt; &gt; +NTPSEC_SITE =3D=C2=A0 <br>
&gt; &gt; <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NT=
PSEC_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/NTPs=
ec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)</a>=C2=A0 <br>
&gt; &gt; &gt; +NTPSEC_LICENSE =3D BSD-2-Clause NTP BSD-3-Clause MIT<br>
&gt; &gt; &gt; +NTPSEC_LICENSE_FILES =3D LICENSE.adoc docs/copyright.adoc<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPSEC_CPE_ID_VENDOR =3D ntpsec<br>
&gt; &gt; &gt; +NTPSEC_CPE_ID_VERSION =3D $(NTPSEC_VERSION_MAJOR).$(NTPSEC_=
VERSION_MINOR)<br>
&gt; &gt; &gt; +NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPSEC_DEPENDENCIES =3D \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_PYTHON),python,pytho=
n3) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0libbsd \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pps-tools<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPSEC_PYVER =3D $(if=C2=A0 <br>
&gt; &gt; $(BR2_PACKAGE_PYTHON),python$(PYTHON_VERSION_MAJOR),python$(PYTHO=
N3_VERSION_MAJOR))=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS =3D \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0CC=3D$(HOSTCC) \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0PYTHON_CONFIG=3D&quot;$(STAGING_DIR)/us=
r/bin/$(if=C2=A0 <br>
&gt; &gt; $(BR2_PACKAGE_PYTHON),python,python3)-config&quot; \=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--cross-compiler=3D&quot;$(TARGET_CC)&q=
uot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--cross-cflags=3D&quot;$(TARGET_CFLAGS)=
 -std=3Dgnu99&quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--cross-ldflags=3D&quot;$(TARGET_LDFLAG=
S)&quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--notests \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--disable-mdns-registration \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--enable-pylib=3Dffi \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--nopyc \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--nopyo \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--nopycache \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--disable-doc \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--disable-manpage \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--refclock=3Dall \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0--libdir=3D/usr/lib/$(NTPSEC_PYVER)/sit=
e-packages/ntp<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +ifeq ($(BR2_PACKAGE_NTPSEC_CLASSIC_MODE),y)<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS +=3D --enable-classic-mode<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +ifeq ($(BR2_PACKAGE_NTPSEC_NTS),y)<br>
&gt; &gt; &gt; +NTPSEC_DEPENDENCIES +=3D openssl<br>
&gt; &gt; &gt; +else<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS +=3D --disable-nts<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +ifeq ($(BR2_PACKAGE_NTPSEC_EARLY_DROPROOT),y)<br>
&gt; &gt; &gt; +NTPSEC_DEPENDENCIES +=3D libcap<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS +=3D --enable-early-droproot<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_SMEAR),y)<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS +=3D --enable-leap-smear<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_TESTING),y)<br>
&gt; &gt; &gt; +NTPSEC_CONF_OPTS +=3D --enable-leap-testing<br>
&gt; &gt; &gt; +endif<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +define NTPSEC_INSTALL_NTPSEC_CONF<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 package/ntpsec/ntpd.e=
tc.conf=C2=A0 <br>
&gt; &gt; $(TARGET_DIR)/etc/ntp.conf=C2=A0 <br>
&gt; &gt; &gt; +endef<br>
&gt; &gt; &gt; +NTPSEC_POST_INSTALL_TARGET_HOOKS +=3D NTPSEC_INSTALL_NTPSEC=
_CONF<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +define NTPSEC_INSTALL_INIT_SYSV<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(NTPSEC_PKGDIR)/S=
49ntp=C2=A0 <br>
&gt; &gt; $(TARGET_DIR)/etc/init.d/S49ntp=C2=A0 <br>
&gt; &gt; &gt; +endef<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +define NTPSEC_INSTALL_INIT_SYSTEMD<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(NTPSEC_PKGDIR)/n=
tpd.service \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DI=
R)/usr/lib/systemd/system/ntpd.service<br>
&gt; &gt; &gt; +endef<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +define NTPSEC_USERS<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ntp -1 ntp -1 * - - - ntpd user<br>
&gt; &gt; &gt; +endef<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +$(eval $(waf-package))=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Will prepare an update of my original patch with the version upda=
te and<br>
&gt; &gt; some of<br>
&gt; &gt; your findings..., feel free to provide your improvements as add-o=
n patches<br>
&gt; &gt; ;-)<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Peter<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
<br>
</blockquote></div>

--000000000000c2f07905d352e5e7--

--===============3339650712964975635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3339650712964975635==--
