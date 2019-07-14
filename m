From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jul 2019 15:28:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/vte: needs host-intltool
In-Reply-To: <20190714145107.7aa5ebb1@windsurf>
References: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
 <20190714145107.7aa5ebb1@windsurf>
Message-ID: <CAPi7W81NkNY=3CZ_WD2fvrbRrgSSkdd=cKvtEW5CBzS2WLLx1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le dim. 14 juil. 2019 ? 14:51, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 13 Jul 2019 10:32:55 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/30a8032ebba5a30bacd321c407a1d0734fadf757
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> This vte package has not changed since it was introduced in January
> 2018. Why suddenly we have this error caused by the missing intltool ?
This version of vte currently depends on intltool through
IT_PROG_INTLTOOL([0.35]) and it uses intltool-update to retrieve the
version.
However, on my build system and the one from the Xogium autobuilder,
intltool-update is not available which raise this build failure.
I don't know why we didn't get this error sooner, perhaps because
intltool was more widely installed on the different distributions or
because host-intltool was built due to another package?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
