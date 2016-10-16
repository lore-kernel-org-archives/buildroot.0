From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 17:33:19 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
 toolchain-wrapper
In-Reply-To: <CAGszK3iXCpnSiHR5ZkgRJJxY=ZycS32VHpYRpbXdoqQutP8vrQ@mail.gmail.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
 <20161016120510.55c138f0@free-electrons.com>
 <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
 <20161016142837.62bc74ba@free-electrons.com>
 <816e611d-747b-6e15-5aea-1d83f246c43e@imgtec.com>
 <CAGszK3jRhWPP=mxaQTx8kjYjyrymktU4V0NDPp+bxAk40o5zRQ@mail.gmail.com>
 <1f814abc-0446-88f1-7d98-cb309838b060@imgtec.com>
 <CAGszK3iXCpnSiHR5ZkgRJJxY=ZycS32VHpYRpbXdoqQutP8vrQ@mail.gmail.com>
Message-ID: <b9d595a6-5ac5-7692-742b-03596ca68943@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/16 17:19, Jan Heylen wrote:
> I'm using a toolchain coming from Cavium, so you're saying that either
> the toolchain is the issue or it is no longer an issue? It's been some
> time ago that I tested this, let me come back to you later this week.

Ok. Just for the record, no problem with the buildroot internal
toolchain either. dmalloc built for mips64r2 n32 little-endian uclibc-ng.

Regards,

Vincent.

> br,
> 
> Jan
> 
> On Sun, Oct 16, 2016 at 5:15 PM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
>> Hello Jan,
>>
>> I have just built the dmalloc package for mips64r2 n32 little-endian and
>> big-endian without any issue. I have used the "Codescape MTI" external
>> toolchain. Are you using a different toolchain? Please let me know so I
>> can reproduce the problem.
>>
>> Regards,
>>
>> Vincent.
>>
>> On 16/10/16 17:00, Jan Heylen wrote:
>>> For our platform (mips octeon 64 bit but with 32bit userspace:
>>> -mabi=n32), and indeed because of the usage of LD, the compilation
>>> does fail, that is why I added the patches.
>>>
>>> br,
>>>
>>> Jan
>>>
>>> On Sun, Oct 16, 2016 at 2:38 PM, Vicente Olivert Riera
>>> <Vincent.Riera@imgtec.com> wrote:
>>>> Hello Jan,
>>>>
>>>> have you recently seen the dmalloc package failing because of using the
>>>> wrong emulation in ld? Or because using ld instead of gcc for linking,
>>>> in general?
>>>>
>>>> Indeed it uses ld instead of gcc, and that's something that could be
>>>> improved upstream. However, since it's not failing to build for us I
>>>> think there is nothing we need to fix in Buildroot.
>>>>
>>>> Regards,
>>>>
>>>> Vincent.
>>>>
>>>> On 16/10/16 14:28, Thomas Petazzoni wrote:
>>>>> Hello,
>>>>>
>>>>> On Sun, 16 Oct 2016 13:36:19 +0200, Jan Heylen wrote:
>>>>>> So we should fix libdmalloc as well?
>>>>>
>>>>> Vicente is working on this. Do you have references to autobuilder
>>>>> failures on libdmalloc caused by this problem ?
>>>>>
>>>>> Thanks!
>>>>>
>>>>> Thomas
>>>>>
