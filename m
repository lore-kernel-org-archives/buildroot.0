From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Oct 2018 10:44:50 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix uclibc c99 support
 detection
In-Reply-To: <20181028093957.20543-1-ps.report@gmx.net>
References: <20181028093957.20543-1-ps.report@gmx.net>
Message-ID: <20181028104450.39b76b65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Oct 2018 10:39:57 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   checking for /home/peko/autobuild/instance-0/output/host/bin/powerpc-linux-gcc option to accept ISO C99... unsupported
>   configure: error: Valgrind relies on a C compiler supporting C99
> 
> with the following in the valgrind-3.14.0/config.log:
> 
>   configure:5517: checking for .../host/bin/powerpc-linux-gcc option to accept ISO C99
>   configure:5666: .../host/bin/powerpc-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
>   conftest.c:55:9: error: unknown type name 'wchar_t'
>      const wchar_t *name;
>            ^~~~~~~
> 
> [1] http://autobuild.buildroot.net/results/b25013f785a11f07e8da3735741b96036712f42a

So the autoconf test verifies that WCHAR support is available, which is
not (the toolchain doesn't provide it), but in practice, Valgrind does
not need WCHAR support ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
