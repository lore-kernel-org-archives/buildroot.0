From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 11:54:36 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: update the ARM
 toolchain used for the systemd init tests
In-Reply-To: <cdfe1139-7a3a-149e-3f56-dddd65e2d038@gmail.com>
References: <20200404220217.362122-1-romain.naour@gmail.com>
 <20200405084428.GJ22325@scaer> <20200405090913.GK22325@scaer>
 <cdfe1139-7a3a-149e-3f56-dddd65e2d038@gmail.com>
Message-ID: <20200405095436.GL22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2020-04-05 11:35 +0200, Romain Naour spake thusly:
> Le 05/04/2020 ? 11:09, Yann E. MORIN a ?crit?:
> > Romain, All,
> > 
> > On 2020-04-05 10:44 +0200, Yann E. MORIN spake thusly:
> >> On 2020-04-05 00:02 +0200, Romain Naour spake thusly:
> >>> As reported on the mailing list, there is a build issue with systemd 245
> >>> when using gcc < 5.0:
> >>> http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html
> > [--SNIP--]
> >>>          BR2_TOOLCHAIN_EXTERNAL=y
> >>> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> >>> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> >>> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
> >> I'd rather we use one of the known pre-built toolchains that is
> >> available from the menuconfig. Unfortiunately, for armv5, we have no
> >> better than the codesourcery one. But for armv7, we have a darn-recent
> >> toolchain from ARM.
> Indeed, If we are agree to use armv7 instead of armv5 for the testsuite we
> should use the ARM arm toolchain.

Will you resend an updated patch series, then? Or do you want me to just
fix it in place while I'm applying your patch?

Note that I am currently runing the test with just this BR2_cortex_a7=y
change, so I can fix it locally if you're okay.

> So it also means that 99,99% of users using the ARM toolchain will use a glibc
> based toolchain. But we are testing with an uClibc-ng toolchain most of the
> time. Maybe we should do more tests with glibc and musl toolchain also with 2
> gcc version (the default version and the latest one) ?

Ececpt in this case, systemd is a glibc-only package to befing with, so
we can't test uClibc or musl anyway.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
