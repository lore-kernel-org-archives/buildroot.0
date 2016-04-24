From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 24 Apr 2016 19:42:35 +0200
Subject: [Buildroot] [PATCH] package/mono: Disabling for sparc32
In-Reply-To: <20160424172304.11d30f33@free-electrons.com>
References: <1461507387-2966-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160424172304.11d30f33@free-electrons.com>
Message-ID: <CA+TH9V=-d3k7U11mpfz=EVuNHFAJZRqwqzNRZppMSNrEF=xvnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2016-04-24 17:23 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sun, 24 Apr 2016 16:16:27 +0200, Angelo Compagnucci wrote:
>> Mono cannot be compiled for sparc32 (v8/leon) so disabling it.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  package/mono/Config.in | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>>       default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
>> -                   BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
>> +                   BR2_mipsel || BR2_powerpc || BR2_sparc64 || BR2_x86_64)
>
> And you're enabling for sparc64 at the same time, which is not
> explained in your commit log.

Mmm, right.

>
> Also, Waldemar sent a patch one hour before that disables it for SPARC,
> without enabling it for SPARC64, because it also doesn't build for
> SPARC64.

The problem is this one:

"cannot find crti.o: No such file or directory"

Suggesting me the problem is located more in the toolchain than in
mono for sparc64, but I have no clue on this.

Sincerely, Angelo

>
> So I've marked your patch as Rejected in our patch tracking system.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
