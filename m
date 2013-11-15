From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 11:38:59 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
 <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
Message-ID: <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 15, 2013 at 11:25 AM, Altunbas Sabri (DC-IA/EAH2)
<sabri.altunbas@boschrexroth.de> wrote:
> Hi Thomas,
>
> Thanks, this is a helpfull hint.
>
> Have I the solution If I take buildroot-toolchain ?

You could build the toolchain entirely with buildroot yes, and make
sure that you pass the new options when compiling the toolchain. As
far as I can see, BR2_TARGET_OPTIMIZATIONS is not respected when
building the toolchain itself. I think you need
BR2_EXTRA_GCC_CONFIG_OPTIONS for that.

An alternative is to use crosstool-ng to build the toolchain, but of
course you'll have to make sure that the options are passed there as
well.

Best regards,
Thomas
