From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 28 Aug 2012 20:02:01 +0300
Subject: [Buildroot] Some questions about buildroot Target toolchain
In-Reply-To: <20120828175935.4fe0aa87@skate>
References: <CAD4nNjU1cEJvd3LfwnKFDp12_11onm-vTc2JJidtWOz4vLuexg@mail.gmail.com>
 <20120828175935.4fe0aa87@skate>
Message-ID: <503CF989.7060909@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

28.8.2012 18:59, Thomas Petazzoni kirjoitti:
> Hello,
>
> Le Tue, 28 Aug 2012 16:04:42 +0100,
> rechid miloi <in.hiring@gmail.com> a ?crit :
>
>> I've build my own Linux system for X86_64 using Buildroot/uclibc. I've
>> successfully added number of packages : libpam, openldap, clamav,  ...etc.
>> However other package I wanna add can't be cross-compiled, so I decided to
>> compile TARGET_GCC and TARGET_DEVFILE into the system.
> Really, using the toolchain on the target is not the right solution.
> The right solution is to get your "other package" to cross-compile
> properly. What package is it?
>
>> The problem, is when (ld) try to link any object, I got the famous
>> "R_X86_64_PC32" ERROR.
>> I've tried to figure that out by :
>>
>>    - Recompile all buildRoot with : -fPIC -DPIC
>>    - Recompile all BuildRoot with : -pie
>>    - Deactivate binary striping
>>
>> Without any result.
>>
>> However, I've tried to compile the "file" package with 'LDFLAG="-static"'
>> and It worked ! Sincerely I don't know why !
> Maybe because our target toolchain is broken with regard to shared
> libraries or something. Since the target toolchain is not really useful
> (Buildroot is meant to cross-compile things), almost none of the main
> Buildroot developers use it and test it, so we have had repeatedly
> reports of breakage. Unfortunately, none of the people reporting
> breakage, who should be the ones interested by this feature, have
> contributed fixes to improve the situation. At some point, we might
> even consider removing the possibility of generating a toolchain for
> the target in Buildroot, but this remains to be discussed.

I *might* volunteer to fix x86 target toolchain because I know for sure
that I need it in the future
because Im currently making my own uClibc based, buildroot assisted,
distro and that's why
having a native uClibc toolchain is crucial for me.

But not before I have keeped my soon to be starting, 3 weeks vacation.

So please Thomas, don't remove it just yet while im away :)

Stefan
> Best regards,
>
> Thomas
