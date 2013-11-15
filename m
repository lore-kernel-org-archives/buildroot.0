From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 11:10:35 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
Message-ID: <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Nov 15, 2013 at 11:05 AM, Altunbas Sabri (DC-IA/EAH2)
<sabri.altunbas@boschrexroth.de> wrote:
> Hallo Thomas,
>
>> Do you have the same error without those options?
>
> No, without these options I can create my rootfs very well
>

Then I think this problem is not buildroot related.

From the gcc manual, though:
       -mdalign
           Align doubles at 64-bit boundaries.  Note that this changes
the calling conventions,
           and thus some functions from the standard C library will
not work unless you recompile it
           first with -mdalign.

I don't know if this could cause an internal compiler error, but it
seems anyway that you won't be able to use a pre-compiled toolchain
and pass that -mdalign option...

Best regards,
Thomas
