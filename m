From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Dec 2020 16:15:02 +0100
Subject: [Buildroot] [PATCH v4 2/4] package/bcc: new package
In-Reply-To: <20201217184437.lg3byn2xasaokeqw@e107158-lin.cambridge.arm.com>
References: <20201107002836.3101760-1-romain.naour@gmail.com>
 <20201107002836.3101760-2-romain.naour@gmail.com>
 <20201129151406.neufl54p6pjiraux@e107158-lin.cambridge.arm.com>
 <bbccfc8c-1210-8e8b-02d4-920dba6a3810@gmail.com>
 <20201217184437.lg3byn2xasaokeqw@e107158-lin.cambridge.arm.com>
Message-ID: <d4cd4f62-ecea-f173-6f57-c4f779457009@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Qais,

Le 17/12/2020 ? 19:44, Qais Yousef a ?crit?:
> Hi Romain
> 
> Sorry this slipped through the cracks :(

no problem :)

> 
> On 12/06/20 17:59, Romain Naour wrote:
> 
> [...]
> 
>>>
>>>> - Remove python module install hook (Quais)
>>>> - Keep BCC_LINUX_CONFIG_FIXUPS but only for kernel built by Buildroot.
>>>
>>> I still think this will be a maintenance headache. Are you sure you want to
>>> continue to maintain this list of fixups for all kernel versions given how fast
>>> ebpf moves?
>>
>> This option is only used when you build the kernel with Buildroot.
>> At some point ebpf kernel options must be stable.
>>
>> Also the bcc project provide this list of kernel options, so we can follow their
>> requirements:
>> https://github.com/iovisor/bcc/blob/master/INSTALL.md#kernel-configuration
>>
>> You can search for LINUX_CONFIG_FIXUPS usage in the Buildroot tree, we can
>> notice that some packages requires some kernel options.
>> Why not to do so with bcc ?
> 
> Fair enough. It was more of a question if we really want that than an objection
> really. As long as this conditional on building the kernel within buildroot
> I have no problem really. I build the kernel myself so wouldn't be affected
> by this.
> 
>>> I still this the Clang build error for i386, x86_64, arm and arm64
>>>
>>> 	/usr/bin/ld: CMakeFiles/libclang.dir/CIndexer.cpp.o: in function `clang::CIndexer::getClangResourcesPath[abi:cxx11]()':
>>> 	CIndexer.cpp:(.text._ZN5clang8CIndexer21getClangResourcesPathB5cxx11Ev+0x9b): undefined reference to `dladdr'
>>> 	collect2: error: ld returned 1 exit status
>>> 	make[4]: *** [tools/libclang/CMakeFiles/libclang.dir/build.make:395: lib/libclang.so.9] Error 1
>>> 	make[3]: *** [CMakeFiles/Makefile2:8451: tools/libclang/CMakeFiles/libclang.dir/all] Error 2
>>>
>>> I had a hacky patch for that in my series. Should we just report this to the
>>> clang package maintainer in buildroot? I'm assuming you're not hitting it,
>>> right?
>>
>> Guess who is one of the clang package "maintainer" in Buildroot :p
>> (use ./utils/get-developers -p clang)
> 
> Yeah I saw that after I sent the email and wanted to report it. I realized then
> I actually did ;-)
> 
>>
>> I'm not able the reproduce this issue. Are you using uclibc toolchain ?
> 
> No, Glibc.
> 
>> Also, the Buildroot autobuilder didn't report such error, I receive autobuilder
>> failure directly to my mail in-box.
>>
>>>
>>> I was based on 2020.08.2 tag.
>>
>> Clang is still at  9.x release so we have this version since a while.
>>
>>>
>>> I couldn't fully test this series yet because of this error.
>>
>> Please, share your defconfig.
> 
> Attached. I'll try to dig more into it. Anyway this issue shouldn't be
> a blocker and can be fixed separately.

Sorry, but I can't reproduce here with your defconfig.
I did a full rebuild using the patch series applied.

> 
> I'll test and review v5 and hopefully it should be good to be accepted.

I just sent a new version with your tested/reviewed tag.

Best regards,
Romain


> 
> Thanks
> 
> --
> Qais Yousef
> 
