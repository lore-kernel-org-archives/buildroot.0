From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 10:46:53 -0700
Subject: [Buildroot] [PATCH 3/3] boot: riscv: Remove riscv-pk
In-Reply-To: <20190316084319.15b569e0@windsurf>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
 <20190315230540.4311-3-alistair.francis@wdc.com>
 <20190316084319.15b569e0@windsurf>
Message-ID: <CAKmqyKMEcxAQd-i+Y9Zyy_St7q8pu=o70YZQE6dkOc=bE9mQSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 16, 2019 at 12:43 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 15 Mar 2019 23:06:39 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> > Now that OpenSBI is supported remove BBL (riscv-pk).
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> This commit is not enough: you do not update the
> qemu_riscv64_virt_defconfig and qemu_riscv32_virt_defconfig, which use
> riscv-pk. They should be converted to use opensbi instead, and of
> course be runtime tested under Qemu.

Ah ok. I didn't think about the defconfigs. I'll update those as well
as the instructions.

Alistair

>
> And of course, it'd be nice if Mark Corbin, who added riscv-pk, could
> give his opinion about the replacement of riscv-pk by opensbi.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
