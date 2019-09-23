From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Sep 2019 13:07:51 -0700
Subject: [Buildroot] [PATCH] boot/riscv-pk: Remove obselete bootloader
In-Reply-To: <c8cb32e5-6633-8e67-7d43-978d5c35bc2d@mind.be>
References: <20190919212648.4476-1-alistair.francis@wdc.com>
 <c8cb32e5-6633-8e67-7d43-978d5c35bc2d@mind.be>
Message-ID: <CAKmqyKONPC+mjnx0ZWauPSxcT+FEqw=QdkWdfRubr7eH+yK4GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 21, 2019 at 2:40 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Alistair,
>
> On 19/09/2019 23:26, Alistair Francis wrote:
> > The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
> > very limited testing. It has been replaced by OpenSBI and been
> > deprecated for awhile, so let's just remove it.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  boot/Config.in            |  1 -
> >  boot/riscv-pk/Config.in   | 17 -----------------
> >  boot/riscv-pk/riscv-pk.mk | 32 --------------------------------
> >  3 files changed, 50 deletions(-)
> >  delete mode 100644 boot/riscv-pk/Config.in
> >  delete mode 100644 boot/riscv-pk/riscv-pk.mk
>
>  You missed two things:
>
> - a Config.in.legacy entry should be added, with a help text that explains to
> use OpenSBI instead. Normally we add a 'select' to do that automatically, but
> I'm not sure i that is appropriate here (since you need to set the platform and
> possibly the linux payload option).

Ah, I didn't know about this. I have sent a v2 with this added.

>
> - Remove the package from DEVELOPERS as well.

I have also fixed this in the v2.

Alistair

>
>
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
