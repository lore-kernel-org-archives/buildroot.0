From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 09:57:48 +0200
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
Message-ID: <20130620095748.1e480e0a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Weininger,

On Thu, 20 Jun 2013 07:18:42 +0000, Thomas Weininger wrote:

> /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -fPIC -I/home/diasemi/workspace/dialog/buildroot/output/host/usr/include/python2.7 -c smbusmodule.c -o build/temp.linux-i686-2.7/smbusmodule.o

This line is correctly using the ARM cross-compiler.

> smbusmodule.c: In function 'initsmbus':
> smbusmodule.c:695:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
> creating build/lib.linux-i686-2.7
> /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -shared -L/home/diasemi/workspace/dialog/buildroot/output/host/lib -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -Wl,-rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include build/temp.linux-i686-2.7/smbusmodule.o -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
> gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
> gcc: error: unrecognized command line option '-mfloat-abi=hard'

But this line is using a native compiler (gcc) and ARM-specific options
are passed (-mfpu, -mfloat-abi). You'll have to figure out why the
i2c-tools build system is using the native compiler and not the
cross-compiler here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
