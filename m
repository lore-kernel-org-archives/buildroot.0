From: =?UTF-8?Q?Roberto_Alejandro_Esp=C3=AD_Mu=C3=B1oz?= <teratux@gmail.com>
Date: Tue, 4 May 2021 14:02:01 -0400
Subject: [Buildroot] problems building a system for Rpi4
In-Reply-To: <20210503210605.2b441f31@gmx.net>
References: <CAG-SZaJqi-sMUtj2R0HRwvpST1WRdQSF7eA3iDi6n=g-gEB=XQ@mail.gmail.com>
 <20210503210605.2b441f31@gmx.net>
Message-ID: <CAG-SZaLq6drODUU+4+CatQjRBtH3OPDasUnEVHQtd8Kr3D8XpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That completely did the trick, thank you, system booted perfectly ?

On Mon, May 3, 2021 at 3:06 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Alejandro,
>
> On Mon, 3 May 2021 11:18:06 -0400, Roberto Alejandro Esp? Mu?oz <
> teratux at gmail.com> wrote:
>
> > Hello, I'm having some trouble getting my build to boot on a RPi4.  I
> > initially tried building the default config version for 64 bits
> > (raspberrypi4_64_defconfig) and it builds and boots ok with no problem.
> I
> > need to change the system to use glibc but whenever I manage to build the
> > system and boot it I get a kernel panic error: Attempted to kill init
> with
> > exitcode=0x00007f00.  The only change I'm making is switching over to a
> > glibc toolchain and so far no progress.
> >
> > I'm using buildroot buildroot-2020.11.3 and I attached my current config.
>
> Simple mismatch between toolchain headers:
>
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
>
> and Linux-Kernel Version, here still 5.4.72...
>
> Can reproduce your problem with this combination (buildroot toolchain
> instead
> of external one), and can be fixed by simple changing the toolchain
> headers to 5.4.x (and complete re-build)...
>
> Regards,
> Peter
>
> >
> > Thanks in advance
> >
>
>

-- 
teratux
------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210504/52ec879a/attachment.html>
