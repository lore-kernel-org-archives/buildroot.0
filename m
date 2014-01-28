From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 23:21:23 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
	needed
In-Reply-To: <20140128231437.22b6a7ee@skate>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
 <20140128231437.22b6a7ee@skate>
Message-ID: <20140128222123.GG3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-28 23:14 +0100, Thomas Petazzoni spake thusly:
> On Sun, 26 Jan 2014 14:56:27 +0100, Yann E. MORIN wrote:
> 
> > +ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(call qstrip,$(KERNEL_SOURCE_CONFIG))),y)
> > +LINUX_DEPENDENCIES += host-lzop
> > +endif
> 
> Do this works reliably? KERNEL_SOURCE_CONFIG typically points to a
> minimal defconfig file (say arch/arm/configs/mvebu_defconfig). So if
> CONFIG_KERNEL_LZO is the default choice for the kernel, it will not
> appear in the defconfig, and therefore the piece of code above will not
> realize that we need host-lzop, because the test is done before "make
> mvebu_defconfig" is executed and turns it back into a full
> configuration file.

I believe I've addresed your comments in the commit log itself:

    ---8<---
    Since LZO is not the default compression option in the kernel (and there
    is not sign that will change in the foreseeable future), it will always
    appear in a condif file, whether it is a complete config file or it is
    only a defconfig.
    ---8<---

Of course, re-reading myself now, I can now spot a typo:
    s/condif/config/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
