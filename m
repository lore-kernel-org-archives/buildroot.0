From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 10 Aug 2019 05:45:20 -0300
Subject: [Buildroot] Buildroot toradex_apalis_imx6_defconfig no longer
 builds
In-Reply-To: <20190810103457.3207daf1@windsurf.home>
References: <20190810103457.3207daf1@windsurf.home>
Message-ID: <CANu7NGsqQcRPQfRqTr6h8kHm9yXuF+AGksX_YQUXPvWp0hW55g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I'll take a look at it.

Thanks,

Sergio Prado
Embedded Labworks
Mobile: +55 11 97123-3420


Em s?b, 10 de ago de 2019 ?s 05:35, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> escreveu:

> Sergio, Scott,
>
> The toradex_apalis_imx6_defconfig in Buildroot no longer builds:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139299
>
> The error is:
>
> /tmp/ccmYVKw5.s: Assembler messages:
> /tmp/ccmYVKw5.s:846: Error: .err encountered
> /tmp/ccmYVKw5.s:862: Error: .err encountered
> /tmp/ccmYVKw5.s:3457: Error: .err encountered
> scripts/Makefile.build:258: recipe for target 'fs/fat/dir.o' failed
>
> The kernel is too old, and causes build issues with gcc 8.x, which is
> now our default gcc version. The fix is most likely to update the
> kernel, either to a newer 4.1.x release, or to a newer series.
>
> Could one of you have a look into this ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190810/3e5c692c/attachment.html>
