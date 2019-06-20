From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 20 Jun 2019 18:13:24 +0100
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu_riscv32_virt: Update to
 5.1 kernel
In-Reply-To: <CAKmqyKMudH+KpKrF3kwkK6SudHt0Ysg_v1JnBS_BO9jXk3DR+g@mail.gmail.com>
References: <20190619165406.19615-1-alistair.francis@wdc.com>
 <20190619165406.19615-2-alistair.francis@wdc.com>
 <20190620155715.23c40f26@windsurf>
 <CAKmqyKMudH+KpKrF3kwkK6SudHt0Ysg_v1JnBS_BO9jXk3DR+g@mail.gmail.com>
Message-ID: <58cf6eb8-6e90-1a36-1339-ba5a12c51cad@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair

On 20/06/2019 18:01, Alistair Francis wrote:
> On Thu, Jun 20, 2019 at 6:57 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> On Wed, 19 Jun 2019 09:54:06 -0700
>> Alistair Francis <alistair.francis@wdc.com> wrote:
>>
>>>  # Kernel
>>>  BR2_LINUX_KERNEL=y
>>>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
>>> -BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>>> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config.fragment"
>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
>>> +BR2_LINUX_KERNEL_DEFCONFIG="rv32"
>>> +BR2_LINUX_KERNEL_PATCH="board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch"
>> We prefer using the BR2_GLOBAL_PATCH_DIR mechanism nowadays, so I've
>> adjusted your patch to use that and applied. Thanks!
> The BR2_GLOBAL_PATCH_DIR system looks really cool, I'll be sure to use
> that next time. Thanks
>
> Alistair

I can't get the updated 32-bit QEMU configuration to build - there is a
problem with glibc...

In file included from ../sysdeps/unix/sysv/linux/lowlevellock-futex.h:23:0,
???????????????? from ../sysdeps/nptl/lowlevellock.h:23,
???????????????? from ../sysdeps/nptl/libc-lockP.h:33,
???????????????? from ../sysdeps/nptl/libc-lock.h:184,
???????????????? from gconv_db.c:26:
gconv_db.c: In function '__gconv_find_transform':
../sysdeps/unix/sysv/linux/riscv/sysdep.h:120:31: error: '__NR_futex'
undeclared (first use in this function); did you mean
?'__futex'?

The updated 64-bit version works without any problems.

Is there an issue with the patch revert for glibc?

Thanks

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
