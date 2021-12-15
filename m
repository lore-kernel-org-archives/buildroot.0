Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 21:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A0EF82A5D;
	Wed, 15 Dec 2021 21:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L46ijPegE28e; Wed, 15 Dec 2021 21:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA708289B;
	Wed, 15 Dec 2021 21:22:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCDC1BF39F
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213348136E
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-_ReCjSjE-G for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 21:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B438149B
 for <buildroot@busybox.net>; Wed, 15 Dec 2021 21:21:59 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 207so35276219ljf.10
 for <buildroot@busybox.net>; Wed, 15 Dec 2021 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCi75XkszUoJqWtIEg9vqSLsY5j/btirP+Frmg7ssFU=;
 b=kVp1oe5Yg5+VpddD0EYK1GsO3LOol684FhTQIcDslxW2lSOmnE/u2z1Khj7gXKEVsQ
 1+h1aj5HxNUzKj4XVjkNzu7/9N77q8xLdldeSS4w7u9mxI3jyp7VO6y2H8kAU0WSpa9m
 fuohWVDFdCLVLQe/xR7vdtksScpimC0A5SU+XDIECg/oYCHbFJjn5qq8xnjHRzEP1jcY
 3DG1QIW5KXoylE8RlWfApkdb6dkDXGa/UkMIlBh/mDE9rGmZ125+wEnLH3iy9mAVY8Q3
 7fomdvjxnADtodElnt/5s4YHgzu/BPuyzlOU87xwyXXacrzn4wHSmImac/HP0QGlxEjo
 Go0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCi75XkszUoJqWtIEg9vqSLsY5j/btirP+Frmg7ssFU=;
 b=pRgmH4F5WCMeP1sqnVNl1ljJ8sgN8ot5eSE1AI8AAqOrhyiwxTWyGlq4JCCnvrjROh
 4dCjkq/f1+1lYg9hRcI+eqXCeQn9uHAAYKwhW8m5V+tRbkl4k7/u6ZB2Fss41Iufee5f
 4/VyrqDwckTnY7kBEd5XLcWylkYU/4zdXRGccvtoOq6LZLZweqxfOGXAuD70AChkh1iL
 oVwio+t9p7Nj+yZwSfTZtD5dAiajVAP+tg+16+3wEHf36n0ddZ9rggK/St2iiC+Vnrni
 R7NLTc84eiYjvTeujQK83x8mtJ15uYeFkT5RuE+9Ggsyn/P62NrYzvds1a5ZO3TIf2RE
 LMiA==
X-Gm-Message-State: AOAM533AEFHw2fJmlKGlbA+qQXdpQZ8HhXJa1obnOgMQ1bwXUesCem+s
 TWt1xwBKvX9b9EI/8Ex0/NlvfOga5Hh8IFwu1WY=
X-Google-Smtp-Source: ABdhPJzypfjTN68YkeSzknyBz0FiwqQK/qatvvFY34daeBpHcQMPprLcuCoHaY5BBJaCe8ibhvziJyCSTaEX4Mp0QF8=
X-Received: by 2002:a2e:a376:: with SMTP id i22mr12184014ljn.201.1639603317278; 
 Wed, 15 Dec 2021 13:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20211025212541.12280-1-ps.report@gmx.net>
 <20211212200741.18143-1-guillaume.bressaix@gmail.com>
 <20211215214312.413bff44@gmx.net>
In-Reply-To: <20211215214312.413bff44@gmx.net>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Wed, 15 Dec 2021 22:21:31 +0100
Message-ID: <CAJe0E3fU6cf-PhrPO_f0JB0QFBA106Q86o8Yhk40ExOcsnN98Q@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============2883495525962462107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2883495525962462107==
Content-Type: multipart/alternative; boundary="0000000000004c8bad05d335e502"

--0000000000004c8bad05d335e502
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

> Will prepare an update of my original patch with the version update and
some of
> your findings..., feel free to provide your improvements as add-on
patches ;-)
sounds good, i'll wait for your v2 and will test it on my side

> Better done as an extra patch (easier to review)....
ok let's do that later

>  libbsd is required
>> Are you sure?
>> With the original patch ntpsec builds fine without libbsd available...
it's listed in the dependencies for this pkg in debian.
Ran a quick grep in their sources, it's clearly in their CI basic
requirements too, but I cant figure where they actually use it. They
clearly pass -lbsd to the linker though.

>Would prefer one option per refclock to reduce dependencies...
I tried to do so at first, but am failing at correctly concatenating the
refclocks in a comma separated string.
Expected format is "refclocks=3Dgpsd,nmea,shm"
Order does not matter. It is very important to only have valid refclocks in
the submitted string otherwise configure fails. refclocks=3D",nmea,shm" and
refclocks=3D"shm," would fail.

>Would prefer one option per refclock to reduce dependencies...
Actually there are no dependencies related to refclocks, it's up to the
user to provide a correct kernel config for specific hardware though. Only
"gpsd" will have unmet requirements at the moment and would get dropped out
by configure (smart detection). If you can provide a proper interface to
concatenate the string, that would be useful (I'm not a good at shell
scripting). If we do so, I would recommend we stick to the list of actively
maintained refclocks (URL in my reply to v1)


Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mer. 15 d=C3=A9c. 2021 =C3=A0 21:43, Peter Seiderer <ps.report@gmx.net> =
a =C3=A9crit :

