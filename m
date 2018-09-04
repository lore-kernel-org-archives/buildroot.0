From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 4 Sep 2018 15:44:11 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <fd90a1b0-3bf4-d5fb-b320-87495d1f46e9@mind.be>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
 <8e07a0c3-6132-c94c-5732-fc48339878bf@embecosm.com>
 <de6c6241-cffd-e5b4-c25b-2849399fa3c1@mind.be>
 <20180904094954.0af85c8e@windsurf>
 <fd90a1b0-3bf4-d5fb-b320-87495d1f46e9@mind.be>
Message-ID: <ff4dc3ce-3088-c35a-4527-c8a4c7b0befd@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 04/09/18 09:51, Arnout Vandecappelle wrote:
>
>>>>> Provided this, I think we should not allow enabling/disabling RVA: we
>>>>> should assume it's always enabled.  
>>>> I will force the selection of RVA for now, but will still show it in the
>>>> architecture options. It is possible that it could be come optional at
>>>> some point in the future.  
>>>  I would keep the option and make it blind (i.e. remove the prompt).
>>>
>>>  Keep the conditions in the C library selection as well, of course. The comment
>>> will never be shown, but it's already there fo when the atomics extension does
>>> become optional.
>> Meh, I'm not so sure. Is it likely that glibc adds support for
>> platforms without the atomic operations ? I'm not so sure. So I'd
>> rather not support it all for now, and add it when/if that becomes
>> available.
>  I don't think it's likely that glibc will add support for non-atomic variants.
> I do think it's likely that uClibc will do that. When uClibc for riscv is added
> (and it supports non-atomic), we *do* want to see the comment for glibc.
>
>  However, I'm going to back off from my earlier position. The rule in Buildroot
> is: don't add anything that is not useful right away, only add it when it is
> actually going to be used.
>
>  The RVA option itself is used, but the comment isn't (it can never become
> visible). So drop the comment.
>
>
>> Perhaps we could make the option visible, but forcefully selected by
>> the BR2_riscv option, so that in practice it cannot be disabled.
>  Well, that was your original suggestion, and my suggestion was: make the option
> invisible. I really don't see the point of a user-visible option that you can't
> (de)select.
>
>  Regards,
>  Arnout

I'm in favour of a user-visible option that you can't disable...I like
the fact that I can see which optional architecture ISA extensions have
been selected/used to build the toolchain and filesystem (without having
to look in .config).

*** Instruction Set Extensions ***
[ ] Integer Multiplication and Division (M) (NEW)
-*- Atomic Instructions (A)
[ ] Single-precision Floating-point (F) (NEW)
[ ] Compressed Instructions (C) (NEW)

Regards

Mark
-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
