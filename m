From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 12 Dec 2012 11:21:12 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <87d2yhsoh8.fsf@dell.be.48ers.dk>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC9G6xQP=TGX2Oeq8B_ToG+BMQ5DwRpFaMp-af6Sw9RcgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 10, 2012 at 8:20 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>
> Hi,
>
>  >> Large file support isn't select and i have also checked it with make
>  >> uclibc-menuconfig for uclibc.
>  >> The same problem happend with beaglebone_defconfig.
>  >>
>  >> After "make clean" and selecting "large file support" the build process
>  >> works.
>  >>
>  >> This problem doesn't happend with release 2012.08.
>  >>
>  >> Has anybody a hint for me ?
>
>  Willy> I have just had the same problem, is it possible that this is a
>  Willy> regression of the 2012.11 version ?
>
> I don't think so. I just did a:
>
> make at91sam9263ek_defconfig && make
>
> Without any problems. What exactly did you do?

I've the same problem,
I'm using Ubuntu 12.10 32bit.

This configurations doesn't work:

A)
make at91sam9263ek_defconfig && make
https://dl.dropbox.com/u/14668671/log-at91sam9263ek.txt.bz2

B)
defconfig:
BR2_arm=y
BR2_GCC_VERSION_4_7_X=y

https://dl.dropbox.com/u/14668671/log-gcc4.7.txt.bz2

C)
defconfig:
BR2_arm=y

https://dl.dropbox.com/u/14668671/log.txt.bz2


This configuration build fine:
BR2_arm=y
BR2_GCC_VERSION_4_5_X=y

https://dl.dropbox.com/u/14668671/log-gcc4.5.txt.bz2

Best regards
--
Fabio Porcedda
