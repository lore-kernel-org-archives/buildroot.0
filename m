From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 16 Oct 2007 15:56:38 +1000
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
In-Reply-To: <20071016034233.GA21412@cloud.net.au>
References: <20071015054821.GA5245@cloud.net.au>
	<d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
	<20071016001608.GA17751@cloud.net.au>
	<20071016034233.GA21412@cloud.net.au>
Message-ID: <20071016055638.GA23927@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2007 at 01:42:33PM +1000, Hamish Moffatt wrote:
> So now it just fails like this:
> 
> > libc/libc_so.a(difftime.os): In function `difftime':
> > difftime.c:(.text+0x8): undefined reference to `__floatsidf'
> > difftime.c:(.text+0x2c): undefined reference to `__subdf3'
> > libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
> > _fpmaxtostr.c:(.text+0xe0): undefined reference to `__nedf2'
> > _fpmaxtostr.c:(.text+0x104): undefined reference to `__eqdf2'
> > _fpmaxtostr.c:(.text+0x120): undefined reference to `__divdf3'
> > _fpmaxtostr.c:(.text+0x12c): undefined reference to `__ltdf2'
> > _fpmaxtostr.c:(.text+0x1e0): undefined reference to `__muldf3'
> > _fpmaxtostr.c:(.text+0x39c): undefined reference to `__gedf2'
> > _fpmaxtostr.c:(.text+0x42c): undefined reference to `__floatunsidf'
> > libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
> > __psfs_do_numeric.c:(.text+0x54c): undefined reference to `__truncdfsf2'
> > libc/libc_so.a(strtof.os): In function `strtof':
> > strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
> > libc/libc_so.a(__strtofpmax.os): In function `__strtofpmax':
> > __strtofpmax.c:(.text+0x154): undefined reference to `__adddf3'
> > /home/hamish/tmp/br/buildroot/build_armeb/staging_dir/usr/lib/gcc/armeb-linux-uclibc/4.2.1/libgcc.a(_fixunsdfsi.o): In function `__fixunsdfsi':
> > libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
> > make[2]: *** [lib/libc.so] Error 1
> > make[1]: *** [lib/libc.so.0] Error 2

And this is caused by soft-float.

Summary of situation:

arm EABI hard-float: builds.

armeb EABI hard-float: libgcc_s.so fails to link due to incorrect file
format of libc.so

arm/armeb OABI hard-float: builds.
arm/armeb OABI soft-float: fails as above (both endians fail the same
way).

I haven't tried soft-float EABI.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
