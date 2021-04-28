From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 28 Apr 2021 18:42:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <2BECD4AC-08A6-47CF-BA24-ED362C358095@c-sky.com>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <20210426194329.GL298901@scaer>
 <ad394a6c-1ec6-0659-51b6-c7704110c71a@mind.be>
 <6372bec9-db43-6dbf-4b93-706b399bd072@gmail.com>
 <2BECD4AC-08A6-47CF-BA24-ED362C358095@c-sky.com>
Message-ID: <8ecf3857-d9de-86c8-3d76-b55d0a8343f8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo, Han,

Le 28/04/2021 ? 16:33, Guo Ren a ?crit?:
> 
> 
> Best Regards
>   Guo Ren
> 
> 
> 
>> ? 2021?4?27????4:05?Romain Naour <romain.naour@gmail.com> ???
>>
>> Hello Arnout,
>>
>> Le 27/04/2021 ? 09:25, Arnout Vandecappelle a ?crit :
>>>
>>>
>>> On 26/04/2021 21:43, Yann E. MORIN wrote:
>>>> Arnout, Romain, All,
>>>>
>>>> On 2021-04-26 21:36 +0200, Arnout Vandecappelle spake thusly:
>>>>> On 26/04/2021 12:10, Romain Naour wrote:
>>>>> [snip]
>>>>>> rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
>>>>>> rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
>>>>>> rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>>>>>> rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)
>>>>>
>>>>> Now you're messing with these packages, maybe you can take the opportunity to
>>>>> get rid of the versioned subdirectory. That's a leftover from when we had
>>>>> version selection for glibc.
>>>>
>>>> We stil have a version choice for glibc; it's just not exposed to the
>>>> user: indeed we use different version for csky, riscv32, and the rest.
>>>>
>>>> So, we still do not want to apply the "generic" patches to the csky
>>>> fork, or to the riscv32 version...
>>>
>>> Ah, I missed the csky fork... The riscv32 one should be gone, so I thought that
>>> was it.
>>
>> The csky for is based on glibc 2.28 but csky was added to glibc 2.29
>>
>> https://sourceware.org/git/?p=glibc.git;a=commit;h=5f72b00591ce4d1b4c0418294ffe1623983d5679
>>
>> Maybe we can use upstream glibc?
> Cc glibc csky maintainer: Mao Han <han_mao@linux.alibaba.com> 

Same for binutils. We are using an old fork of binutils 2.27 for csky but we can
use binutils 2.32 to 2.36.
Please, help us to use upstream version.

> 
>> But we can't test with our Qemu version since csky is not yet upstream, we can
>> retrieve the csky qemu fork we had last year.
>>
> C-SKY qemu test:
> https://gitlab.com/c-sky/buildroot/-/jobs/1190489794
> 
> You can get qemu:
> https://gitlab.com/c-sky/buildroot/-/blob/master/package/qemu-enhanced/qemu-enhanced.mk

This is a prebuilt qemu binary I can use locally but it would be great if qemu
for csky could be built from sources.
Do you know if there is some news about csky contribution to Qemu ?

Best regards,
Romain
