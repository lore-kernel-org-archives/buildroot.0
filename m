From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Aug 2019 13:24:24 -0700
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu_riscv32_virt: Update to
 5.1 kernel
In-Reply-To: <CAEUhbmX6XRxKHgZVQd-zjPR6S8gcBNOy9afa9N1E4wtNGOiMMw@mail.gmail.com>
References: <20190619165406.19615-1-alistair.francis@wdc.com>
 <20190619165406.19615-2-alistair.francis@wdc.com>
 <20190620155715.23c40f26@windsurf>
 <CAKmqyKMudH+KpKrF3kwkK6SudHt0Ysg_v1JnBS_BO9jXk3DR+g@mail.gmail.com>
 <58cf6eb8-6e90-1a36-1339-ba5a12c51cad@embecosm.com>
 <CAKmqyKPR0-FfVgENsyM7hodee-aOTYd4odPqB9axx0_secq4MQ@mail.gmail.com>
 <CAKmqyKOA1JxWX0EZ1aBa5AGYBbTpDPXPusUthfR-Y3QXyg4ZzQ@mail.gmail.com>
 <20190620202630.133c7d35@windsurf>
 <CAKmqyKPecJMDpJu+R8cZ7jEc_UbOeMvJszViZ=siVJV_HVUY+A@mail.gmail.com>
 <20190620210215.08baafe7@windsurf>
 <CAKmqyKPoyJGipRANseK-Ce0nXWXx69k3g+2vWfh2rZ3RLKyLOQ@mail.gmail.com>
 <CAEUhbmX6XRxKHgZVQd-zjPR6S8gcBNOy9afa9N1E4wtNGOiMMw@mail.gmail.com>
Message-ID: <CAKmqyKP1=rH-FrBuWAHuwa-V_8c+e9dGcjD5zuELEXjShqPY3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 17, 2019 at 9:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2019 at 4:03 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Jun 20, 2019 at 12:02 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > On Thu, 20 Jun 2019 11:26:06 -0700
> > > Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > > Yep, the problem is that the glibc port isn't upstream so it isn't
> > > > stable. The kernel has progressed ahead of the latest glibc upstrem
> > > > submission (what we are using in buildroot). To fix this we are
> > > > reverting the patch from the kernel. Hopefully in the future we can
> > > > update glibc and then remove the patch.
> > >
> > > For riscv32 we are *not* using upstream glibc:
> >
> > Yep, there is no upstream glibc.
> >
> > >
> > > else ifeq ($(BR2_RISCV_32),y)
> > > GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
> > > GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
> > >
> > > so if this glibc fork has been updated to cope with the recent kernel
> > > change, I think we should update glibc instead of reverting the patch
> > > from the kernel.
> >
> > It hasn't been updated, we are using the latest. This is why we need
> > the kernel patch.
> >
>
> The riscv32 glibc build is still failing with current buildroot master
> HEAD. Is there any plan to address this?

I thought I tried this the other day and it worked.

The RV32 glibc submission is ongoing. When it's in a better state I'll
update it here.

Alistair

>
> Regards,
> Bin
