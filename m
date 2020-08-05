From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 5 Aug 2020 16:36:12 +0200
Subject: [Buildroot] Status of LLVM
In-Reply-To: <31f39a1d-1436-0952-43e8-561135e6aa60@gmail.com>
References: <CAGt4E5vRu+xVXtaze8+6CmWFXSmzJx2PV46bC7STiDnKCqksRw@mail.gmail.com>
 <31f39a1d-1436-0952-43e8-561135e6aa60@gmail.com>
Message-ID: <e54d173f-533b-1abf-1b74-ea8286fe88a2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

Le 01/08/2020 ? 02:59, Romain Naour a ?crit?:
> Hello Markus,
> 
> Le 01/08/2020 ? 02:20, Markus Mayer a ?crit?:
>> Hi all,
>>
>> Looking through the mailing list archives, I found a patch series
>> proposed last September to support clang as cross-compiler.
>>
>> http://lists.busybox.net/pipermail/buildroot/2019-September/258744.html
>>
>> It seems that most patches from this series haven't been pulled into
>> mainline as of yet. What is the current status of using LLVM and clang
>> to build Buildroot? As far as I can tell, there doesn't seem to be
>> support for this right now. What are the plans going forward?
> 
> Thanks for your interest for this series!
> For now, we only have llvm/clang packages to deploy libraries on the target.
> This allow to enable llvm-pipe and opencl (libclc) support on the target.
> 
> The first patch of this series needs to be upstreamed:
> http://patchwork.ozlabs.org/project/buildroot/patch/20190907094027.9537-2-romain.naour at smile.fr/
> 
> It seems that llvm doesn't work well with toolchain using a relocated sysroot
> (--sysroot).
> 
> The rest of the series allow using clang as cross-compiler in all package
> infrastructure and for the Linux kernel.
> 
> This series should be completed by the compiler-rt from Matthew Weber:
> 
> http://patchwork.ozlabs.org/project/buildroot/list/?series=181074
> 
> We also had a discussion about using clang as native compiler
> (related to
> https://git.buildroot.net/buildroot/commit/?id=546a4e1c1f5e219566469511c998ec7c7152e5ee)
> 
> It would be interesting to enable riscv support for llvm/clang.
> 
> But it require some time to work on it, and most of this work has been done on
> spare time.

Last year I was able to build an aarch64 system with clang 8 (rootfs + kernel)
on a Potato Board.

Recently I tried again with a riscv64 target running under qemu:

https://asciinema.org/a/DDspJVktlVl1Rh97dwLgtYcRY

Clang: 10.0
kernel: 5.7.12
Busybox: 1.31.1 + patch
gcc toolchain: Bootlin riscv64--glibc--bleeding-edge-2020.02-2.defconfig

I need some time to continue to work on this series and convince upstream to add
cland support in Buildroot. But it means more maintenance work for Buildroot
maintainers/contributors to fix all packages that fail to build with clang.
At least, we need to enable autobuilders testing with clang if this support is
added.

Best regards,
Romain

> 
> Best regards,
> Romain
> 
>>
>> Thanks,
>> -Markus
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
