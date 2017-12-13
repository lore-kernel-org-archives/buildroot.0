From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:53:51 +0100
Subject: [Buildroot] [PATCH v4] package/i2c-tools: bump to version 4.0
In-Reply-To: <1513013922-14269-1-git-send-email-angelo@amarulasolutions.com>
References: <1513013922-14269-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20171213085328.2b225b86@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Dec 2017 18:38:42 +0100, Angelo Compagnucci wrote:
> This patch bumps i2c-tools to version 4.0 and adds a couple of
> new commands named i2ctransfer and eeprog.
> It adds also several upstream commits not included in the release
> that fix static compilation issues and parallel build issues.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  ...01-lib-Module.mk-Add-missing-dependencies.patch | 34 ++++++++++++
>  ...efile-Add-flag-to-disable-dynamic-library.patch | 64 ++++++++++++++++++++++
>  ...odule.mk-Drop-unused-variable-LIB_OBJECTS.patch | 33 +++++++++++
>  .../0004-lib-Module.mk-fixing-LIB_LINKS.patch      | 32 +++++++++++
>  package/i2c-tools/i2c-tools.hash                   |  2 +-
>  package/i2c-tools/i2c-tools.mk                     | 16 +++++-
>  6 files changed, 177 insertions(+), 4 deletions(-)
>  create mode 100644 package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
>  create mode 100644 package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
>  create mode 100644 package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
>  create mode 100644 package/i2c-tools/0004-lib-Module.mk-fixing-LIB_LINKS.patch

I'm sorry, but this still doesn't build:

>>> i2c-tools 4.0 Extracting
xzcat /home/thomas/dl/i2c-tools-4.0.tar.xz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/i2c-tools-4.0   -xf -
>>> i2c-tools 4.0 Patching

Applying 0001-lib-Module.mk-Add-missing-dependencies.patch using patch: 
patching file lib/Module.mk

Applying 0002-Makefile-Add-flag-to-disable-dynamic-library.patch using patch: 
patching file Makefile
patching file lib/Module.mk

Applying 0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch using patch: 
patching file lib/Module.mk

Applying 0004-lib-Module.mk-fixing-LIB_LINKS.patch using patch: 
patching file lib/Module.mk
>>> i2c-tools 4.0 Configuring
>>> i2c-tools 4.0 Building
/usr/bin/make -j5 ....
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -fpic -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c lib/smbus.c -o lib/smbus.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2cdetect.c -o tools/i2cdetect.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2cbusses.c -o tools/i2cbusses.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2cdump.c -o tools/i2cdump.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/util.c -o tools/util.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2cset.c -o tools/i2cset.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2cget.c -o tools/i2cget.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -Winline -W -Wundef -Wmissing-prototypes -Iinclude -c tools/i2ctransfer.c -o tools/i2ctransfer.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Iinclude -c eeprog/eeprog.c -o eeprog/eeprog.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Iinclude -c eeprog/24cXX.c -o eeprog/24cXX.o
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -shared  -Wl,--version-script=lib/libi2c.map -Wl,-soname,libi2c.so.0 -o lib/libi2c.so.0.1.0 lib/smbus.o -lc
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cdetect tools/i2cdetect.o tools/i2cbusses.o -Llib -li2c
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc  -o tools/i2cdump tools/i2cdump.o tools/i2cbusses.o tools/util.o -Llib -li2c
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -li2c
collect2: error: ld returned 1 exit status
make[2]: *** [tools/Module.mk:28: tools/i2cdetect] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.4/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -li2c
collect2: error: ld returned 1 exit status
make[2]: *** [tools/Module.mk:31: tools/i2cdump] Error 1
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/i2c-tools-4.0/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

defconfig used:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_I2C_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

Perhaps it's time to convince the i2c-tools maintainer to switch to a
reasonable build system, rather than providing a hand-written Makefile
that doesn't work ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
