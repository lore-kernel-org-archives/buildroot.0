From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Apr 2018 21:53:13 +0200
Subject: [Buildroot] ws281x library, scons, fails
In-Reply-To: <CAPzckP6sMQYU6cmsYv30P+CJsmvg=KHrvpVb+gC6BDOwHdqSwg@mail.gmail.com>
References: <CAPzckP6sMQYU6cmsYv30P+CJsmvg=KHrvpVb+gC6BDOwHdqSwg@mail.gmail.com>
Message-ID: <20180405215313.35c300e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 19:18:55 +0200, Sjoerd Venema wrote:

> creating build/temp.linux-x86_64-2.7
> /bin/gcc -pthread -fno-strict-aliasing -O2
> -I/home/buildroot/buildroot-2018.02-rc3/output/host/include -DNDEBUG -g
> -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC
> -I/home/buildroot/buildroot-2018.02-rc3/output/host/include/python2.7 -c
> rpi_ws281x_wrap.c -o build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o
> /bin/gcc -pthread -shared
> -L/home/buildroot/buildroot-2018.02-rc3/output/host/lib
> -Wl,-rpath,/home/buildroot/buildroot-2018.02-rc3/output/host/lib
> -Wl,--enable-new-dtags build/temp.linux-x86_64-2.7/rpi_ws281x_wrap.o -L../.
> -L/home/buildroot/buildroot-2018.02-rc3/output/host/lib -lws2811 -lrt
> -lpython2.7 -o build/lib.linux-x86_64-2.7/_rpi_ws281x.so
> */usr/bin/ld: skipping incompatible .././libws2811.a when searching for
> -lws2811*
> */usr/bin/ld: cannot find -lws2811*
> collect2: error: ld returned 1 exit status
> error: command '/bin/gcc' failed with exit status 1

This is using the host compiler to build target code, it can't work.
Seems like your package has a Python module, you need to pass special
variables to make it cross-compile properly. Look at
package/pkg-python.mk to get an idea of the variables you have to pass.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
