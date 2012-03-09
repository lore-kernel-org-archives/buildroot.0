From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 21:12:56 +0100
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <4F5A2E6C.9030202@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-17-git-send-email-luca@lucaceresoli.net>
 <201203072249.40319.yann.morin.1998@free.fr>
 <4F5A2E6C.9030202@lucaceresoli.net>
Message-ID: <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2012 at 5:23 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Yann E. MORIN wrote:
>>
>> Lucas, All,
>>
>> On Wednesday 07 March 2012 21:58:16 Luca Ceresoli wrote:
>>>
>>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>>> ---
>>> ?linux/linux.mk | ? ?2 ++
>>> ?1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>> index ae236d4..e6f2388 100644
>>> --- a/linux/linux.mk
>>> +++ b/linux/linux.mk
>>> @@ -4,6 +4,8 @@
>>> ?#
>>>
>>> ?###############################################################################
>>> ?LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>>> +LINUX_LICENSE = GPLv2-ONLY
>>
>> What's the point of giving the version 'v2' and stating 'only'?
>> I would rather see:
>> ? values ? ? ? ?meaning
>> ? -------------------------------
>> ? GPLv2 ? ? ? ? GPLv2 only
>> ? GPLv2+ ? ? ? ?GPLv2 or later
>> ? LGPLv2.1 ? ? ?LGPLv2.1 only
>> ? LGPLv2.1+ ? ? LGPLv2.1 or later
>> ? ... ? ? ? ? ? ...
>
>
> When a project is GPL-licensed, it usually means it uses "either version X
> of
> the License, or (at your option) any later version". There are rare cases
> (Linux, Busybox, any other?) chose to use a specific version, no later
> version.
>
> So the "default" meaning of "GPLvX" is "GPL version X or later". Those rare
> cases that allow no upgrade are distinguished by adding "only".

I'm not sure this is correct. According to me, if the license file
just specifies GPL version 2, then it really is only version 2.
Only if the license file specifies the text 'or any later version, at
your option', then it is GPLv2+.

I think the distinction GPLv2 / GPLv2+ / GPLv3 / GPLv3+ etc. is
common, and can be reused.
So I agree with Yann here.

>
> This applies for example to:
> - http://en.wikipedia.org/wiki/Linux_kernel
> - http://en.wikipedia.org/wiki/Directfb
> - http://en.wikipedia.org/wiki/Lzop
>
> I prefer to do the same, and use a concise definition for the most frequent
> case. Of course this is a personal preference.
>
> If we wanted to stay on the extra-safe side, we might use:
> ?values ? ? ? ? meaning
> ?-------------------------------
> ?GPLv2-ONLY ? ? GPLv2 only
> ?GPLv2+ ? ? ? ? GPLv2 or later
> ?LGPLv2.1-ONLY ?LGPLv2.1 only
>
> ?LGPLv2.1+ ? ? ?LGPLv2.1 or later
> ?... ? ? ? ? ? ?...
> so there is no ambiguity whatsoever. Might that "+" sign create doubts in
> dummies reading it ("Hey, what's GPLv2+? a super-GPLv2?")?
>
> Your opinions?
>
> Luca
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
