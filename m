From: Mark Corbin <mark.corbin@embecosm.com>
Date: Mon, 7 Oct 2019 12:14:19 +0100
Subject: [Buildroot] [PATCH v2] boot/riscv-pk: Remove obselete bootloader
In-Reply-To: <20190928231116.1e938ccc@windsurf>
References: <20190923200256.29967-1-alistair.francis@wdc.com>
 <20190928231116.1e938ccc@windsurf>
Message-ID: <19ec2011-2a88-b9a8-5e34-007f8d851d49@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
?
On 28/09/2019 22:11, Thomas Petazzoni wrote:
> On Mon, 23 Sep 2019 13:02:56 -0700
> Alistair Francis <alistair.francis@wdc.com> wrote:
>
>> The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
>> very limited testing. It has been replaced by OpenSBI and been
>> deprecated for awhile, so let's just remove it.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> v2:
>>  - Remove package from DEVELOPERS
>>  - Add option to Config.in.legacy
> I'd like to have a Acked-by from Mark Corbin on this patch. Mark ?

I'm in two minds about removing the BBL bootloader at the moment...

...on one hand I can see that OpenSBI should be used for all RISC-V
projects going forward, but on the other hand there still seem to be a
number of RISC-V projects that are using riscv-pk /BBL (and Buildroot),
e.g. Ariane/OpenPiton, Shakti C-class and LowRISC (for Rocket core).
Keeping BBL support within Buildroot at least gives people a smoother
upgrade path, i.e. riscv-pk + Buildroot -> Buildroot (with integrated
riscv-pk) -> Buildroot (with integrated OpenSBI).

I know that most 'desktop' distros are moving, or are planning to move,
to OpenSBI, but I'm not so sure about the situation for people working
with softcores/FPGAs or more deeply embedded systems.

Thoughts?

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