> Hello Guillaume,
>
> thanks of interest, testing and improvement of the ntpsec patch, some
> comments below...
>
> On Sun, 12 Dec 2021 21:07:41 +0100, guillaume.bressaix@gmail.com wrote:
>
> > From: Peter Seiderer <ps.report@gmx.net>
> >
> > - set 'CC=3Dgcc' to avoid cross-compile failure (see [1]):
> >
> >   /bin/sh: line 1: .../build/ntpsec-1_2_0/build/host/ntpd/keyword-gen:
> cannot execute binary file: Exec format error
> >
> >   Waf: Leaving directory `.../build/ntpsec-1_2_0/build/host'
> >   Build failed
> >    -> task in 'ntp_keyword.h' failed with exit status 126 (run with -v
> to display more information)
> >
> > - set '-std=3Dgnu99"' to avoid compile failure with old compilers
> >
> > - explicit set PYTHON_CONFIG
> >
> > - add patch
> 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch to
> >   fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related compile failure
> >
> > - add SYSV init file (S49ntp)
> >
> > - add example ntpd.conf (with legacy option enabled and provide skeleto=
n
> >   for NTS configuration)
> >
> > - add config option for NTS support
> >
> > - depend on python3 (omit python2 to reduce test effort)
> >
> > - add ntp user/group and run ntpd as restricted user
> >
> > - add libcap dependency (compile time optional but needed for droproot
> >   support)
> >
> > - submit latest ntpsec version 1.2.1
>
> Interesting, not listed as release, but tagged and downloadable...
>
> >
> > - lib ntpc import in python is fixed by specifying the --libdir flag.
> >   -> removed the symlink trick
>
> Fine..., will test it...
>
> >
> > - add --refclock=3Dall flags to configure, see notes down below
> >
> > - add leap second management options & ntpviz
> >
> > - improved Config.in:
> >   libbsd is required
>
> Are you sure? With the original patch ntpsec builds fine without libbsd
> available...
>
> >   openssl is only needed when NTS encryption is enabled
>
> A build without NTS and without openssl gives:
>
>         Checking for OpenSSL/libcrypto (via pkg-config)                 :
> not found
>         Checking for OpenSSL's crypto library                           :
> not found
>         The configuration failed
>
> >   (depend on python3 only to simply things)
> >   improved classic mode help description
> >   improved early-drop-root feature description
> >
> > - early droproot should be an option: adapt libcap accordingly
>
> This will break (the hard coded) '-u npt:npt' option from
> package/ntpsec/S49ntp,
> any reason to avoid the security feature?
>
> >
> > - corrected CC=3Dgcc to CC=3D$(HOSTCC) in ntpsec.mk
>
> Good point...
>
> >
> > - provide service script for systemd infra along sysv infra
>
> Better done as an extra patch (easier to review)....
>
> >
> > - I don't think we need the patch if we restrict to !BR2_TOOLCHAIN_UCLI=
BC
> >   IMO it's better to keep the patch and allow all toolchains.
> >   I usually have glibc, but I just ran a sanity check on my zedboard
> with uclibc,
> >   it passed.
>
> Not important for the commit log...
>
> >
> > - used on zynq_zed_defconfig and beaglebone_defconfig
> >   daemon automatically started
> >   ntpq works fine
> >
> > [1] https://gitlab.com/NTPsec/ntpsec/-/issues/694
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> >
> > ---
> > notes on refclocks: https://docs.ntpsec.org/latest/refclock.html
> >   "For security reasons, we will no longer support any refclock
> >   that requires a closed-source driver to run", see webpage.
> >
> >   --refclock=3Dall is hardcoded at the moment
> >
> >   One must compile ntpsec with the 'refclock' option
> >   if they want to drive or interact with hardware.
> >
> >   In any case, refclocks are not critical for both buildtime & runtime:
> >
> >      [+] ./configure is smart enough to disable a refclock
> >      if requirements are not met. In the submitted context,
> >      this happens for refclock=3Dgpsd without BR2_PACKAGE_GPSD
> >      selected by user
> >
> >      [+] some refclocks naturally require a specific hw support
> >      with related kernel driver.
> >      This is not buildtime critical because build does not care
> >      about hw support.
> >      This is not runtime critical either because any missing
> >      hw support or unfeasible hardware access ends up as a logged
> >      error message. It is up to the user to correct it in the
> >      submitted context: example: 'nmea/gps' receivers without kernel
> support
> >      or hardware not plugged in.
>
> Would prefer one option per refclock to reduce dependencies...
>
> >
> > ntpd / ntpsec should be mutualy exclusive if we harcode S49ntp as the
> service script
> >
> > ---
> >  DEVELOPERS                                         |  1 +
> >  package/Config.in                                  |  1 +
> >  ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 61 ++++++++++++++=
++
> >  package/ntpsec/Config.in                           | 68
> +++++++++++++++++
> >  package/ntpsec/S49ntp                              | 58 ++++++++++++++=
+
> >  package/ntpsec/ntpd.etc.conf                       | 33 +++++++++
> >  package/ntpsec/ntpd.service                        | 15 ++++
> >  package/ntpsec/ntpsec.hash                         |  4 +
> >  package/ntpsec/ntpsec.mk                           | 85
> ++++++++++++++++++++++
> >  9 files changed, 326 insertions(+)
> >  create mode 100644
> package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.=
patch
> >  create mode 100644 package/ntpsec/Config.in
> >  create mode 100644 package/ntpsec/S49ntp
> >  create mode 100644 package/ntpsec/ntpd.etc.conf
> >  create mode 100644 package/ntpsec/ntpd.service
> >  create mode 100644 package/ntpsec/ntpsec.hash
> >  create mode 100644 package/ntpsec/ntpsec.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 3023526..32b5e87 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2196,6 +2196,7 @@ F:      package/iwd/
> >  F:   package/libevdev/
> >  F:   package/libuev/
> >  F:   package/log4cplus/
> > +F:   package/ntpsec/
> >  F:   package/postgresql/
> >  F:   package/python-colorzero/
> >  F:   package/python-flask-wtf/
> > diff --git a/package/Config.in b/package/Config.in
> > index 5720830..544a0fd 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2271,6 +2271,7 @@ endif
> >       source "package/nmap/Config.in"
> >       source "package/noip/Config.in"
> >       source "package/ntp/Config.in"
> > +     source "package/ntpsec/Config.in"
> >       source "package/nuttcp/Config.in"
> >       source "package/odhcp6c/Config.in"
> >       source "package/odhcploc/Config.in"
> > diff --git
> a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
> b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
> > new file mode 100644
> > index 0000000..c2838fe
> > --- /dev/null
> > +++
> b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile=
-.patch
> > @@ -0,0 +1,61 @@
> > +From 4015a1183d2f79dad6dd675ca5e0d329825f3fa3 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Mon, 4 Oct 2021 22:25:58 +0200
> > +Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 related compile
> failure
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Use same define guard for definiton as for usage
> ('HAVE_STRUCT_NTPTIMEVAL_TAI'
> > +instead of 'NTP_API && NTP_API > 3').
> > +
> > +Fixes:
> > +
> > +  ../../ntptime/ntptime.c: In function =E2=80=98main=E2=80=99:
> > +  ../../ntptime/ntptime.c:349:17: error: =E2=80=98jfmt5=E2=80=99 undec=
lared (first use
> in this function); did you mean =E2=80=98jfmt6=E2=80=99?
> > +    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
> > +        |                 ^~~~~
> > +        |                 jfmt6
> > +  ../../ntptime/ntptime.c:349:17: note: each undeclared identifier is
> reported only once for each function it appears in
> > +  ../../ntptime/ntptime.c:349:25: error: =E2=80=98ofmt5=E2=80=99 undec=
lared (first use
> in this function); did you mean =E2=80=98ofmt6=E2=80=99?
> > +    349 |   printf(json ? jfmt5 : ofmt5, (long)ntv.tai);
> > +        |                         ^~~~~
> > +        |                         ofmt6
> > +  ../../ntptime/ntptime.c:321:15: warning: unused variable =E2=80=98jf=
mt6=E2=80=99
> [-Wunused-variable]
> > +    321 |   const char *jfmt6 =3D "";
> > +        |               ^~~~~
> > +  ../../ntptime/ntptime.c:311:15: warning: unused variable =E2=80=98of=
mt6=E2=80=99
> [-Wunused-variable]
> > +    311 |   const char *ofmt6 =3D "\n";
> > +        |               ^~~~~
> > +
> > +[Upstream: https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1245]
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + ntptime/ntptime.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c
> > +index ff861cb..5d58593 100644
> > +--- a/ntptime/ntptime.c
> > ++++ b/ntptime/ntptime.c
> > +@@ -305,7 +305,7 @@ main(
> > +             const char *ofmt2 =3D "  time %s, (.%0*d),\n";
> > +             const char *ofmt3 =3D "  maximum error %lu us, estimated
> error %lu us";
> > +             const char *ofmt4 =3D "  ntptime=3D%x.%x unixtime=3D%x.%0=
*d %s";
> > +-#if defined NTP_API && NTP_API > 3
> > ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
> > +             const char *ofmt5 =3D ", TAI offset %ld\n";
> > + #else
> > +             const char *ofmt6 =3D "\n";
> > +@@ -315,7 +315,7 @@ main(
> > +             const char *jfmt2 =3D
> "\"time\":\"%s\",\"fractional-time\":\".%0*d\",";
> > +             const char *jfmt3 =3D
> "\"maximum-error\":%lu,\"estimated-error\":%lu,";
> > +             const char *jfmt4 =3D
> "\"raw-ntp-time\":\"%x.%x\",\"raw-unix-time\":\"%x.%0*d %s\",";
> > +-#if defined NTP_API && NTP_API > 3
> > ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)
> > +             const char *jfmt5 =3D "\"TAI-offset\":%d,";
> > + #else
> > +             const char *jfmt6 =3D "";
> > +--
> > +2.33.0
> > +
> > diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in
> > new file mode 100644
> > index 0000000..9044aa4
> > --- /dev/null
> > +++ b/package/ntpsec/Config.in
> > @@ -0,0 +1,68 @@
> > +comment "ntpsec needs a toolchain w/ wchar, thread, dynamic library"
> > +     depends on BR2_STATIC_LIBS
> > +     depends on !BR2_USE_WCHAR
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS # libbsd
> > +
> > +comment "ntpsec needs libbsd"
> > +     depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +     depends on !BR2_STATIC_LIBS # libbsd
> > +
> > +comment "ntpsec needs python3"
> > +     depends on !BR2_PACKAGE_PYTHON3
> > +
> > +config BR2_PACKAGE_NTPSEC
> > +     bool "ntpsec"
> > +     depends on !BR2_STATIC_LIBS # libbsd
> > +     depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
> > +     depends on BR2_PACKAGE_PYTHON3
> > +     select BR2_PACKAGE_LIBCAP
> > +     select BR2_PACKAGE_LIBBSD
> > +     select BR2_PACKAGE_PPS_TOOLS # refclock(pps)
> > +     help
> > +       NTPsec is a secure, hardened, and improved
> > +       implementation of Network Time Protocol derived
> > +       from NTP Classic, Dave Mills=E2=80=99s original.
> > +
> > +       Provides things like ntpd, ntpdate, ntpq, etc...
> > +
> > +       https://www.ntpsec.org/
> > +
> > +if BR2_PACKAGE_NTPSEC
> > +
> > +config BR2_PACKAGE_NTPSEC_CLASSIC_MODE
> > +     bool "ntpsec-classic"
> > +     help
> > +       Enable strict configuration and log-format compatibility
> > +       with NTP Classic.
> > +       This option is not recommended as it makes the module
> > +       less efficient.
> > +
> > +config BR2_PACKAGE_NTPSEC_NTS
> > +     bool "ntpsec-nts"
> > +     select BR2_PACKAGE_OPENSSL
> > +     help
> > +       Enable Network Time Security (NTS) support.
> > +
> > +comment "ntpsec-ntploggpsd needs gpsd"
> > +     depends on !BR2_PACKAGE_GPSD
> > +
> > +config BR2_PACKAGE_NTPSEC_LEAP_SMEAR
> > +     bool "ntpsec-leap-smear"
> > +     help
> > +       Activates leap second smearing,
> > +       https://docs.ntpsec.org/latest/leapsmear.html
> > +
> > +config BR2_PACKAGE_NTPSEC_LEAP_TESTING
> > +     bool "ntpsec-leap-testing"
> > +     help
> > +       Enables leap seconds on other than 1st day of month
> > +
> > +config BR2_PACKAGE_NTPSEC_EARLY_DROPROOT
> > +     bool "ntpsec-early-droproot"
> > +     help
> > +       Drops root privileges as early as possible.
> > +       This requires the refclock devices to be owned
> > +       by owner/group running 'ntpd'
> > +
> > +endif
> > diff --git a/package/ntpsec/S49ntp b/package/ntpsec/S49ntp
> > new file mode 100644
> > index 0000000..f3db514
> > --- /dev/null
> > +++ b/package/ntpsec/S49ntp
> > @@ -0,0 +1,58 @@
> > +#!/bin/sh
> > +#
> > +# Starts Network Time Protocol daemon
> > +#
> > +
> > +DAEMON=3D"ntpd"
> > +PIDFILE=3D"/var/run/$DAEMON.pid"
> > +
> > +NTPD_ARGS=3D"-g -u ntp:ntp -s /var/run/ntp"
> > +
> > +# shellcheck source=3D/dev/null
> > +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> > +
> > +mkdir -p /var/run/ntp && chown ntp:ntp /var/run/ntp
> > +
> > +start() {
> > +     printf 'Starting %s: ' "$DAEMON"
> > +     # shellcheck disable=3DSC2086 # we need the word splitting
> > +     start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> > +             -- $NTPD_ARGS -p "$PIDFILE"
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +     return "$status"
> > +}
> > +
> > +stop() {
> > +     printf 'Stopping %s: ' "$DAEMON"
> > +     start-stop-daemon -K -q -p "$PIDFILE"
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             rm -f "$PIDFILE"
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +     return "$status"
> > +}
> > +
> > +restart() {
> > +     stop
> > +     sleep 1
> > +     start
> > +}
> > +
> > +case "$1" in
> > +     start|stop|restart)
> > +             "$1";;
> > +     reload)
> > +             # Restart, since there is no true "reload" feature.
> > +             restart;;
> > +     *)
> > +             echo "Usage: $0 {start|stop|restart|reload}"
> > +             exit 1
> > +esac
> > diff --git a/package/ntpsec/ntpd.etc.conf b/package/ntpsec/ntpd.etc.con=
f
> > new file mode 100644
> > index 0000000..e0f45c1
> > --- /dev/null
> > +++ b/package/ntpsec/ntpd.etc.conf
> > @@ -0,0 +1,33 @@
> > +#
> > +# legacy NTP configuration
> > +#
> > +pool 0.pool.ntp.org iburst
> > +pool 1.pool.ntp.org iburst
> > +pool 2.pool.ntp.org iburst
> > +pool 3.pool.ntp.org iburst
> > +
> > +#
> > +# NTS configuration
> > +#
> > +# Notes:
> > +#  - uncomment the following lines to enable NTS support (but
> > +#    make sure the initial clock is up-to-date (otherwise the
> > +#    NTS certificate validation will fail with 'NTSc: certificate
> invalid:
> > +#    9=3D>certificate is not yet valid' as on boards without RTC suppo=
rt)
> > +#    and/or keep at least one line from the legacy NTP lines
> > +#  - enable BR2_PACKAGE_CA_CERTIFICATES to gain access to the
> certificate
> > +#    files
> > +#
> > +# server time.cloudflare.com nts  # Global, anycast
> > +# server nts.ntp.se:4443 nts      # Sweden
> > +# server ntpmon.dcs1.biz nts      # Singapore
> > +# server ntp1.glypnod.com nts     # San Francisco
> > +# server ntp2.glypnod.com nts     # London
> > +#
> > +# ca /usr/share/ca-certificates/mozilla
> > +
> > +# Allow only time queries, at a limited rate, sending KoD when in
> excess.
> > +# Allow all local queries (IPv4, IPv6)
> > +restrict default nomodify nopeer noquery limited kod
> > +restrict 127.0.0.1
> > +restrict [::1]
> > diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/ntpd.service
> > new file mode 100644
> > index 0000000..b7db4a2
> > --- /dev/null
> > +++ b/package/ntpsec/ntpd.service
> > @@ -0,0 +1,15 @@
> > +[Unit]
> > +Description=3DNetwork Time Service
> > +After=3Dnetwork.target
> > +
> > +[Service]
> > +Type=3Dforking
> > +PIDFile=3D/run/ntpd.pid
> > +# Turn off DNSSEC validation for hostname look-ups, since those need t=
he
> > +# correct time to work, but we likely won't acquire that without NTP.
> Let's
> > +# break this chicken-and-egg cycle here.
> > +Environment=3DSYSTEMD_NSS_RESOLVE_VALIDATE=3D0
> > +ExecStart=3D/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntpd.pid
>
> The @NTPD_EXTRA_ARGS@ handling needs the sed command instead of the
> simple install one (see package/ntp/ntp.mk)...
>
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
> > new file mode 100644
> > index 0000000..49dc4e4
> > --- /dev/null
> > +++ b/package/ntpsec/ntpsec.hash
> > @@ -0,0 +1,4 @@
> > +# Locally calculated
> > +sha256
> 71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c67d72e89
> ntpsec-NTPsec_1_2_1.tar.bz2
> > +sha256
> b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce4895ed91da4
> LICENSE.adoc
> > +sha256
> d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856
> docs/copyright.adoc
> > diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> > new file mode 100644
> > index 0000000..55b4bb0
> > --- /dev/null
> > +++ b/package/ntpsec/ntpsec.mk
> > @@ -0,0 +1,85 @@
> >
> +########################################################################=
########
> > +#
> > +# ntpsec
> > +#
> >
> +########################################################################=
########
> > +
> > +NTPSEC_VERSION_MAJOR =3D 1
> > +NTPSEC_VERSION_MINOR =3D 2
> > +NTPSEC_VERSION_POINT =3D 1
> > +NTPSEC_VERSION =3D
> $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(NTPSEC_VERSION_POINT)
> > +NTPSEC_SOURCE =3D ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2
> > +NTPSEC_SITE =3D
> https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)
> > +NTPSEC_LICENSE =3D BSD-2-Clause NTP BSD-3-Clause MIT
> > +NTPSEC_LICENSE_FILES =3D LICENSE.adoc docs/copyright.adoc
> > +
> > +NTPSEC_CPE_ID_VENDOR =3D ntpsec
> > +NTPSEC_CPE_ID_VERSION =3D $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MIN=
OR)
> > +NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)
> > +
> > +NTPSEC_DEPENDENCIES =3D \
> > +     $(if $(BR2_PACKAGE_PYTHON),python,python3) \
> > +     libbsd \
> > +     pps-tools
> > +
> > +NTPSEC_PYVER =3D $(if
> $(BR2_PACKAGE_PYTHON),python$(PYTHON_VERSION_MAJOR),python$(PYTHON3_VERSI=
ON_MAJOR))
> > +
> > +NTPSEC_CONF_OPTS =3D \
> > +     CC=3D$(HOSTCC) \
> > +     PYTHON_CONFIG=3D"$(STAGING_DIR)/usr/bin/$(if
> $(BR2_PACKAGE_PYTHON),python,python3)-config" \
> > +     --cross-compiler=3D"$(TARGET_CC)" \
> > +     --cross-cflags=3D"$(TARGET_CFLAGS) -std=3Dgnu99" \
> > +     --cross-ldflags=3D"$(TARGET_LDFLAGS)" \
> > +     --notests \
> > +     --disable-mdns-registration \
> > +     --enable-pylib=3Dffi \
> > +     --nopyc \
> > +     --nopyo \
> > +     --nopycache \
> > +     --disable-doc \
> > +     --disable-manpage \
> > +     --refclock=3Dall \
> > +     --libdir=3D/usr/lib/$(NTPSEC_PYVER)/site-packages/ntp
> > +
> > +ifeq ($(BR2_PACKAGE_NTPSEC_CLASSIC_MODE),y)
> > +NTPSEC_CONF_OPTS +=3D --enable-classic-mode
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTPSEC_NTS),y)
> > +NTPSEC_DEPENDENCIES +=3D openssl
> > +else
> > +NTPSEC_CONF_OPTS +=3D --disable-nts
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTPSEC_EARLY_DROPROOT),y)
> > +NTPSEC_DEPENDENCIES +=3D libcap
> > +NTPSEC_CONF_OPTS +=3D --enable-early-droproot
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_SMEAR),y)
> > +NTPSEC_CONF_OPTS +=3D --enable-leap-smear
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_TESTING),y)
> > +NTPSEC_CONF_OPTS +=3D --enable-leap-testing
> > +endif
> > +
> > +define NTPSEC_INSTALL_NTPSEC_CONF
> > +     $(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf
> $(TARGET_DIR)/etc/ntp.conf
> > +endef
> > +NTPSEC_POST_INSTALL_TARGET_HOOKS +=3D NTPSEC_INSTALL_NTPSEC_CONF
> > +
> > +define NTPSEC_INSTALL_INIT_SYSV
> > +     $(INSTALL) -D -m 755 $(NTPSEC_PKGDIR)/S49ntp
> $(TARGET_DIR)/etc/init.d/S49ntp
> > +endef
> > +
> > +define NTPSEC_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 644 $(NTPSEC_PKGDIR)/ntpd.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
> > +endef
> > +
> > +define NTPSEC_USERS
> > +     ntp -1 ntp -1 * - - - ntpd user
> > +endef
> > +
> > +$(eval $(waf-package))
>
> Will prepare an update of my original patch with the version update and
> some of
> your findings..., feel free to provide your improvements as add-on patche=
s
> ;-)
>
> Regards,
> Peter
>
>

--0000000000004c8bad05d335e502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Peter,<br><br>&gt; Will prepare an update of my orig=
inal patch with the version update and some of<br>&gt; your findings..., fe=
el free to provide your improvements as add-on patches ;-)<br>sounds good, =
i&#39;ll wait for your v2 and will test it on my side<br><br>&gt; Better do=
ne as an extra patch (easier to review)....<span class=3D"gmail-im" style=
=3D"color:rgb(80,0,80)"><br></span>ok let&#39;s do that later<br><span styl=
e=3D"color:rgb(80,0,80)"><br></span><div><span style=3D"color:rgb(80,0,80)"=
>&gt;=C2=A0 libbsd is required</span><br>&gt;&gt; Are you sure? <br>&gt;&gt=
; With the original patch ntpsec builds fine without libbsd available...<br=
>it&#39;s listed in the dependencies for this pkg in debian. <br>Ran a quic=
k grep in their sources, it&#39;s clearly in their CI basic requirements to=
o, but I cant=C2=A0figure where they actually use it. They clearly pass -lb=
sd to the linker though.=C2=A0<br><br>&gt;Would prefer one option per refcl=
ock to reduce dependencies...<br>I tried to do so at first, but am failing =
at correctly concatenating the refclocks=C2=A0in a comma separated string.<=
br>Expected format is &quot;refclocks=3Dgpsd,nmea,shm&quot;<br>Order does n=
ot matter. It is very important to only have valid refclocks=C2=A0in the su=
bmitted string otherwise configure fails. refclocks=3D&quot;,nmea,shm&quot;=
 and refclocks=3D&quot;shm,&quot; would fail.</div><div><br>&gt;Would prefe=
r one option per refclock to reduce dependencies...</div><div>Actually ther=
e are no dependencies related to refclocks, it&#39;s up to the user to prov=
ide a correct kernel config for specific hardware though. Only &quot;gpsd&q=
uot; will have unmet requirements at the moment and would get dropped out b=
y configure (smart detection). If you can provide a proper interface to con=
catenate the string, that would be useful (I&#39;m not a good=C2=A0at=C2=A0=
shell scripting). If we do so, I would recommend we stick to the list of ac=
tively maintained refclocks=C2=A0(URL in my reply to v1)<br><br><br clear=
=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaum=
e W. Bres<br></font></div><font face=3D"arial,helvetica,sans-serif">Softwar=
e engineer</font><br></div><font face=3D"arial,helvetica,sans-serif"></font=
></div><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guil=
laume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a=
>&gt;<br></font></div></div></div></div></div></div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. =
15 d=C3=A9c. 2021 =C3=A0=C2=A021:43, Peter Seiderer &lt;<a href=3D"mailto:p=
s.report@gmx.net">ps.report@gmx.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hello Guillaume,<br>
<br>
thanks of interest, testing and improvement of the ntpsec patch, some comme=
nts below...<br>
<br>
On Sun, 12 Dec 2021 21:07:41 +0100, <a href=3D"mailto:guillaume.bressaix@gm=
ail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a> wrote:<br>
<br>
&gt; From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" target=
=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; <br>
&gt; - set &#39;CC=3Dgcc&#39; to avoid cross-compile failure (see [1]):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0/bin/sh: line 1: .../build/ntpsec-1_2_0/build/host/ntpd/ke=
yword-gen: cannot execute binary file: Exec format error<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Waf: Leaving directory `.../build/ntpsec-1_2_0/build/host&=
#39;<br>
&gt;=C2=A0 =C2=A0Build failed<br>
&gt;=C2=A0 =C2=A0 -&gt; task in &#39;ntp_keyword.h&#39; failed with exit st=
atus 126 (run with -v to display more information)=C2=A0 <br>
&gt; <br>
&gt; - set &#39;-std=3Dgnu99&quot;&#39; to avoid compile failure with old c=
ompilers<br>
&gt; <br>
&gt; - explicit set PYTHON_CONFIG<br>
&gt; <br>
&gt; - add patch 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.p=
atch to<br>
&gt;=C2=A0 =C2=A0fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related compile failur=
e<br>
&gt; <br>
&gt; - add SYSV init file (S49ntp)<br>
&gt; <br>
&gt; - add example ntpd.conf (with legacy option enabled and provide skelet=
on<br>
&gt;=C2=A0 =C2=A0for NTS configuration)<br>
&gt; <br>
&gt; - add config option for NTS support<br>
&gt; <br>
&gt; - depend on python3 (omit python2 to reduce test effort)<br>
&gt; <br>
&gt; - add ntp user/group and run ntpd as restricted user<br>
&gt; <br>
&gt; - add libcap dependency (compile time optional but needed for droproot=
<br>
&gt;=C2=A0 =C2=A0support)<br>
&gt; <br>
&gt; - submit latest ntpsec version 1.2.1<br>
<br>
Interesting, not listed as release, but tagged and downloadable...<br>
<br>
&gt; <br>
&gt; - lib ntpc import in python is fixed by specifying the --libdir flag.<=
br>
&gt;=C2=A0 =C2=A0-&gt; removed the symlink trick=C2=A0 <br>
<br>
Fine..., will test it...<br>
<br>
&gt; <br>
&gt; - add --refclock=3Dall flags to configure, see notes down below<br>
&gt; <br>
&gt; - add leap second management options &amp; ntpviz<br>
&gt; <br>
&gt; - improved Config.in:<br>
&gt;=C2=A0 =C2=A0libbsd is required<br>
<br>
Are you sure? With the original patch ntpsec builds fine without libbsd ava=
ilable...<br>
<br>
&gt;=C2=A0 =C2=A0openssl is only needed when NTS encryption is enabled<br>
<br>
A build without NTS and without openssl gives:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Checking for OpenSSL/libcrypto (via pkg-config)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: not found <=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Checking for OpenSSL&#39;s crypto library=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0: not found <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The configuration failed<br>
<br>
&gt;=C2=A0 =C2=A0(depend on python3 only to simply things)<br>
&gt;=C2=A0 =C2=A0improved classic mode help description<br>
&gt;=C2=A0 =C2=A0improved early-drop-root feature description<br>
&gt; <br>
&gt; - early droproot should be an option: adapt libcap accordingly<br>
<br>
This will break (the hard coded) &#39;-u npt:npt&#39; option from package/n=
tpsec/S49ntp,<br>
any reason to avoid the security feature?<br>
<br>
&gt; <br>
&gt; - corrected CC=3Dgcc to CC=3D$(HOSTCC) in <a href=3D"http://ntpsec.mk"=
 rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
