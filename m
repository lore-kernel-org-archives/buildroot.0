From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Nov 2013 08:45:23 -0300
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <528B9E7C.1010804@mind.be>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
 <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
 <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DFE7183@SI-MBX04.de.bosch.com>
 <528B59FE.6070205@zacarias.com.ar> <528B9E7C.1010804@mind.be>
Message-ID: <528CA0D3.8040906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/19/2013 02:23 PM, Arnout Vandecappelle wrote:

>  Is there any reason why BR2_TARGET_OPTIMIZATIONS isn't used for
> building the C library?

The libc is somewhat fragile when built with some insane CFLAGS, for
instance (e)glibc is built at O2 (by Thomas P), allowing a switch to
another optimization level might be troublesome.
uClibc forces -Os in Rules.mak for BUILD_CFLAGS for example.
I'm unsure if we'd like to open pandora's box by merging them, maybe add
an option just for the libc?
Regards.
