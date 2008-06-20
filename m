From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 20 Jun 2008 15:26:16 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080620125720.GE12682@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc>
Message-ID: <485BAFF8.8090604@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Fri, Jun 20, 2008 at 10:40:22AM +0200, Hinko Kocevar wrote:
> 
>> With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!
> 
> I have improved (i hope) the cris support, configuration-wise, please
> pull and let me know if it suits your needs.
> 

1. Compilation of uClibc always fails with:

make[1]: Entering directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
make[2]: `conf' is up to date.
/usr/bin/make locale_headers
make[3]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
  AS ldso/ldso/cris/resolve.oS
  CC ldso/libdl/libdl.oS
  CC libcrypt/crypt.os
  CC libcrypt/des.os
In file included from ./include/sys/param.h:22,
                 from libcrypt/des.c:62:
./include/limits.h:124:26: error: limits.h: No such file or directory
make[1]: *** [libcrypt/des.os] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
make: *** [/home/hinkok/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2

2. And later:

  CC libm/expf.os
  AS libc/sysdeps/linux/cris/syscall.os
  CC libm/expm1f.os
  CC libc/sysdeps/linux/common/__rt_sigtimedwait.os
  CC libm/fabsf.os
In file included from /home/hinkok/work/stage/git.br/toolchain_build_cris/linux/include/asm/sigcontext.h:6,
                 from ./include/bits/sigcontext.h:28,
                 from ./include/signal.h:332,
                 from libc/sysdeps/linux/common/__rt_sigtimedwait.c:11:
/home/hinkok/work/stage/git.br/toolchain_build_cris/linux/include/asm/ptrace.h:4:29: error: asm/arch/ptrace.h: No such file or directory
In file included from ./include/bits/sigcontext.h:28,
                 from ./include/signal.h:332,
                 from libc/sysdeps/linux/common/__rt_sigtimedwait.c:11:
/home/hinkok/work/stage/git.br/toolchain_build_cris/linux/include/asm/sigcontext.h:18: error: field 'regs' has incomplete type
make[2]: *** [libc/sysdeps/linux/common/__rt_sigtimedwait.os] Error 1
make[2]: *** Waiting for unfinished jobs....
  CC libm/fdimf.os


-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cris-uClibc.patch
Type: text/x-patch
Size: 845 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080620/d039e488/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cris-headers.patch
Type: text/x-patch
Size: 967 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080620/d039e488/attachment-0001.bin 
