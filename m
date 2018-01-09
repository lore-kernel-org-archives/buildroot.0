From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue, 9 Jan 2018 13:54:16 +0100
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib: add function to
 check of the default package source variable
In-Reply-To: <20180109095028.286b1ecd@windsurf>
References: <20180108234802.42d06229@windsurf>
 <5a5423b8d08a0_5241d7ae4c960fb@ultri3.mail>
 <20180109095028.286b1ecd@windsurf>
Message-ID: <6485da6f-f32a-5f81-b327-2757c8282909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello,
>
> +Yegor in Cc, since there is some scanpypi discussion below.
>
> On Tue, 09 Jan 2018 00:06:48 -0200, Ricardo Martincoski wrote:
>
>> Unrelated... but I see there are few more (other) warnings in the tree.
>>
>>
>> 1) daq
>> A patch fixing this (removing the unneeded variable) ideally should be added to
>> the series because it is tested in gitlab.
> I fixed this one.
>
>> 2) glibc
>> It's a special package, but the removal of the variable seems fine to me (needs
>> testing of course).
> I think it can be changed indeed, but I haven't tested it.
>
>> 3) python-networkmanager
>> I guess the variable can be removed. Could it interact with scanpypi? Do we
>> care if it does interact?
>> By 'interact' I mean: when someone uses scanpypi to create a package should
>> he/she use check-package after it?
> I fixed this one as well. I guess scanpypi could be improved to not
> emit the <pkg>_SOURCE line when its value is the default one.
>
>> For these 2 I am not sure which one is the best solution: fix or whitelist.
> Fix :-)
>
>> 4) gdb
>> The variable is overwritten for ARC. Would removing the variable make the code
>> worst in this case? The 'if' would need to be negated, and the non-default
>> value be assigned for not-ARC, I guess.
>>
>> 5) binutils
>> It has '?=' later for the same variable. I am not sure the first assignment can
>> be removed.
>>
>> 6) gcc
>> Maybe we want it to be explicit to ease the maintenance? Not sure.
>>
>> These 3 are good candidates for a whitelist.
> Yes, agreed. Jerzy, could you send an updated patch that takes into
> account Ricardo's comments, including whitelisting gdb/binutils/gcc ?

Sure, I send it in the next few days.

Regards,
Jerzy

>
> Thanks!
>
> Thomas
