From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jul 2010 17:10:35 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <20100722141715.7bbc4963@surf>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
	<201007220457.24834.PeterHuewe@gmx.de>
	<20100722141715.7bbc4963@surf>
Message-ID: <20100722171035.0e656a6c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jul 2010 14:17:15 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> FWIW, I can also reproduce the issue. It seems to be due to the fact
> that the --prefix location is not writable (since it's /usr). See
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32101#c4.
> 
> So, I've cooked the attached patch, which allows the toolchain to
> build, but the toolchain fails when compiling Busybox with messages
> such as :
> 
> dc.c:(.text+0x10c): relocation truncated to fit: R_AVR32_22H_PCREL
> against symbol `__avr32_f64_to_u32' defined in .text section
> in /home/test/issue/old-br/buildroot/output/staging/usr/lib/gcc/avr32-unknown-linux-uclibc/4.2.2/libgcc.a(_avr32_f64_to_s32.o)
> 
> I don't yet know what is happening.

Ok, the patch that Gustavo has posted on Busybox at 3:50 PM today fixes
the problem. So with my patch on the toolchain + Gustavo's patch on
Busybox, I've been able to build an AVR32 toolchain, BusyBox, DirectFB
and a sample DirectFB application. However, I don't have any hardware
to test.

BTW, if there are people working at Atmel on this list, it'd be great
if Atmel could put online updated version of gcc, binutils and gdb for
the AVR32 architecture. Currently, we are stuck at gcc 4.2.x and
binutils 2.18.

On the Atmel website, it is possible to download a single zip file that
contains tarballs for gcc, gdb, binutils and newlib. Having that in a
single zip file is very unpractical for build systems like Buildroot.
Moreover, having to register on the website (name, address, phone
number and all the stuff) is even more inconvenient.

Would it be possible to just drop the individual tarballs at some
public location, with no registration required ? Or even better, get
the AVR32 support merged in the respective upstream projects :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
