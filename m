From: Zeno Endemann <zeno.endemann@googlemail.com>
Date: Tue, 20 Nov 2018 14:55:32 +0100
Subject: [Buildroot] qemu-aarch64 applications misbehaving
Message-ID: <d2bbad73-b8a5-917a-1a10-a2b702cdcb34@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,
> 
> On Tue, 20 Nov 2018 00:11:13 -0200, Ricardo Martincoski wrote:
> 
>> I confirm 'df' printing silly numbers with both these images:
>> 2018.08.2 : https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/122632959
>> 2018.11-rc1 : https://gitlab.com/buildroot.org/buildroot/-/jobs/118747268
>> 
>> On 2018.08.2 I also did this:
>> make qemu_aarch64_virt_defconfig
>> make menuconfig # and enable BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
>> make host-qemu # to build qemu 2.12.1
>> output/host/bin/qemu-system-aarch64 ...
>> and the issue with 'df' still occurs.
> 
> So you tested with the default C library, uClibc ? Could you test with
> glibc ?

Indeed, all problems were resolved by changing to glibc. Thanks!

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
