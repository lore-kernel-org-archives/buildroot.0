From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Wed, 24 Mar 2021 10:44:46 +0100
Subject: [Buildroot] gmp.h error compiling Linux 5.11 with Buildroot
 2021.02 default arm toolchain
In-Reply-To: <03234abf-f7d3-e09b-4b23-fe400b2c8170@bootlin.com>
References: <a66afe8f-7f99-db2c-f966-c62dad9af5e3@bootlin.com>
 <03234abf-f7d3-e09b-4b23-fe400b2c8170@bootlin.com>
Message-ID: <9d55805c-90a5-3b57-a2f2-28bda128a374@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

On 3/24/21 10:35 AM, Michael Opdenacker wrote:
> Hello again,
>
> On 3/24/21 10:14 AM, Michael Opdenacker wrote:
>> ?HOSTLD scripts/dtc/dtc
>> HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>> In file included from
>> /home/tux/boot-time-labs/rootfs/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/plugin/include/gcc-plugin.h:28,
>> from scripts/gcc-plugins/gcc-common.h:7,
>> from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
>> /home/tux/boot-time-labs/rootfs/buildroot/output/host/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/plugin/include/system.h:687:10:
>> fatal error: gmp.h: No such file or directory
>> 687 | #include <gmp.h>
>> | ^~~~~~~
>> compilation terminated.
>> make[2]: *** [scripts/gcc-plugins/Makefile:47:
>> scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
>> make[1]: *** [scripts/Makefile.build:496: scripts/gcc-plugins] Error 2
>>
>> make: *** [Makefile:1185: scripts] Error 2
> Good news, it turns out that it's not a Buildroot issue, but rather a
> kernel one?
>
>   * I also have it with the ARM GNU toolchain (gcc 10.2,
>     https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)
>   * I don't have it compiling the kernel with the sama5_defconfig
>     configuration.
>
> When I find a solution, I'll share it here.

For Ubuntu 20.04 and the omap2plus_defconfig configuration, a working
solution is to use the ARM cross-compiler package (sudo apt install
gcc-arm-linux-gnueabi).

So, I'm not stuck, but I'd like to use the Buildroot toolchain anyway...

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
