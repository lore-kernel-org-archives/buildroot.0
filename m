From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sat, 17 Sep 2011 21:37:07 +0200
Subject: [Buildroot] [PATCH 2/2] package: add openocd support
In-Reply-To: <87vcszh1zi.fsf@macbook.be.48ers.dk>
References: <1312911561-23942-1-git-send-email-plagnioj@jcrosoft.com>
 <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
 <87vcszh1zi.fsf@macbook.be.48ers.dk>
Message-ID: <20110917193707.GB16141@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11:17 Sun 11 Sep     , Peter Korsgaard wrote:
> >>>>> "JC" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  JC> with only the following Adapters
>  JC>  - FTDI FT2xxx/FT4xxx
>  JC>  - J-Link (Segger and Atmel SAM-ICE)
>  JC>  - Versaloon-Link JTAG Adapter
> 
> Doesn't seem to build here:
> 
> grep OPENOCD .config
> BR2_PACKAGE_OPENOCD=y
> # BR2_PACKAGE_OPENOCD_FT2XXX is not set
> # BR2_PACKAGE_OPENOCD_JLINK is not set
> # BR2_PACKAGE_OPENOCD_VSLLINK is not set
> 
> /home/peko/source/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../../.. -I../../../src -I../../../src -DPKGDATADIR=\"/usr/share/openocd\" -DPKGLIBDIR=\"/usr/lib/openocd\" -I../../../jimtcl -I../../../jimtcl -pipe -Os -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include -Wall -Wstrict-prototypes -Wformat-security -Wshadow -Wextra -Wno-unused-parameter -Wbad-function-cast -Wcast-align -Wredundant-decls -Werror -MT bitbang.lo -MD -MP -MF .deps/bitbang.Tpo -c bitbang.c  -fPIC -DPIC -o .libs/bitbang.o
> In file included from ../../../src/jtag/jtag.h:26,
>                  from driver.c:34:
> ../../../src/helper/binarybuffer.h: In function 'buf_set_u32':
> ../../../src/helper/binarybuffer.h:52: error: 'for' loop initial declaration used outside C99 mode
> ../../../src/helper/binarybuffer.h: In function 'buf_get_u32':
> ../../../src/helper/binarybuffer.h:82: error: 'for' loop initial declaration used outside C99 mode
> In file included from ../../../src/jtag/jtag.h:26,
>                  from ../../../src/jtag/interface.h:29,
>                  from bitbang.c:28:
> ../../../src/helper/binarybuffer.h: In function 'buf_set_u32':
> ../../../src/helper/binarybuffer.h:52: error: 'for' loop initial declaration used outside C99 mode
> ../../../src/helper/binarybuffer.h: In function 'buf_get_u32':
> ../../../src/helper/binarybuffer.h:82: error: 'for' loop initial declaration used outside C99 mode
> driver.c: In function 'interface_jtag_add_ir_scan':
> driver.c:100: error: 'for' loop initial declaration used outside C99 mode
> driver.c: In function 'interface_jtag_add_dr_scan':
> driver.c:142: error: 'for' loop initial declaration used outside C99 mode
> driver.c:167: error: redefinition of 'tap'
> driver.c:142: error: previous definition of 'tap' was here

I never see those error

I build it on arm target and no issue now I rebuild it against the HEAD and
foud one issue on xscale support
I'll send a fix patch
> 
> Any idea? If it isn't supposed to build if none of the drivers are
> enabled, then we need to ensure this cannot happen in Kconfig.
no issue as you can

Best Regards,
J.
