From: Julien Grossholtz <julien.grossholtz@gmail.com>
Date: Sun, 18 Aug 2019 21:32:51 +0200
Subject: [Buildroot] Buildroot ts7680_defconfig no longer builds
In-Reply-To: <20190818144423.003b5a80@windsurf.home>
References: <20190810104751.647f64ed@windsurf.home>
 <20190818144423.003b5a80@windsurf.home>
Message-ID: <CAHxQtxP83n6A_YtHWqTPLCCcAwwY8Uj0rh4z-SD_C5gMU5bz9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Sorry for the late reply and thank you for pointing that out.

I was able to reproduce the issue with gcc 8.x and 9.x. With gcc 7.x
and Linux 3.14 the ts7680_defconfig is able to build.
Has anything changed regarding Buildroot toolchain handling since
previous release?

The ts7680 is not supported in upstream Linux, but Technologic Systems
recently added a 4.9 Linux repository [1] for their i.MX28 boards. I
am able to compile this kernel and generate a full system.

I will submit a patch to bump the kernel, but I no longer have access
to the board to test the build. I will CC people from Savoir-Faire
Linux who use this board so they can test and acknowledge the patch. I
would also ask if they can maintain the board in the future.

Regards,

Julien

[1] https://github.com/embeddedarm/linux-4.9.y

Le dim. 18 ao?t 2019 ? 14:44, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Julien,
>
> On Sat, 10 Aug 2019 10:47:51 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > The ts7680_defconfig in Buildroot no longer builds:
> >
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139303
>
> It still fails to build:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/273673278
>
> Will you have the chance to look into this? Otherwise we can simply
> remove the defconfig.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
