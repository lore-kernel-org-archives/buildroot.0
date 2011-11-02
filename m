From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 2 Nov 2011 08:59:40 +0100
Subject: [Buildroot] PKG_CONFIG_PATH question
In-Reply-To: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
References: <CALX2uoNbshTRLzEXYJMOKuKF2WOxks+Q3w5Rz83YXoku3z_ueA@mail.gmail.com>
Message-ID: <CAAXf6LU3fXXea4e5_kXftPMeLoYz6AuSO75s6OShtYsgnjgE=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luke,

2011/10/30 ?ukasz Pu?ka <lukasz@oxnet.pl>:
> Hi all,
>
> My name is Luke and I am new here.
>
> After two encouraging sessions about buildroot on ELCE, I decided to
> give it a try.

Welcome! It's nice to hear that ELCE made a difference!

> I am usually using OpenEmbedded but just for fun I decided to build
> similar image with buildroot, I downloaded buildroot-2011.08.
> Compiled my own toolchain with crostool-ng (btw, all new CodeSourcery
> arm toolchains have ICE when iwmmxt optimization is enabled). And.. i
> get stuck for the while.
>
> For the build system I use quite ancient host machine (slackware),
> maybe it causes some problems.
>
> I could not compile libxcb, getting error from configure that
> xcb-proto version is less than 1.5 (buildroot is looking for
> xcb-proto.pc file (during configure) inside " /usr/lib/pkgconfig/" -
> on my build system) is that nomal ?
>
> I could move forward by setting environment variable PKC_CONFIG_PATH
> to the STAGING_DIR/usr/lib/pkgconfig/, butI do not like this solution.

Could you give some more details, for example (part of) the build log,
showing which package is being installed. Some packages first install
a host- variant. In that case, it is perfectly valid for the configure
step of that host package to check /usr/lib/pkgconfig.

Best regards,
Thomas