<br>
Good point...<br>
<br>
&gt; <br>
&gt; - provide service script for systemd infra along sysv infra<br>
<br>
Better done as an extra patch (easier to review)....<br>
<br>
&gt; <br>
&gt; - I don&#39;t think we need the patch if we restrict to !BR2_TOOLCHAIN=
_UCLIBC<br>
&gt;=C2=A0 =C2=A0IMO it&#39;s better to keep the patch and allow all toolch=
ains.<br>
&gt;=C2=A0 =C2=A0I usually have glibc, but I just ran a sanity check on my =
zedboard with uclibc,<br>
&gt;=C2=A0 =C2=A0it passed.<br>
<br>
Not important for the commit log...<br>
<br>
&gt; <br>
&gt; - used on zynq_zed_defconfig and beaglebone_defconfig<br>
&gt;=C2=A0 =C2=A0daemon automatically started<br>
&gt;=C2=A0 =C2=A0ntpq works fine<br>
&gt; <br>
&gt; [1] <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/issues/694" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/NTPsec/ntpsec/-/issues/694<=
/a><br>
&gt; <br>
&gt; Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net"=
 target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; notes on refclocks: <a href=3D"https://docs.ntpsec.org/latest/refclock=
.html" rel=3D"noreferrer" target=3D"_blank">https://docs.ntpsec.org/latest/=
refclock.html</a><br>
&gt;=C2=A0 =C2=A0&quot;For security reasons, we will no longer support any =
refclock<br>
&gt;=C2=A0 =C2=A0that requires a closed-source driver to run&quot;, see web=
page.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0--refclock=3Dall is hardcoded at the moment<br>
&gt; <br>
&gt;=C2=A0 =C2=A0One must compile ntpsec with the &#39;refclock&#39; option=
<br>
&gt;=C2=A0 =C2=A0if they want to drive or interact with hardware.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0In any case, refclocks are not critical for both buildtime=
 &amp; runtime:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 [+] ./configure is smart enough to disable a refcl=
