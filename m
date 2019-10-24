From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 22:05:28 +0200
Subject: [Buildroot] [RFC PATCH v2 06/30] lld: new package
In-Reply-To: <CAMWSM7izyfDRC+kL+3WYGLY=ZtDRiProermKKk_bG6b6HLa9VQ@mail.gmail.com>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-7-michael.drake@codethink.co.uk>
 <86e76345-b5eb-76b1-ed81-ccaa36b205de@mind.be>
 <31d8a2ba-40a9-011a-69a1-5858872d0734@smile.fr>
 <80aab2a9-4a7b-b118-b1cf-c6760aa33517@smile.fr>
 <CAMWSM7izyfDRC+kL+3WYGLY=ZtDRiProermKKk_bG6b6HLa9VQ@mail.gmail.com>
Message-ID: <ec315691-c0bc-602c-783b-06bccac1963c@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

Le 24/10/2019 ? 21:56, Joseph Kogut a ?crit?:
> On Thu, Oct 24, 2019 at 12:38 PM Romain Naour <romain.naour@smile.fr> wrote:
>>
>> Le 24/10/2019 ? 21:35, Romain Naour a ?crit :
>>> Hi Arnout,
>>>
>>> Le 20/10/2019 ? 00:39, Arnout Vandecappelle a ?crit :
>>>>> +++ b/package/lld/Config.in.host
>>>>> @@ -0,0 +1,16 @@
>>>>> +config BR2_PACKAGE_HOST_LLD
>>>>> +   bool "host lld"
>>>>> +   depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
>>>>> +   depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
>>>>> +   select BR2_PACKAGE_HOST_LLVM
>>>>
>>>>  I'm confused now... I thought the previous patch would be needed to support
>>>> lld, but you don't select BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH here, so the
>>>> option introduced in the previous patch is not used at all... Why is that patch
>>>> needed then?
>>>>
>>>>
>>>>  Also, in Joseph's original submission, [1] was included. Now it is no longer
>>>> there. Was it not needed after all?
>>>>
>>>>  Anyway, I think I'll apply Joseph's original patch now.
>>>
>>> Thanks for merging lld :)
>>>
>>> But lld package needs to be at the same version as llvm (currently 9.0.0).
>>> lld package was sent to the mailing list at the time where llvm package was
>>> using 8.0.0.
>>>
> 
> I've been getting emails about the build failures, and I arrived at
> the same conclusion yesterday. If nobody else is working on this, I
> can send patches in to fix these issues later today.

Bumping the package version is easy, I'm doing it right now.
But I don't have time to do a runtime test, can you do it?

Best regards,
Romain

> 
>>> I'm not sure how it's related but the are some build issues with host-lld package:
>>> http://autobuild.buildroot.org/results/9a0/9a0534c4206b40963d32494ff9675543e78125d1/build-end.log
>>
>> It's related, there is a refactoring in llvm.
>> See:
>> https://github.com/llvm-mirror/lld/commit/66fca3a6b8cc0112a4c72237ffaea5eb4b659e3f
>>
>> Best regards,
>> Romain
>>
>>>
>>> I believe we need to bump lld version and add a small comment like for llvm and
>>> clang package.
>>>
>>> Best regards,
>>> Romain
>>>
>>>>
>>>>
>>>>  Regards,
>>>>  Arnout
>>>>
>>>> [1] http://patchwork.ozlabs.org/patch/1136469/
>>>>
>>
> 
> Additionally, it seems we need to apply a similar fix to 2a17fb6 to
> LLD, enabling LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN to fix build issues
> with GCC versions between 4.8 and 5.1.
> 
