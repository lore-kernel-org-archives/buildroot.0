From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 18 Sep 2011 12:22:09 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package: add openocd support
In-Reply-To: <8739fuw60t.fsf@macbook.be.48ers.dk>
References: <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
 <1316289171-21296-1-git-send-email-plagnioj@jcrosoft.com>
 <8739fuw60t.fsf@macbook.be.48ers.dk>
Message-ID: <20110918102209.GE16141@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11:31 Sun 18 Sep     , Peter Korsgaard wrote:
> >>>>> "JC" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:
> 
>  JC> with only the following Adapters
>  JC>  - FTDI FT2xxx/FT4xxx
>  JC>  - J-Link (Segger and Atmel SAM-ICE)
>  JC>  - Versaloon-Link JTAG Adapter
> 
>  JC> build for arm target
> 
>  JC> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>  JC> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
>  JC> Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
>  JC> ---
>  JC> v2:
> 
>  JC> add xscale fix
> 
> Still same error:
> 
> libtool: compile:  /home/peko/source/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../../.. -I../../../src -I../../../src -DPKGDATADIR=\"/usr/share/openocd\" -DPKGLIBDIR=\"/usr/lib/openocd\" -I../../../jimtcl -I../../../jimtcl -pipe -Os -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include -Wall -Wstrict-prototypes -Wformat-security -Wshadow -Wextra -Wno-unused-parameter -Wbad-function-cast -Wcast-align -Wredundant-decls -Werror -MT bitbang.lo -MD -MP -MF .deps/bitbang.Tpo -c bitbang.c  -fPIC -DPIC -o .libs/bitbang.o
> In file included from ../../../src/jtag/jtag.h:26,
>                  from driver.c:34:
> ../../../src/helper/binarybuffer.h: In function 'buf_set_u32':
> ../../../src/helper/binarybuffer.h:52: error: 'for' loop initial declaration used outside C99 mode
> 
> This is with a trivial defconfig:
> 
> BR2_arm=y
> BR2_arm926t=y
> BR2_PACKAGE_OPENOCD=y
> 
> E.G. to reproduce stick those 3 lines in .config and run
which version of gcc do you use?
> 
>      yes '' | make oldconfig
>      make
> 
> Next to that I have a few minor comments:
> 
>  JC> +++ b/package/openocd/Config.in
>  JC> @@ -0,0 +1,29 @@
>  JC> +menuconfig BR2_PACKAGE_OPENOCD
> 
> Please use config rather than menuconfig to not create a submenu, making
> it harder for people to get an overview.
> 
>  JC> +	bool "OpenOCD"
> 
> We normally keep the short name in lower case.
The name of the project is OpenOCD so I want to keep it that way

Best Regards,
J.
