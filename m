From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 15:22:01 +0000
Subject: [Buildroot] FW: [PATCH v5] package/i2c-tools: bump to version 4.0
In-Reply-To: <CA+_SqVZd14XeQ8Quw_se8N12ePYSMffgMH0=QDuegnx4BausHg@mail.gmail.com>
References: <1513257825-9289-1-git-send-email-angelo@amarulasolutions.com>
 <20171215092151.4a43e74c@windsurf.png.is.keysight.com>
 <CA+_SqVYuSiM3_ZixwaMaowY1yaa525+Fj_Hpqup_Qk58ZpMMkQ@mail.gmail.com>
 <20171215151531.1b5a0015@windsurf>,
 <CA+_SqVZd14XeQ8Quw_se8N12ePYSMffgMH0=QDuegnx4BausHg@mail.gmail.com>
Message-ID: <dd04ac7ff52a47b09db62ae0df8b53ac@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensAngelo Compagnucci
Verzonden: vrijdag 15 december 2017 16:21:10 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: Thomas Petazzoni
CC: buildroot at buildroot.org
Onderwerp: Re: [Buildroot] [PATCH v5] package/i2c-tools: bump to version 4.0

Hello,

On Fri, Dec 15, 2017 at 3:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 15 Dec 2017 10:02:27 +0100, Angelo Compagnucci wrote:
>
>> > After 5 or 6 rebuilds of the i2c-tools package this happened.
>> >
>> > Without your patch,
>>
>> You mean before bumping to version 4?
>
> Yes, without your patch, i.e with the current version of i2c-tools in
> Buildroot.

Looking at the git history, the makefile is not changed that much but,
If I remember correctly, it had two bugs:

The first one was with parallel builds and fixed here [1] by the upstream.
The second one was with shared libraries when BR2_STATIC_LIBS is selected.
Imho these bugs were present before version 4.

Want we to keep version 3.1.2?

>> > for i in $(seq 1 100) ; do echo "=== $i ===" ; rm -rf output/build/i2c-tools* ; make i2c-tools || break ; done
>> >
>> > With your patch applied, I've never been able to reach more than 5 or 6
>> > iterations of the loop.
>> >
>> > Could you rework this, and test 100 iterations of building the i2c-tools package ?
>>
>> I built it now 3 times with my 8core machine with various -j settings,
>> unfortunately I cannot reproduce:
>>
>> === 100 ===
>> umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
>> O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. i2c-tools
>
> So you built it 3 times, or 3 times my loop of 100 builds ?

^^^ That "=== 100 ===" means the last row of the output from your loop.
So I run at least 3 times your loop and something more meanwhile.

>> ls build/i2c-tools-4.0/
>> CHANGES  COPYING.LGPL  eeprom    include  Makefile  README  tools
>> COPYING  eeprog        eepromer  lib      py-smbus  stub    version.h
>>
>> Could you give me more details?
>
> Well, I don't have more details to provide: I just build i2c-tools, and
> it fails randomly.
>
> Perhaps I should apply and see what the autobuilders have to say, i.e
> if they agree with you (it builds) or with me (it fails randomly).

I hope it works!

>
> Thomas

[1] https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=a6a59693066fd8da81f7107479df3e32a129247d

> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
