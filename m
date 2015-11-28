From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Sat, 28 Nov 2015 17:46:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/skeleton: also handle merged
 /usr in the staging
In-Reply-To: <20151127224800.GB4144@free.fr>
References: <cover.1448575841.git.yann.morin.1998@free.fr>
 <0934812eeec64cb2cdc2b7600879b53695859652.1448575841.git.yann.morin.1998@free.fr>
 <5658DA6B.8040305@mind.be> <20151127224800.GB4144@free.fr>
Message-ID: <CAMOMa6PBdA+Cb2+knyxwi37MfMiLVBEr5KizzW++ja93x9Z+EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Sorry for the delay. I've tested the patch and everything seems ok to me.

Thanks!
Pieterjan

2015-11-27 23:48 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Arnout, All,
>
> On 2015-11-27 23:34 +0100, Arnout Vandecappelle spake thusly:
>> On 26-11-15 23:13, Yann E. MORIN wrote:
>> > When the target uses a merged /usr setup, gdbserver will only report
>> > paths in /lib to the remote gdb, which in turn will only look libraries
>> > in staging/lib and never in staging/usr/lib.
>> >
>> > So. the mreged (or non-merged) /usr setup must be replicated in the
>> > staging.
>> >
>> > The best solution where to do so is in the skeleton package, since it
>> > is guaranteed to come before any package that installs things in the
>> > staging, and even before the (internal or external) toolchain as well.
>> >
>> > Reported-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > Cc: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> > Cc: Peter Korsgaard <jacmet@uclibc.org>
>> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>>  However, this only applies to next - shouldn't we do this on master as well?
>> This will be the first time we release the merged /usr, so we should probably
>> get it right...
>
> Hmmm... Surely this patch was done against master, not next. Or did I
> foobared my tree?... ;-)
>
> Yes, I'd like we get that in master, but I'd like some testing first (of
> course, I did my homework, but a note from the reporter would have been
> great, too).
>
>>  Perhaps this would be a good time to move this to the
>> SKELETON_USR_SYMLINKS_OR_DIRS macro and remove these directories from the skeleton.
>
> *That* would be for next. Or after the release, since it's so close...
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
