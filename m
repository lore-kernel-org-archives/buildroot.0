From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Tue, 20 Jun 2017 10:21:44 -0400
Subject: [Buildroot] [PATCH v3 1/1] configs/arcturus_ucls1012a: new
 defconfig
In-Reply-To: <20170609175233.0795f77e@free-electrons.com>
References: <20170608204400.21287-1-oleks@arcturusnetworks.com>
 <20170608231002.160f7742@free-electrons.com>
 <ff9861e8-8774-1dbf-4626-a4b581a07a5b@arcturusnetworks.com>
 <20170609175233.0795f77e@free-electrons.com>
Message-ID: <6df3604c-904b-6b9f-8a58-fb500c11bdf7@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/2017 11:52 AM, Thomas Petazzoni wrote:
>
>>> OK, you moved the firmware inside the kernel sources. Not really nice,
>>> because it means those files in the target filesystem are not
>>> associated with any license.
>> The firmware is associated with Freescale-Binary-EULA licence and that
>> license is included.
>> I agree it's not really nice to move it inside kernel, but you asked to
>> remove it from rootfs-overlay and I could not found any better place for
>> now. Any suggestions welcome.
> Best option:
>
>   Contribute the firmware to the linux-firmware project.
>
> Not as good, but still acceptable option:
>
>   Separate Git repository with this firmware and its license file + a
>   Buildroot package that downloads and installs this firmware.
>
>>> Why aren't those firmware files contributed to the linux-firmware
>>> project instead?
>> This firmware is came from  Linux? SDK for QorIQ? Processors. SDKLINUX
>> publicly available on NXP website.
>> I really don't know when they going to publish it to any other places,
>> but my personal preferences to use buildroot instead Yocto as build
>> system on all our modules.
>> BTW the NXP's SDK is using Linaro toolchain, even older version.
> Can you point me to the Yocto recipe that installs this firmware ? Is
> their firmware bundled in their Yocto layer, or are they downloading it
> from some location ?

https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/ppfe-firmware/ppfe-firmware_git.bb

Git repository of the package: 
git://git.freescale.com/ppc/sdk/engine-pfe-bin.git

If you think that it is OK, I can add this (ls1012a only related) 
firmware as a Buildroot package. Please confirm.


>    
>> Or please explain the reason why you try to avoid some options, like
>> BR2_TOOLCHAIN_EXTERNA
> The reasons are pretty simple:
>
>   - Consistency between all defconfigs. None of them are using external
>     toolchains, except csky_gx6605s_defconfig, because there is no
>     support for building a CSKY toolchain in Buildroot yet.
>
>   - The Buildroot toolchain should work. If it doesn't, we want to know
>     and fix the problem.


OK, as we are not building any special projects, only BusyBox and I 
tested that it runs, I will change toolchain option to internal.

Will prepare new revision of patches after your confirmation/suggestion 
where to put ls1012a ppfe-firmware.


-- 
Oleksandr Zhadan
Sr. Software Engineer
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
