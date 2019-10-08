From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 8 Oct 2019 11:17:45 +0100
Subject: [Buildroot] [PATCH v2] boot/riscv-pk: Remove obselete bootloader
In-Reply-To: <CAKmqyKNjtHCK3oancmBEUBjAxWvQfLB-c+3xZZ-NGGTBvix+zQ@mail.gmail.com>
References: <20190923200256.29967-1-alistair.francis@wdc.com>
 <20190928231116.1e938ccc@windsurf>
 <19ec2011-2a88-b9a8-5e34-007f8d851d49@embecosm.com>
 <CAKmqyKNjtHCK3oancmBEUBjAxWvQfLB-c+3xZZ-NGGTBvix+zQ@mail.gmail.com>
Message-ID: <e858de13-59e6-d72e-580e-fa944a252727@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair

On 07/10/2019 17:59, Alistair Francis wrote:
> On Mon, Oct 7, 2019 at 4:19 AM Mark Corbin <mark.corbin@embecosm.com> wrote:
>> Hello
>>
>> On 28/09/2019 22:11, Thomas Petazzoni wrote:
>>> On Mon, 23 Sep 2019 13:02:56 -0700
>>> Alistair Francis <alistair.francis@wdc.com> wrote:
>>>
>>>> The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
>>>> very limited testing. It has been replaced by OpenSBI and been
>>>> deprecated for awhile, so let's just remove it.
>>>>
>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>> v2:
>>>>  - Remove package from DEVELOPERS
>>>>  - Add option to Config.in.legacy
>>> I'd like to have a Acked-by from Mark Corbin on this patch. Mark ?
>> I'm in two minds about removing the BBL bootloader at the moment...
>>
>> ...on one hand I can see that OpenSBI should be used for all RISC-V
>> projects going forward, but on the other hand there still seem to be a
>> number of RISC-V projects that are using riscv-pk /BBL (and Buildroot),
>> e.g. Ariane/OpenPiton, Shakti C-class and LowRISC (for Rocket core).
> OpenSBI supports Ariane: https://github.com/riscv/opensbi/tree/master/platform
>
> Although buildroot doesn't have configs for all of these platforms.
>
>> Keeping BBL support within Buildroot at least gives people a smoother
>> upgrade path, i.e. riscv-pk + Buildroot -> Buildroot (with integrated
>> riscv-pk) -> Buildroot (with integrated OpenSBI).
> The main problem with keeping it is that it's not maintained and as
> other software keeps moving forward there will be compatibility issues
> that won't be obvious to people. For example some new kernel thing
> that relies on the firmware to behave in some way and BBL won't do
> that. As the SBI spec is updated this will also be an issue.
>
>> I know that most 'desktop' distros are moving, or are planning to move,
>> to OpenSBI, but I'm not so sure about the situation for people working
>> with softcores/FPGAs or more deeply embedded systems.
> Most distros in general have moved on, not just the traditional
> desktop distros. SiFive have moved away from it and the last real
> commit to the repo was in August.
>
> We haven't removed it from any existing buildroot releases, so anyone
> who has locked into a release can continue to use it. This will just
> stop new projects from starting with it and help convince people to
> swap.
>
> Alistair

Thanks for the update. Makes sense to remove it.

Please could you re-send with tabs instead of spaces in Config.in.legacy.

Thanks

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
