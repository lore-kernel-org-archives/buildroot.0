From: Thomas Weininger <Thomas.Weininger@diasemi.com>
Date: Thu, 20 Jun 2013 09:30:32 +0000
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <20130620095748.1e480e0a@skate>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <20130620095748.1e480e0a@skate>
Message-ID: <4E062DFADC6E8142AA8EE9D214BA0C50E3E441@NB-EX-MBX01.diasemi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Donnerstag, 20. Juni 2013 09:58
> To: Thomas Weininger
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error when trying to build the py-smbus
> package of i2c-tools
>
> Dear Thomas Weininger,
>
> On Thu, 20 Jun 2013 07:18:42 +0000, Thomas Weininger wrote:
>
> > /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache
> > /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/arm-
> build
> > root-linux-uclibcgnueabi-gcc -DNDEBUG -g -O3 -Wall -Wstrict-prototypes
> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -
> pipe
> > -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -fPIC
> > -
> I/home/diasemi/workspace/dialog/buildroot/output/host/usr/include/pyt
> > hon2.7 -c smbusmodule.c -o build/temp.linux-i686-2.7/smbusmodule.o
>
> This line is correctly using the ARM cross-compiler.
>
> > smbusmodule.c: In function 'initsmbus':
> > smbusmodule.c:695:2: warning: dereferencing type-punned pointer will
> > break strict-aliasing rules [-Wstrict-aliasing] creating
> > build/lib.linux-i686-2.7
> > /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache
> > /usr/bin/gcc -pthread -shared
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/lib
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib
> > -Wl,-
> rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/li
> > b -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
> D_FILE_OFFSET_BITS=64
> > -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include
> > build/temp.linux-i686-2.7/smbusmodule.o
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib
> > -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
> > gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
> > gcc: error: unrecognized command line option '-mfloat-abi=hard'
>
> But this line is using a native compiler (gcc) and ARM-specific options are
> passed (-mfpu, -mfloat-abi). You'll have to figure out why the i2c-tools build
> system is using the native compiler and not the cross-compiler here.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting,
> training and support.
> http://free-electrons.com

 [Thomas Weininger]
Thank you Thomas for your help. I decided to split the py-smbus module from i2c-tools to a separate package. This may not be the most elegant way, but it works for me. Also the gcc errors do not occur anymore.

The downside of this approach is that I have to provide an extra python-smbus-3.1.0.tar.gz package. If someone is interested I could provide a patch for this package.

Best regards,
Thomas






________________________________

Dialog Semiconductor GmbH
Neue Str. 95
D-73230 Kirchheim
Managing Directors: Dr. Jalal Bagherli, Jean-Michel Richard
Chairman of the Supervisory Board: Gregorio Reyes
Commercial register: Amtsgericht Stuttgart: HRB 231181
UST-ID-Nr. DE 811121668

Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

Please consider the environment before printing this e-mail
