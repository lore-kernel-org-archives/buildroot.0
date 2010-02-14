From: =?ISO-8859-1?Q?Sebasti=E1n_Treu?= <sebastian.treu@gmail.com>
Date: Sun, 14 Feb 2010 20:42:54 -0300
Subject: [Buildroot] backtrace patch and execinfo.h missing on uclibc
In-Reply-To: <20100214114440.10260f67@surf>
References: <9e4ade691002132326i3d3261afja3e4513ec7c07f07@mail.gmail.com> 
	<20100214114440.10260f67@surf>
Message-ID: <9e4ade691002141542g4d79371bt359c11f81a4b572c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Feb 14, 2010 at 7:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Can you explain what your problem is ?

I made a fs with buildroot using uclibc with native tools to compile
on an embedded device (some package can't be crosscompiled, or are
hard to understand how). I have compiled successfully  a lot of
packages, perl, gnutls, zlib, bzip, etc. I crosscompiled mysql (native
I ran out of memory) successfull too, with the same toolchain (not
actually the same, the one you use to crosscompile but the same that
uses buildroot to build the native toolchain and the fs).

Using the native compiler and toolchain in the device to build
ZoneMinder, I get an error about the header file missing: execinfo.h.
I have read that this header is used to implement backtrace. The error
is simply that "no such file or directory", and in fact that file
isn't found by me when searching it in the native toolchain or in the
crosscompile toolchain. Trying to crosscompile I had another errors
too, for example: "asm imposible constraint" but when looking the
code, the line was the FD_ISSET macro from select. (?) Anyway,
execinfo.h is not generated neither in the native nor in the cross.

I use openwrt too. I have seen that If I build a crosscompile
toolchain with glibc, execinfo.h is located in the includes files, but
there's no such file with uclibc. Now I'm using that toolchain to
crosscompile all the things, make the openwrt kernel, the fs and see
If it works. Unfortunately, openwrt doesn't build a native toolchain
so I need to crosscompile everything.

But...continuing with problems I get an error with that toolchain
crosscompiling the needed package! (bad luck? nah...) I won't ask for
help about that toolchain as isn't the topic of this list. In other
instance I'll see what to do on #openwrt.


Synthesis:
--------------
Error: execinfo.h no such file or directory. (on native build)

Toolchain: From buildroot-2009.11
Linux Headers: 2.6.31.x
uClibc: 0.9.30.1
binutils: 2.19.1
gcc:
Configured with: /usr/src/buildroot/buildroot-2009.11/output/toolchain/gcc-4.3.
4/configure --prefix=/usr --build=x86_64-pc-linux-gnu --host=mips-linux-uclibc
--target=mips-linux-uclibc --enable-languages=c,c++ --with-gxx-include-dir=/usr
/include/c++ --disable-__cxa_atexit --with-gnu-ld --disable-libssp --enable-tls
 --enable-shared --disable-nls --enable-threads --disable-multilib --disable-de
cimal-float --with-float=soft --with-abi=32 --with-tune=mips32
Thread model: posix
gcc version 4.3.4 (GCC)

And I put the .config with nopaste to not flood the email:
http://pastie.org/824917

Thanks again for your interest.
Regards,
-- 
If you want freedom, compile the source. Get gentoo.

Sebasti?n Treu
http://labombiya.com.ar
