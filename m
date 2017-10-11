From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 17:34:25 +0200
Subject: [Buildroot] [PATCH 1/9] iMX6S-PICO: add default config file
 (imx6spico_defconfig)
In-Reply-To: <CAKrb2soZLWtymDeToLxPmk=Vtdt0E+wT5KHMcCa6x-BLukSCaQ@mail.gmail.com>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
 <20171011151725.54ba232c@windsurf.lan>
 <CAKrb2srEz1UeT-RJgY7NCEDp28OX7xGq=JD5qOvR_eZBkkahKg@mail.gmail.com>
 <20171011164908.3cc14130@windsurf.lan>
 <CAKrb2soZLWtymDeToLxPmk=Vtdt0E+wT5KHMcCa6x-BLukSCaQ@mail.gmail.com>
Message-ID: <20171011173425.175f716e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please do not reply just to me, keep the mailing list in Cc by using
"Reply All" instead of "Reply". Thanks. I've re-added the mailing list
in Cc.

On Wed, 11 Oct 2017 17:32:08 +0200, Alexandre Gambier wrote:

> > > If I use the latest GCC version, it fails building the root fs.  
> >
> > With what error? We definitely want to fix this, and not paper over the
> > problem by reverting back to gcc 5.x.
> >  
> 
> It fails building uboot here's the log...

Ok, so it doesn't fail when building the rootfs, but when building
U-Boot.


> scripts/kconfig/conf --silentoldconfig Kconfig
>   CHK     include/config.h
>   UPD     include/config.h
>   GEN     include/autoconf.mk
>   GEN     include/autoconf.mk.dep
>   GEN     spl/include/autoconf.mk
> In file included from include/linux/compiler.h:54:0,
>                  from include/linux/byteorder/little_endian.h:12,
>                  from ./arch/arm/include/asm/byteorder.h:29,
>                  from include/compiler.h:125,
>                  from include/image.h:19,
>                  from ./include/common.h:82:
> include/linux/compiler-gcc.h:114:30: fatal error: linux/compiler-gcc6.h: No
> such file or directory

This is known issue with old versions of U-Boot.

You can try adding
board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch
as a U-Boot patch, or preferably update your U-Boot to a more recent
version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
