From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Feb 2021 17:12:29 +0100
Subject: [Buildroot] [PATCH 24/25] support/config-fragments/autobuild:
 use Bootlin toolchain for Xtensa uclibc
In-Reply-To: <cfj2fhx195.ln2@ID-313208.user.individual.net>
References: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
 <20210202225339.2157480-25-thomas.petazzoni@bootlin.com>
 <cfj2fhx195.ln2@ID-313208.user.individual.net>
Message-ID: <20210206171229.6d045307@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 06 Feb 2021 14:51:08 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> > --- /dev/null
> > +++ b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
> > @@ -0,0 +1,3 @@
> > +BR2_xtensa=y
> > +BR2_TOOLCHAIN_EXTERNAL=y
> > +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y  
> 
> Hi Thomas,
> 
> this toolchains breaks building libmicrohttpd:
> http://autobuild.buildroot.net/?reason=libmicrohttpd-0.9.72
> 
> "mhd_byteorder.h:161:2: error: #error Configure detected big endian byte 
> order but headers specify different byte order"
> 
> because gcc describes itself as little endian:
> 
> $ output/host/bin/xtensa-linux-gcc -E -dD -xc /dev/null | grep BYTE
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> 
> although the defconfig is big endian
> 
> $ grep ENDIAN .config
> BR2_ENDIAN="BIG"

Thanks for reporting, I'll have a look at that!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
