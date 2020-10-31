From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Oct 2020 21:52:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/pax-utils: needs wchar
In-Reply-To: <20201031214211.69a71de5@windsurf>
References: <20201031150836.100678-1-fontaine.fabrice@gmail.com>
 <20201031214211.69a71de5@windsurf>
Message-ID: <CAPi7W83XDhp2f-U=g89w76XEEqeyzE_jTCLzRHYogrcFr6=d_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le sam. 31 oct. 2020 ? 21:42, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 31 Oct 2020 16:08:36 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > pax-utils uses asprintf and so needs wchar since version 1.2.4 and
> > https://gitweb.gentoo.org/proj/pax-utils.git/commit/?id=9c0ec154d782795daa3b7d2ae273bbda2b36ae83
>
> In fact, it seems like the build problem comes from gnulib, which is
> bundled in pax-utils. Usage of wctomb() was recently added in gnulib as
> of commit 5cdec0ff5ecf34474d90d8b57f50a148449cda0c. And it seems like
> there is code to not use wctomb() when wchar support is not available,
> but that logic doesn't seem to work.
>
> I don't really care about pax-utils being not available with wchar
> disabled, but since gnulib is also used in lots of other projects, I'm
> fearing that we might see this issue elsewhere.
>
> Could you check if the pax-utils copy of gnulib lib/vasnprintf.c
> includes commit 5cdec0ff5ecf34474d90d8b57f50a148449cda0c and report a
> bug to upstream gnulib ?
pax-utils copy of gnulib does not include commit
5cdec0ff5ecf34474d90d8b57f50a148449cda0c (there is no
ENABLE_WCHAR_FALLBACK or wctomb_fallback).
So we should be able to drop wchar dependency as soon as pax-utils
refresh gnulib.
>
> In the mean time, I have applied your patch, with an extended commit
> log.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
