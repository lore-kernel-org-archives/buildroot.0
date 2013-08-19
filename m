From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2013 18:33:38 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
 sub-menu
In-Reply-To: <201308160839.05082.yann.morin.1998@free.fr>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
 <201308160839.05082.yann.morin.1998@free.fr>
Message-ID: <521248E2.9060702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/08/13 08:39, Yann E. MORIN wrote:
> Thomas, Arnout, All,
>
> On Friday 16 August 2013 08:30:43 Thomas De Schampheleire wrote:
>> On Fri, Aug 16, 2013 at 1:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 15/08/13 22:28, Yann E. MORIN wrote:
>>>>
>>
>>>> diff --git a/arch/Config.in b/arch/Config.in
>>>> index 0b5b218..640926a 100644
>>>> --- a/arch/Config.in
>>>> +++ b/arch/Config.in
>>>> @@ -1,3 +1,5 @@
>>>> +menu "Target options"
>>>
>>>
>>>   I completely agree with the idea - especially in the xconfig, the big list
>>> of architecture options is extremely annoying. However, the menu title is
>>> not very clear. How about "Target architecture selection"? Or maybe
>>>
>>> Target CPU architecture
>>>
>>>    Target CPU architecture family
>>>
>>>    Target CPU architecture variant
>>>
>>
>> Well, I think the menu provides more than just the cpu architecture
>> choice. It includes other things like ABI choice, binary format
>> selection, and floating point strategy. The name 'target options' fits
>> better for these options than anything with 'target cpu architecture'
>> in it, but I'm open for other suggestions.
>
> Ditto.

  I would say that the ABI is part of the CPU architecture - you. An ABI 
choice only exists for compatibility with earlier or different variants 
of the same family. The ABI is typically defined by the CPU designer.

  Other choices in their are (or could be) floating point (neon/vfpv3), 
SIMD extensions, and in the future maybe SoC. All of which I would say 
are CPU architecture options.


>> While we're at reorganizing the top-level menu: I find the order of
>> the menus odd.
> [--SNIP--]
>> I think Bootloaders and Kernel should come earlier in the list and
>> reversed, and Host utilities should be after filesystem images.
>> My proposal is thus:
>> (Target options)
>> Build options
>> Toolchain
>> System configuration
>> Package selection for the target
>> Kernel
>> Bootloaders
>> Filesystem images
>> Host utilities
>> Legacy config options
>>
>> What is your opinion?
>
> I would even put the kernel before the packages, and bootloaders before
> kernel. Ie. I'd use the boot-time order of things:
>      (Target options)
>      Build options
>      Toolchain
>      System configuration
>      Bootloaders
>      Kernel
>      Packages selection
>      Filesystem images
>      Host Utilities
>      Legacy config options
>
> Bizzarely enough, moving bootloaders before kernel seems odd... :-/

  I started to write my own preferred order and it was still different 
:-) So I think there's simply no optimal order. That said, I certainly 
think that the kernel should come before the packages. So I'll ack your 
patch.


  Regards,
  Arnout

 >
>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
