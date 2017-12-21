From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 21 Dec 2017 12:35:04 +0100
Subject: [Buildroot] [PATCH v5] package/i2c-tools: bump to version 4.0
In-Reply-To: <20171218115150.71216129@windsurf>
References: <1513257825-9289-1-git-send-email-angelo@amarulasolutions.com>
 <20171215092151.4a43e74c@windsurf.png.is.keysight.com>
 <CA+_SqVYuSiM3_ZixwaMaowY1yaa525+Fj_Hpqup_Qk58ZpMMkQ@mail.gmail.com>
 <20171215151531.1b5a0015@windsurf>
 <CA+_SqVZd14XeQ8Quw_se8N12ePYSMffgMH0=QDuegnx4BausHg@mail.gmail.com>
 <20171218115150.71216129@windsurf>
Message-ID: <CA+_SqVaBU5BbuyFWZ3ZJvvwLTTS2nQ1BYc5MfvMuNwXoWLkRBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Dec 18, 2017 at 11:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 15 Dec 2017 16:21:10 +0100, Angelo Compagnucci wrote:
>
>> > Yes, without your patch, i.e with the current version of i2c-tools in
>> > Buildroot.
>>
>> Looking at the git history, the makefile is not changed that much but,
>> If I remember correctly, it had two bugs:
>>
>> The first one was with parallel builds and fixed here [1] by the upstream.
>> The second one was with shared libraries when BR2_STATIC_LIBS is selected.
>> Imho these bugs were present before version 4.
>>
>> Want we to keep version 3.1.2?
>
> No we want to bump, but not if that introduces regressions.
>
>> >> === 100 ===
>> >> umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
>> >> O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. i2c-tools
>> >
>> > So you built it 3 times, or 3 times my loop of 100 builds ?
>>
>> ^^^ That "=== 100 ===" means the last row of the output from your loop.
>> So I run at least 3 times your loop and something more meanwhile.
>
> OK. Weird.
>
>> >> ls build/i2c-tools-4.0/
>> >> CHANGES  COPYING.LGPL  eeprom    include  Makefile  README  tools
>> >> COPYING  eeprog        eepromer  lib      py-smbus  stub    version.h
>> >>
>> >> Could you give me more details?
>> >
>> > Well, I don't have more details to provide: I just build i2c-tools, and
>> > it fails randomly.
>> >
>> > Perhaps I should apply and see what the autobuilders have to say, i.e
>> > if they agree with you (it builds) or with me (it fails randomly).
>>
>> I hope it works!
>
> I'd like someone else in the Buildroot community to test your patch and
> see if the parallel build problems are also reproducible. Anyone
> available to test Angelo's patch?

I'm doing some other tests and now I'm hitting a parallel build issue,
so you were right!
Solving it as soon as possible!

Thanks!

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
