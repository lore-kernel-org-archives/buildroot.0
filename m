From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 19 Mar 2019 10:35:44 +0000
Subject: [Buildroot] [PATCH 3/3] boot: riscv: Remove riscv-pk
In-Reply-To: <CAKmqyKOgPmXomo_gstnkT6yYkZchv4m6__pgKqM12Rw=ZJft4g@mail.gmail.com>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
 <20190315230540.4311-3-alistair.francis@wdc.com>
 <20190316084319.15b569e0@windsurf>
 <38a561ae-aa81-431d-1629-c9720ba91291@embecosm.com>
 <CAKmqyKOgPmXomo_gstnkT6yYkZchv4m6__pgKqM12Rw=ZJft4g@mail.gmail.com>
Message-ID: <197966d3-fa80-b192-c8e0-25566efb2016@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair

On 18/03/2019 17:51, Alistair Francis wrote:
> On Mon, Mar 18, 2019 at 3:45 AM Mark Corbin <mark.corbin@embecosm.com> wrote:
>> Hello
>>
>> On 16/03/2019 07:43, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Fri, 15 Mar 2019 23:06:39 +0000
>>> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>>>
>>>> Now that OpenSBI is supported remove BBL (riscv-pk).
>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> This commit is not enough: you do not update the
>>> qemu_riscv64_virt_defconfig and qemu_riscv32_virt_defconfig, which use
>>> riscv-pk. They should be converted to use opensbi instead, and of
>>> course be runtime tested under Qemu.
>>>
>>> And of course, it'd be nice if Mark Corbin, who added riscv-pk, could
>>> give his opinion about the replacement of riscv-pk by opensbi.
>> I don't think that removing support for riscv-pk at this stage is
>> desirable. I imagine that the majority (if not all) RISC-V systems have
>> been using riscv-pk (BBL) up until this point, including the HiFive
>> Unleashed board, so I expect that there are a lot of systems and people
>> with time invested in using it. That said, I always imagined a migration
>> path from riscv-pk to an alternative such as U-Boot (or OpenSBI or
>> whatever).
> I agree that up until OpenSBI almost all boards would have been using
> BBL. The problem with BBL is that people were never investing time
> into it. There was never a formal release and the code base is
> difficult to maintain. I think that the sooner we can replace it the
> better. Yocto/OpenEmbedded has fully swapped and Fedora is looking at
> swapping as well.
I'd forgotten that riscv-pk support is of course in the current LTS
release for those who want it...so I think that it does make sense to
drop it at this point.

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
