From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 28 Mar 2018 16:18:15 -0700
Subject: [Buildroot] Build for sama5d3 mmc doesn't boot
In-Reply-To: <CANQCQpaS8XOo6QsuBG8XhsD8UJFyf8PMyKisNczqaTDygdAVzA@mail.gmail.com>
References: <CANQCQpaS8XOo6QsuBG8XhsD8UJFyf8PMyKisNczqaTDygdAVzA@mail.gmail.com>
Message-ID: <192a79cb-8ed7-291e-c91e-feac05d51453@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew,

On 03/28/2018 02:53 PM, Matthew Weber wrote:
> Using buildroot LTS 2018.02
> 
> 
> I built the atmel_sama5d3_xplained_mmc_dev_defconfig using the linaro
> 2017.11 GCC7 toolchain and I only see the following output when I try
> to boot from the SDCard.
> 
> RomBOOT
> 
> AT91Bootstrap 3.8.9 (Wed Mar 28 08:52:16 CDT 2018)

I can reproduce.  This is fixed in at91bootstrap v3.8.10.  See here [1].
Give me a bit to do some more testing and I'll update the defconfigs.
In the meantime, if you're trying to get past this, set 
BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10" and you should
be good to go.

[1]: https://github.com/linux4sam/at91bootstrap/commit/fb47cd7e5fddf8b924d92ede1da61d416e7ef81c

> 
> 
> 
> I've kicked off another build defaulting back to a buildroot toolchain
> (GCC6.x) and glibc.
> 

This works (for now).  The issue is gcc >= 7.

Josh
