From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 07:42:34 +0000
Subject: [Buildroot] [PATCH 1/5] toolchain/buildroot: allow uclibc-ng
 for riscv
References: <20200908050744.425303-1-damien.lemoal@wdc.com>
 <20200908050744.425303-2-damien.lemoal@wdc.com>
 <20200908090405.4e7a2bcc@windsurf.hq.k.grp>
Message-ID: <CY4PR04MB3751360ECC39A61183D2B984E7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 16:04, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Tue,  8 Sep 2020 14:07:40 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> uclibcb supports RISC-V architecture since version 1.0.31. Allow its
>> selection for that architecture.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> In fact, we had already enabled support for uClibc-ng for RISC-V 64 in
> commit bd9810e176273914eca1208bcba23f0de9e446b3, but we had to revert
> in e7d631c0df1698b4edc94f148e7247869430e108 because uClibc-ng does not
> implement the __riscv_flush_icache() function, which is needed, as some
> GCC builtins emit calls to that function.
> 
> I have reported this issue to upstream uClibc-ng:
> 
>   https://mailman.uclibc-ng.org/pipermail/devel/2020-August/002022.html

This has been implemented already:

commit 8b1f6b2e08ed3c15484c2ca0c3f0a45125c559c1
Author: Waldemar Brodkorb <wbx@openadk.org>
Date:   Mon Aug 17 15:44:58 2020 +0200

    riscv64: add __riscv_flush_icache

    Always use the systemcall as uClibc-ng has no vdso support.
    Tested with libffi and python in qemu-system-riscv64.

This is part of uclibc version 1.0.35.


> 
> Best regards,
> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
