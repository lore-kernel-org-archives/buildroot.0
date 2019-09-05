From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 5 Sep 2019 11:11:52 +0200
Subject: [Buildroot] clang tool-chain support?
In-Reply-To: <c9e70f64-75fc-27a2-7891-bca21f609640@yandex.ru>
References: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
 <f9265f6b-b188-ec04-5fc7-fd5dbb8c932b@smile.fr>
 <f6b14715-2e1b-bf96-9a13-ee70901e3350@yandex.ru>
 <31dec2be-df01-ce24-e2e4-9e379da90c01@smile.fr>
 <c9e70f64-75fc-27a2-7891-bca21f609640@yandex.ru>
Message-ID: <e5603998-8d68-a28f-1d5b-15325b508833@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stas,

Le 04/09/2019 ? 21:09, stsp a ?crit?:
> Hi,
> 
> 04.09.2019 10:38, Romain Naour ?????:
>>>> Also, there are some questions about clang toolchain:
>>>>
>>>> "The long-term goal is to have a complete clang-based toolchain. The usefulness
>>>> of this is questionable however." [1]
>>>>
>>>> If clang can be used as a toolchain,
>>> I suppose it definitely can, at least for some configurations.
>>> For others it won't be selectable (for example).
>> I mean "If clang can be used as a toolchain by Buildroot".
>> I believe it can but needs some work especially for building userspace programs.
> 
> 
>> For now, Buildroot can't import a prebuit clang toolchain as external toolchain.
> 
> OK, I see...
> Thanks for the info and detailed explanations
> of the problem. I guess the search path differences
> is not the only problem here.
> Since clang support is not even here:
> https://www.elinux.org/Buildroot#Todo_list
> I don't expect it to appear any soon. :(

Well, the todolist is not very exhaustive. Most of the time, a new package or
functionality is contributed without being listed in the todolist :)

Yesterday I found a new article on lowrisc blog about clang testing for RISC-V
architecture with Buildroot [1].

Also you can fine articles about llvm/clang integration into Buildroot [2] and
kernel build [3].

[1]
https://www.lowrisc.org/blog/2019/07/large-scale-risc-v-llvm-testing-with-buildroot

[2] http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot
[3]
http://www.linuxembedded.fr/2019/08/my-first-linux-kernel-built-with-clang-compiler/


> 
> 
>> Well, that's probably true for gcc... sometime we can report a bug without
>> having a reply for a long time.
>>
>> At least for Binutils and Glibc this is not the case, we had some feedback from
>> maintainers when needed :)
> 
> Indeed, and musl too. :)

+1 :)

> 
> 
>> Ok I made a mistake here. nasm is a host only package.
> 
> That would be what I need.
> 
> 
>> Ok, you mean nasm for the target.
> No-no, I meant host.
> But do you mean the host packages are not
> searchible in the menuconfig? I.e. I searched
> with '/' for nasm and found nothing.
> So I suppose it just cannot be disabled by menuconfig,
> and as such, is not listed there?
> yasm on target and nasm on host is a perfect
> combination, I just can't find where to enable the
> host nasm.

Ok, actually host nasm exist for the host but the dependency is pulled by
packages that need it at build time. grep for host-nasm in the tree.

Actually there is a discussion about adding a config symbol for all host
packages, see:

https://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2019#.22Config.in.host.22_for_all_host_packages

It's the same for yasm. if you want it for the host, you can't select it by
using menuconfig.

There is an entry "Host utilities" in the menuconfig but the list of host
packages are not complete.

See "17.2.2. Config.in.host file"

http://nightly.buildroot.org/manual.html#_config_files

So, if host-nasm is useful for you and you need to select it from the menuconfig
you can contribute a patch adding the Config.in.host file :)

Best regards,
Romain
