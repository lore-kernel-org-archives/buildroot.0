From: Eric Schwartz <eric.schwartz@hp.com>
Date: Tue, 30 Jan 2007 15:04:35 -0700
Subject: [Buildroot] can't compile ccache with static uClibc
In-Reply-To: <45BF877C.2020707@hp.com>
References: <45BA7434.3010404@hp.com> <20070127050639.GA23033@codepoet.org>
	<45BF877C.2020707@hp.com>
Message-ID: <45BFC0F3.2000803@hp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric Schwartz wrote:
> I was using uClibc 0.9.28. I'll go ahead and try with the snapshot, 
> shall I, unless you know it's going to fail in the same way?
>   
Using the latest uClibc snapshot, I get the following 
interesting-looking failure:

/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/staging_dir/bin/ia64-linux-uclibc-gcc 
-Os -pipe  -o ccache ccache.o mdfour.o hash.o execute.o util.o args.o 
stats.o cleanup.o snprintf.o unify.o
/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/staging_dir/bin-ccache/../lib/gcc/ia64-linux-uclibc/4.1.1/../../../../ia64-linux-uclibc/lib/libc.a(vsnprintf.os): 
In function `vsnprintf':
vsnprintf.c:(.text+0x0): multiple definition of `vsnprintf'
snprintf.o:snprintf.c:(.text+0x630): first defined here
/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/staging_dir/bin-ccache/../lib/gcc/ia64-linux-uclibc/4.1.1/../../../../ia64-linux-uclibc/bin/ld: 
Warning: size of symbol `vsnprintf' changed from 5696 in snprintf.o to 
448 in 
/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/staging_dir/bin-ccache/../lib/gcc/ia64-linux-uclibc/4.1.1/../../../../ia64-linux-uclibc/lib/libc.a(vsnprintf.os)
collect2: ld returned 1 exit status
make[2]: *** [ccache] Error 1
make[2]: Leaving directory 
`/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/ccache-2.4'
make[1]: *** 
[/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot/build_ia64/ccache-2.4/ccache] 
Error 2
make[1]: Leaving directory 
`/home/emschwar/working.hg/tools/xm-test/ramdisk/buildroot'
make: *** [buildroot/rootfs.ia64.ext2] Error 2
