From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon, 18 Mar 2019 10:45:19 +0000
Subject: [Buildroot] [PATCH 3/3] boot: riscv: Remove riscv-pk
In-Reply-To: <20190316084319.15b569e0@windsurf>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
 <20190315230540.4311-3-alistair.francis@wdc.com>
 <20190316084319.15b569e0@windsurf>
Message-ID: <38a561ae-aa81-431d-1629-c9720ba91291@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On 16/03/2019 07:43, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 15 Mar 2019 23:06:39 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
>> Now that OpenSBI is supported remove BBL (riscv-pk).
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> This commit is not enough: you do not update the
> qemu_riscv64_virt_defconfig and qemu_riscv32_virt_defconfig, which use
> riscv-pk. They should be converted to use opensbi instead, and of
> course be runtime tested under Qemu.
>
> And of course, it'd be nice if Mark Corbin, who added riscv-pk, could
> give his opinion about the replacement of riscv-pk by opensbi.

I don't think that removing support for riscv-pk at this stage is
desirable. I imagine that the majority (if not all) RISC-V systems have
been using riscv-pk (BBL) up until this point, including the HiFive
Unleashed board, so I expect that there are a lot of systems and people
with time invested in using it. That said, I always imagined a migration
path from riscv-pk to an alternative such as U-Boot (or OpenSBI or
whatever).

As the first release of OpenSBI was only at the end of January 2019, I
would strongly suggest that we keep riscv-pk for a period of time
(possibly commenting the intention to eventually deprecate it in favour
of OpenSBI). This will give OpenSBI time to mature and users of riscv-pk
a period to evaluate it and consider migrating.

I do think that it would be a good start to test the existing QEMU virt
configurations with OpenSBI and then update them as necessary.

Regards

Mark

>
> Thanks!
>
> Thomas

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
