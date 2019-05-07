From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 7 May 2019 14:56:14 +0200
Subject: [Buildroot] [PATCH] board/qemu/aarch64: add a aarch64 virt
 machine using an ARM cortex-a72 core
In-Reply-To: <20190507141142.27657a08@windsurf>
References: <20190507112521.12165-1-romain.naour@smile.fr>
 <20190507141142.27657a08@windsurf>
Message-ID: <26432ffd-009c-22b1-c49d-5a58fd0f3e5c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 07/05/2019 ? 14:11, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Tue,  7 May 2019 13:25:21 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> ARM cortex-a72 core has been added to Qemu since version 3.1.0 [1] [2].
> 
> Do we really want a different defconfig for each possible ARM core that
> Qemu emulates ?

Indeed, it would increase the maintenance burden and duplicating some board
files... just to change the target arch variant and one qemu option.

> 
>> Qemu also support ARM cortex-a57 cpu core.
>> Should we support and test all cpu emulation available in Qemu ?
>> This can be useful for toolchain-builder project to provide a prebuilt ARM aarch64
>> toolchain optimized for cortex-a57.
> 
> I'm not sure the toolchain builder project requires exactly a Qemu
> emulating the specific optimization for which gcc was built. I.e, a
> Cortex-A53 qemu defconfig can be used to boot test a Cortex-A57 or A72
> optimized toolchain.
> 
> We're already doing that for example with ARMv5/v6/v7:
> 
>     armv5-* | armv6-* | armv7-*)
>         test_defconfig="qemu_arm_vexpress_defconfig"
>         test_board_dir="arm-vexpress"
> 
> Or for x86:
> 
>     x86-core2)
>         test_defconfig="qemu_x86_defconfig"
>     x86-i686)
>         test_defconfig="qemu_x86_defconfig"

For these configuration we only provide the machine type (-M), not the cpu type
(-cpu).

Maybe toolchain-builder should update/replace the -cpu option if provided by the
readme.txt using test_qemu_args="-cpu <cpu core>"

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