ock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if requirements are not met. In the submitted cont=
ext,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 this happens for refclock=3Dgpsd without BR2_PACKA=
GE_GPSD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 selected by user<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 [+] some refclocks naturally require a specific hw=
 support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with related kernel driver.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 This is not buildtime critical because build does =
not care<br>
&gt;=C2=A0 =C2=A0 =C2=A0 about hw support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 This is not runtime critical either because any mi=
ssing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hw support or unfeasible hardware access ends up a=
s a logged<br>
&gt;=C2=A0 =C2=A0 =C2=A0 error message. It is up to the user to correct it =
in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 submitted context: example: &#39;nmea/gps&#39; rec=
eivers without kernel support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 or hardware not plugged in.<br>
<br>
Would prefer one option per refclock to reduce dependencies...<br>
<br>
&gt; <br>
&gt; ntpd / ntpsec should be mutualy exclusive if we harcode S49ntp as the =
service script<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 ...-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch | 61 ++++++++=
++++++++<br>
&gt;=C2=A0 package/ntpsec/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 68 +++++++++++=
++++++<br>
&gt;=C2=A0 package/ntpsec/S49ntp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 58 +++++++=
++++++++<br>
&gt;=C2=A0 package/ntpsec/ntpd.etc.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++++++<br>
&gt;=C2=A0 package/ntpsec/ntpd.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++<br>
&gt;=C2=A0 package/ntpsec/ntpsec.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +<br>
&gt;=C2=A0 package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"noreferrer" t=
arget=3D"_blank">ntpsec.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 85 ++++++++++++++++++=
++++<br>
&gt;=C2=A0 9 files changed, 326 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-j=
fmt6-ofmt6-related-compile-.patch<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/Config.in<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/S49ntp<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/ntpd.etc.conf<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/ntpd.service<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/ntpsec.hash<br>
&gt;=C2=A0 create mode 100644 package/ntpsec/<a href=3D"http://ntpsec.mk" r=
el=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index 3023526..32b5e87 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -2196,6 +2196,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/iwd/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/libevdev/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/libuev/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/log4cplus/<br>
&gt; +F:=C2=A0 =C2=A0package/ntpsec/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/postgresql/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/python-colorzero/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/python-flask-wtf/<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index 5720830..544a0fd 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -2271,6 +2271,7 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/nmap/Config.in&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/noip/Config.in&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ntp/Config.in&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/ntpsec/Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/nuttcp/Config.in&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/odhcp6c/Config.in&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/odhcploc/Config.in&quot=
;<br>
&gt; diff --git a/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-r=
elated-compile-.patch b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-o=
fmt6-related-compile-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c2838fe<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-=
compile-.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From 4015a1183d2f79dad6dd675ca5e0d329825f3fa3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" target=
=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; +Date: Mon, 4 Oct 2021 22:25:58 +0200<br>
&gt; +Subject: [PATCH] ntptime: fix jfmt5/ofmt5 jfmt6/ofmt6 related compile=
 failure<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Use same define guard for definiton as for usage (&#39;HAVE_STRUCT_NT=
PTIMEVAL_TAI&#39;<br>
&gt; +instead of &#39;NTP_API &amp;&amp; NTP_API &gt; 3&#39;).<br>
&gt; +<br>
&gt; +Fixes:<br>
&gt; +<br>
&gt; +=C2=A0 ../../ntptime/ntptime.c: In function =E2=80=98main=E2=80=99:<b=
r>
&gt; +=C2=A0 ../../ntptime/ntptime.c:349:17: error: =E2=80=98jfmt5=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98jfmt6=E2=80=
=99?<br>
&gt; +=C2=A0 =C2=A0 349 |=C2=A0 =C2=A0printf(json ? jfmt5 : ofmt5, (long)nt=
v.tai);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0jfmt6<br>
&gt; +=C2=A0 ../../ntptime/ntptime.c:349:17: note: each undeclared identifi=
er is reported only once for each function it appears in<br>
&gt; +=C2=A0 ../../ntptime/ntptime.c:349:25: error: =E2=80=98ofmt5=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98ofmt6=E2=80=
=99?<br>
&gt; +=C2=A0 =C2=A0 349 |=C2=A0 =C2=A0printf(json ? jfmt5 : ofmt5, (long)nt=
v.tai);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ofmt6<br>
&gt; +=C2=A0 ../../ntptime/ntptime.c:321:15: warning: unused variable =E2=
=80=98jfmt6=E2=80=99 [-Wunused-variable]<br>
&gt; +=C2=A0 =C2=A0 321 |=C2=A0 =C2=A0const char *jfmt6 =3D &quot;&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; +=C2=A0 ../../ntptime/ntptime.c:311:15: warning: unused variable =E2=
=80=98ofmt6=E2=80=99 [-Wunused-variable]<br>
&gt; +=C2=A0 =C2=A0 311 |=C2=A0 =C2=A0const char *ofmt6 =3D &quot;\n&quot;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~<br>
&gt; +<br>
&gt; +[Upstream: <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/merge_reques=
ts/1245" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/NTPsec/ntp=
sec/-/merge_requests/1245</a>]<br>
&gt; +Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net=
" target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; +---<br>
&gt; + ntptime/ntptime.c | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/ntptime/ntptime.c b/ntptime/ntptime.c<br>
&gt; +index ff861cb..5d58593 100644<br>
&gt; +--- a/ntptime/ntptime.c<br>
&gt; ++++ b/ntptime/ntptime.c<br>
&gt; +@@ -305,7 +305,7 @@ main(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ofmt2 =3D=
 &quot;=C2=A0 time %s, (.%0*d),\n&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ofmt3 =3D=
 &quot;=C2=A0 maximum error %lu us, estimated error %lu us&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ofmt4 =3D=
 &quot;=C2=A0 ntptime=3D%x.%x unixtime=3D%x.%0*d %s&quot;;<br>
&gt; +-#if defined NTP_API &amp;&amp; NTP_API &gt; 3<br>
&gt; ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ofmt5 =3D=
 &quot;, TAI offset %ld\n&quot;;<br>
&gt; + #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ofmt6 =3D=
 &quot;\n&quot;;<br>
&gt; +@@ -315,7 +315,7 @@ main(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *jfmt2 =3D=
 &quot;\&quot;time\&quot;:\&quot;%s\&quot;,\&quot;fractional-time\&quot;:\&=
quot;.%0*d\&quot;,&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *jfmt3 =3D=
 &quot;\&quot;maximum-error\&quot;:%lu,\&quot;estimated-error\&quot;:%lu,&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *jfmt4 =3D=
 &quot;\&quot;raw-ntp-time\&quot;:\&quot;%x.%x\&quot;,\&quot;raw-unix-time\=
&quot;:\&quot;%x.%0*d %s\&quot;,&quot;;<br>
&gt; +-#if defined NTP_API &amp;&amp; NTP_API &gt; 3<br>
&gt; ++#if defined(HAVE_STRUCT_NTPTIMEVAL_TAI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *jfmt5 =3D=
 &quot;\&quot;TAI-offset\&quot;:%d,&quot;;<br>
&gt; + #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *jfmt6 =3D=
 &quot;&quot;;<br>
&gt; +-- <br>
&gt; +2.33.0<br>
&gt; +<br>
&gt; diff --git a/package/ntpsec/Config.in b/package/ntpsec/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9044aa4<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/Config.in<br>
&gt; @@ -0,0 +1,68 @@<br>
&gt; +comment &quot;ntpsec needs a toolchain w/ wchar, thread, dynamic libr=
ary&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_STATIC_LIBS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_USE_WCHAR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS # libbsd<br=
>
&gt; +<br>
&gt; +comment &quot;ntpsec needs libbsd&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libbsd<br>
&gt; +<br>
&gt; +comment &quot;ntpsec needs python3&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_PYTHON3<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libbsd<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_PYTHON3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBCAP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBBSD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PPS_TOOLS # refclock(pps)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NTPsec is a secure, hardened, and improved=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0implementation of Network Time Protocol de=
rived<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0from NTP Classic, Dave Mills=E2=80=99s ori=
ginal.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Provides things like ntpd, ntpdate, ntpq, =
etc...<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.ntpsec.org/" rel=3D=
"noreferrer" target=3D"_blank">https://www.ntpsec.org/</a><br>
&gt; +<br>
&gt; +if BR2_PACKAGE_NTPSEC<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC_CLASSIC_MODE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-classic&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable strict configuration and log-format=
 compatibility<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0with NTP Classic.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This option is not recommended as it makes=
 the module<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0less efficient.<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC_NTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-nts&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Network Time Security (NTS) support=
.<br>
&gt; +<br>
&gt; +comment &quot;ntpsec-ntploggpsd needs gpsd&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_PACKAGE_GPSD<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC_LEAP_SMEAR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-leap-smear&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Activates leap second smearing,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.ntpsec.org/latest/=
leapsmear.html" rel=3D"noreferrer" target=3D"_blank">https://docs.ntpsec.or=
g/latest/leapsmear.html</a><br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC_LEAP_TESTING<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-leap-testing&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enables leap seconds on other than 1st day=
 of month<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_NTPSEC_EARLY_DROPROOT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ntpsec-early-droproot&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Drops root privileges as early as possible=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This requires the refclock devices to be o=
wned<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0by owner/group running &#39;ntpd&#39;<br>
&gt; +<br>
&gt; +endif<br>
&gt; diff --git a/package/ntpsec/S49ntp b/package/ntpsec/S49ntp<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f3db514<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/S49ntp<br>
&gt; @@ -0,0 +1,58 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#<br>
&gt; +# Starts Network Time Protocol daemon<br>
&gt; +#<br>
&gt; +<br>
&gt; +DAEMON=3D&quot;ntpd&quot;<br>
&gt; +PIDFILE=3D&quot;/var/run/$DAEMON.pid&quot;<br>
&gt; +<br>
&gt; +NTPD_ARGS=3D&quot;-g -u ntp:ntp -s /var/run/ntp&quot;<br>
&gt; +<br>
&gt; +# shellcheck source=3D/dev/null<br>
&gt; +[ -r &quot;/etc/default/$DAEMON&quot; ] &amp;&amp; . &quot;/etc/defau=
lt/$DAEMON&quot;<br>
&gt; +<br>
&gt; +mkdir -p /var/run/ntp &amp;&amp; chown ntp:ntp /var/run/ntp<br>
&gt; +<br>
&gt; +start() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s: &#39; &quot;$DAEMON&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# shellcheck disable=3DSC2086 # we need the word =
splitting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon -S -q -p &quot;$PIDFILE&quot; -=
x &quot;/usr/sbin/$DAEMON&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- $NTPD_ARGS -p &quo=
t;$PIDFILE&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +stop() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;$DAEMON&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon -K -q -p &quot;$PIDFILE&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$PIDFILE&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +restart() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt; +}<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quot;;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, since ther=
e is no true &quot;reload&quot; feature.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $0 =
{start|stop|restart|reload}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; +esac<br>
&gt; diff --git a/package/ntpsec/ntpd.etc.conf b/package/ntpsec/ntpd.etc.co=
nf<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e0f45c1<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/ntpd.etc.conf<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +#<br>
&gt; +# legacy NTP configuration<br>
&gt; +#<br>
&gt; +pool <a href=3D"http://0.pool.ntp.org" rel=3D"noreferrer" target=3D"_=
blank">0.pool.ntp.org</a> iburst<br>
&gt; +pool <a href=3D"http://1.pool.ntp.org" rel=3D"noreferrer" target=3D"_=
blank">1.pool.ntp.org</a> iburst<br>
&gt; +pool <a href=3D"http://2.pool.ntp.org" rel=3D"noreferrer" target=3D"_=
blank">2.pool.ntp.org</a> iburst<br>
&gt; +pool <a href=3D"http://3.pool.ntp.org" rel=3D"noreferrer" target=3D"_=
blank">3.pool.ntp.org</a> iburst<br>
&gt; +<br>
&gt; +#<br>
&gt; +# NTS configuration<br>
&gt; +#<br>
&gt; +# Notes:<br>
&gt; +#=C2=A0 - uncomment the following lines to enable NTS support (but<br=
>
&gt; +#=C2=A0 =C2=A0 make sure the initial clock is up-to-date (otherwise t=
he<br>
&gt; +#=C2=A0 =C2=A0 NTS certificate validation will fail with &#39;NTSc: c=
ertificate invalid:<br>
&gt; +#=C2=A0 =C2=A0 9=3D&gt;certificate is not yet valid&#39; as on boards=
 without RTC support)<br>
&gt; +#=C2=A0 =C2=A0 and/or keep at least one line from the legacy NTP line=
s<br>
&gt; +#=C2=A0 - enable BR2_PACKAGE_CA_CERTIFICATES to gain access to the ce=
rtificate<br>
&gt; +#=C2=A0 =C2=A0 files<br>
&gt; +#<br>
&gt; +# server <a href=3D"http://time.cloudflare.com" rel=3D"noreferrer" ta=
rget=3D"_blank">time.cloudflare.com</a> nts=C2=A0 # Global, anycast<br>
&gt; +# server <a href=3D"http://nts.ntp.se:4443" rel=3D"noreferrer" target=
=3D"_blank">nts.ntp.se:4443</a> nts=C2=A0 =C2=A0 =C2=A0 # Sweden<br>
&gt; +# server <a href=3D"http://ntpmon.dcs1.biz" rel=3D"noreferrer" target=
=3D"_blank">ntpmon.dcs1.biz</a> nts=C2=A0 =C2=A0 =C2=A0 # Singapore<br>
&gt; +# server <a href=3D"http://ntp1.glypnod.com" rel=3D"noreferrer" targe=
t=3D"_blank">ntp1.glypnod.com</a> nts=C2=A0 =C2=A0 =C2=A0# San Francisco<br=
>
&gt; +# server <a href=3D"http://ntp2.glypnod.com" rel=3D"noreferrer" targe=
t=3D"_blank">ntp2.glypnod.com</a> nts=C2=A0 =C2=A0 =C2=A0# London<br>
&gt; +#<br>
&gt; +# ca /usr/share/ca-certificates/mozilla<br>
&gt; +<br>
&gt; +# Allow only time queries, at a limited rate, sending KoD when in exc=
ess.<br>
&gt; +# Allow all local queries (IPv4, IPv6)<br>
&gt; +restrict default nomodify nopeer noquery limited kod<br>
&gt; +restrict 127.0.0.1<br>
&gt; +restrict [::1]<br>
&gt; diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/ntpd.service=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b7db4a2<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/ntpd.service<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +[Unit]<br>
&gt; +Description=3DNetwork Time Service<br>
&gt; +After=3Dnetwork.target<br>
&gt; +<br>
&gt; +[Service]<br>
&gt; +Type=3Dforking<br>
&gt; +PIDFile=3D/run/ntpd.pid<br>
&gt; +# Turn off DNSSEC validation for hostname look-ups, since those need =
the<br>
&gt; +# correct time to work, but we likely won&#39;t acquire that without =
NTP. Let&#39;s<br>
&gt; +# break this chicken-and-egg cycle here.<br>
&gt; +Environment=3DSYSTEMD_NSS_RESOLVE_VALIDATE=3D0<br>
&gt; +ExecStart=3D/usr/sbin/ntpd @NTPD_EXTRA_ARGS@ -g -p /run/ntpd.pid<br>
<br>
The @NTPD_EXTRA_ARGS@ handling needs the sed command instead of the<br>
simple install one (see package/ntp/<a href=3D"http://ntp.mk" rel=3D"norefe=
rrer" target=3D"_blank">ntp.mk</a>)...<br>
<br>
&gt; +<br>
&gt; +[Install]<br>
&gt; +WantedBy=3Dmulti-user.target<br>
&gt; diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000..49dc4e4<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/ntpsec.hash<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +# Locally calculated<br>
&gt; +sha256=C2=A0 71c9f4bde6953bbc048bbaf278da81c451a56cc08d6772542b4ad37c=
67d72e89=C2=A0 ntpsec-NTPsec_1_2_1.tar.bz2<br>
&gt; +sha256=C2=A0 b4db4de3317c3b0554ed91eb692968800bdfd6ad2c16ffbeee8ce489=
5ed91da4=C2=A0 LICENSE.adoc<br>
&gt; +sha256=C2=A0 d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fad=
ca3c0856=C2=A0 docs/copyright.adoc<br>
&gt; diff --git a/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"norefe=
rrer" target=3D"_blank">ntpsec.mk</a> b/package/ntpsec/<a href=3D"http://nt=
psec.mk" rel=3D"noreferrer" target=3D"_blank">ntpsec.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..55b4bb0<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/ntpsec/<a href=3D"http://ntpsec.mk" rel=3D"noreferrer" t=
arget=3D"_blank">ntpsec.mk</a><br>
&gt; @@ -0,0 +1,85 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# ntpsec<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +NTPSEC_VERSION_MAJOR =3D 1<br>
&gt; +NTPSEC_VERSION_MINOR =3D 2<br>
&gt; +NTPSEC_VERSION_POINT =3D 1<br>
&gt; +NTPSEC_VERSION =3D $(NTPSEC_VERSION_MAJOR)_$(NTPSEC_VERSION_MINOR)_$(=
NTPSEC_VERSION_POINT)<br>
&gt; +NTPSEC_SOURCE =3D ntpsec-NTPsec_$(NTPSEC_VERSION).tar.bz2<br>
&gt; +NTPSEC_SITE =3D <a href=3D"https://gitlab.com/NTPsec/ntpsec/-/archive=
/NTPsec_$(NTPSEC_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.com/NTPsec/ntpsec/-/archive/NTPsec_$(NTPSEC_VERSION)</a><br>
&gt; +NTPSEC_LICENSE =3D BSD-2-Clause NTP BSD-3-Clause MIT<br>
&gt; +NTPSEC_LICENSE_FILES =3D LICENSE.adoc docs/copyright.adoc<br>
&gt; +<br>
&gt; +NTPSEC_CPE_ID_VENDOR =3D ntpsec<br>
&gt; +NTPSEC_CPE_ID_VERSION =3D $(NTPSEC_VERSION_MAJOR).$(NTPSEC_VERSION_MI=
NOR)<br>
&gt; +NTPSEC_CPE_ID_UPDATE =3D $(NTPSEC_VERSION_POINT)<br>
&gt; +<br>
&gt; +NTPSEC_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_PYTHON),python,python3) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libbsd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pps-tools<br>
&gt; +<br>
&gt; +NTPSEC_PYVER =3D $(if $(BR2_PACKAGE_PYTHON),python$(PYTHON_VERSION_MA=
JOR),python$(PYTHON3_VERSION_MAJOR))<br>
&gt; +<br>
&gt; +NTPSEC_CONF_OPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CC=3D$(HOSTCC) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PYTHON_CONFIG=3D&quot;$(STAGING_DIR)/usr/bin/$(if=
 $(BR2_PACKAGE_PYTHON),python,python3)-config&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--cross-compiler=3D&quot;$(TARGET_CC)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--cross-cflags=3D&quot;$(TARGET_CFLAGS) -std=3Dgn=
u99&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--cross-ldflags=3D&quot;$(TARGET_LDFLAGS)&quot; \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--notests \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-mdns-registration \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--enable-pylib=3Dffi \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--nopyc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--nopyo \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--nopycache \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-doc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--disable-manpage \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--refclock=3Dall \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--libdir=3D/usr/lib/$(NTPSEC_PYVER)/site-packages=
/ntp<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_NTPSEC_CLASSIC_MODE),y)<br>
&gt; +NTPSEC_CONF_OPTS +=3D --enable-classic-mode<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_NTPSEC_NTS),y)<br>
&gt; +NTPSEC_DEPENDENCIES +=3D openssl<br>
&gt; +else<br>
&gt; +NTPSEC_CONF_OPTS +=3D --disable-nts<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_NTPSEC_EARLY_DROPROOT),y)<br>
&gt; +NTPSEC_DEPENDENCIES +=3D libcap<br>
&gt; +NTPSEC_CONF_OPTS +=3D --enable-early-droproot<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_SMEAR),y)<br>
&gt; +NTPSEC_CONF_OPTS +=3D --enable-leap-smear<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_NTPSEC_LEAP_TESTING),y)<br>
&gt; +NTPSEC_CONF_OPTS +=3D --enable-leap-testing<br>
&gt; +endif<br>
&gt; +<br>
&gt; +define NTPSEC_INSTALL_NTPSEC_CONF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 644 package/ntpsec/ntpd.etc.conf $(=
TARGET_DIR)/etc/ntp.conf<br>
&gt; +endef<br>
&gt; +NTPSEC_POST_INSTALL_TARGET_HOOKS +=3D NTPSEC_INSTALL_NTPSEC_CONF<br>
&gt; +<br>
&gt; +define NTPSEC_INSTALL_INIT_SYSV<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(NTPSEC_PKGDIR)/S49ntp $(TA=
RGET_DIR)/etc/init.d/S49ntp<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define NTPSEC_INSTALL_INIT_SYSTEMD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(NTPSEC_PKGDIR)/ntpd.servic=
e \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/lib=
/systemd/system/ntpd.service<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define NTPSEC_USERS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ntp -1 ntp -1 * - - - ntpd user<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(waf-package))<br>
<br>
Will prepare an update of my original patch with the version update and som=
e of<br>
your findings..., feel free to provide your improvements as add-on patches =
;-)<br>
<br>
Regards,<br>
Peter<br>
<br>
</blockquote></div>

--0000000000004c8bad05d335e502--

--===============2883495525962462107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2883495525962462107==--
