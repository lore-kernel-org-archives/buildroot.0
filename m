From: Daniel Mack <daniel@caiaq.de>
Date: Fri, 11 Dec 2009 08:44:25 +0800
Subject: [Buildroot] u-boot compile error
In-Reply-To: <1260489835.17342.6.camel@RoadRunner>
References: <1260489835.17342.6.camel@RoadRunner>
Message-ID: <20091211004425.GR28375@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 10, 2009 at 04:03:55PM -0800, Nicolae T wrote:
> We're getting following compile errors at u-boot build time, for which
> we have no clue.
> There must be something we do in setup that leads to that, but why
> failing with compile error? Set up rather straightforward with  BR built
> cross-compile chain.
> Anyhow, this is wrong and I think it should be looked into.  

Do you need to build U-Boot at all? If not, just switch it off.

> make[2]: Entering directory
> `/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/lib_arm'
> /home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc  -g  -Os   -fno-strict-aliasing -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DTEXT_BASE=0x80e80000 -I/home/nicolae/buildroot7Dec/output/build/u-boot-2009.08/include -fno-builtin -ffreestanding -nostdinc -isystem /home/nicolae/buildroot7Dec/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.2/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector   -o board.o board.c -c
> board.c:127: error: inline function ?coloured_LED_init? cannot be
> declared weak
> board.c:129: error: inline function ?red_LED_on? cannot be declared weak
> board.c:131: error: inline function ?red_LED_off? cannot be declared
> weak

Which board are you building U-Boot for? If you necessarily need to
compile it from the sources, I'd suggest asking at the U-Boot ML,
providing as much information as you can on how to provoke this.

Daniel
