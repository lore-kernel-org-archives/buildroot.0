From: Sjoerd Venema <srg.venema@gmail.com>
Date: Fri, 6 Apr 2018 19:33:18 +0200
Subject: [Buildroot] ws281x library, scons, fails
In-Reply-To: <20180405215313.35c300e9@windsurf>
References: <CAPzckP6sMQYU6cmsYv30P+CJsmvg=KHrvpVb+gC6BDOwHdqSwg@mail.gmail.com>
 <20180405215313.35c300e9@windsurf>
Message-ID: <CAPzckP7YiGe5LY3YcLsH-tpMcE29SVQaToLt6bPTBXCZzzeo1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've tried replacing the tools in xx_FOR_BUILD variables to point to the
ARM toolchain, this somewhat worked....
I did need to remove the -Wall, -Werror and -Wextra flags for some
reason... But after that it went ahead and built, this is what I executed:

(cd
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6;
PATH="/home/buildroot/buildroot-2018.02-rc3/output/host/bin:/home/buildroot/buildroot-2018.02-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/buildroot/.local/bin:/home/buildroot/bin"
AR="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ar"
AS="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
LD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
NM="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-nm"
CC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
GCC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
CPP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-cpp"
CXX="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++"
FC="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
F77="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gfortran"
RANLIB="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ranlib"
READELF="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-readelf"
STRIP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-strip"
OBJCOPY="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objcopy"
OBJDUMP="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-objdump"
AR_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ar"
AS_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
CC_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
GCC_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc"
CXX_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++"
LD_FOR_BUILD="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
CPPFLAGS_FOR_BUILD="-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/buildroot/buildroot-2018.02-rc3/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/buildroot/buildroot-2018.02-rc3/output/host/lib
-Wl,-rpath,/home/buildroot/buildroot-2018.02-rc3/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-as"
DEFAULT_LINKER="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/buildroot/buildroot-2018.02-rc3/output/host/bin/pkg-config"
STAGING_DIR="/home/buildroot/buildroot-2018.02-rc3/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl
CROSS=/home/buildroot/buildroot-2018.02-rc3/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/python2
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/scons )

(cd
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6;
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/python2
/home/buildroot/buildroot-2018.02-rc3/output/host/bin/scons )


But it then failed at the installation step saying:

>>> rpi_ws281x e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6 Installing to target
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/libws2811.a
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/test
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/bin
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/rpihw.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/dma.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/pcm.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/pwm.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/ws2811.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/mailbox.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
/usr/bin/install -D -m 0755
/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/main.o
/home/buildroot/buildroot-2018.02-rc3/output/target/usr/lib
ERROR: architecture for "/usr/lib/pcm.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/bin/test" is "Advanced Micro Devices X86-64",
should be "ARM"
ERROR: architecture for "/usr/lib/mailbox.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/libws2811.a" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/ws2811.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/dma.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/rpihw.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/main.o" is "Advanced Micro Devices
X86-64", should be "ARM"
ERROR: architecture for "/usr/lib/pwm.o" is "Advanced Micro Devices
X86-64", should be "ARM"
make[1]: ***
[/home/buildroot/buildroot-2018.02-rc3/output/build/rpi_ws281x-e4a05d6538c02bb9714f2efc6630f2bfdcf35bf6/.stamp_target_installed]
Error 1
make: *** [_all] Error 2

So, I'm clearly using a wrong compiler again.. How and where do you specify
that the bloody thing needs to use the Buildroot compiler???
Or shouldn't i be calling $(INSTALL) ?

thanks,
Sjoerd




On 5 April 2018 at 21:53, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Thu, 5 Apr 2018 19:18:55 +0200, Sjoerd Venema wrote:
>
> > creating build/temp.linux-x86_64-2.7
> > /bin/gcc -pthread -fno-strict-aliasing -O2
> > -I/home/buildroot/buildroot-2018.02-rc3/output/host/include -DNDEBUG -g
> > -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC
> > -I/home/buildroot/buildroot-2018.02-rc3/output/host/include/python2.7 -c
> > rpi_ws281x_wrap.c -o build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o
> > /bin/gcc -pthread -shared
> > -L/home/buildroot/buildroot-2018.02-rc3/output/host/lib
> > -Wl,-rpath,/home/buildroot/buildroot-2018.02-rc3/output/host/lib
> > -Wl,--enable-new-dtags build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o
> -L../.
> > -L/home/buildroot/buildroot-2018.02-rc3/output/host/lib -lws2811 -lrt
> > -lpython2.7 -o build/lib.linux-x86_64-2.7/_rpi_ws281x.so
> > */usr/bin/ld: skipping incompatible .././libws2811.a when searching for
> > -lws2811*
> > */usr/bin/ld: cannot find -lws2811*
> > collect2: error: ld returned 1 exit status
> > error: command '/bin/gcc' failed with exit status 1
>
> This is using the host compiler to build target code, it can't work.
> Seems like your package has a Python module, you need to pass special
> variables to make it cross-compile properly. Look at
> package/pkg-python.mk to get an idea of the variables you have to pass.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180406/56842930/attachment.html>
