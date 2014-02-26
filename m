From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Feb 2014 21:57:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-25
In-Reply-To: <87k3cigt81.fsf@dell.be.48ers.dk>
References: <20140226073009.06EDD100CEF@stock.ovh.net>
 <87k3cigt81.fsf@dell.be.48ers.dk>
Message-ID: <20140226215740.4fd07066@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 26 Feb 2014 09:42:54 +0100, Peter Korsgaard wrote:

>  >       i686 |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/6dcef647eb0f0db7de3f34194eb15ceebc645b39/
> 
>   CCLD   testThreads
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_code at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_end at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_code at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_auto_decoder at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_end at XZ_5.0'
> /home/peko/scratch/host/usr/lib/libxml2.so: undefined reference to `lzma_properties_decode at XZ_5.0'
> 
> Thomas, I think you looked into it and it was something about it picking
> up lzma from the build machine. Do you have a fix?

Yeah, probably need to explicitly disable lzma support from
host-libxml2, I'd say.

>  >        arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/722fea5a4a30c271a83cadf61e2d1e07bcb7a4ea/
> 
> Ptrace issue:
> 
> /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'

Maybe fixed by the ltp-testsuite bump in -next.

>  >    powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/fa45d93d145f3991e9c8bb99997b7e41cedc64b0/
> 
> Too old kernel headers?

Yes.

> 
> mmc.h:18:29: fatal error: linux/mmc/ioctl.h: No such file or directory

>  >    powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/88d76be91d04a22dd2f1683396a172be085e1657/
> 
> Internal compiler error. Thomas, how old is this ctng toolchain?

Fairly old. Yann has provided me some newer ctng toolchains, but he has
used "br" as the vendor part of the tuple, which I find highly
confusing, so I haven't put in "production" these newer ctng toolchains.

>  >    powerpc |              xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/f62f8e63082fdfb9a68c8b4e629e5a7fa02b3bba/
> 
> Out of memory?
> 
> configure: creating ./config.status
> ./config.status: fork: Cannot allocate memory

Crappy build machine :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
