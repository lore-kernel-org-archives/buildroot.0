From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Nov 2008 16:22:57 +0100
Subject: [Buildroot] Fonconfig
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B90D3480@EU1RDCRDC1WX029.exi.nxp.com>
References: <6c8937b20811210223l527b6f07ya15f0248a96352f8@mail.gmail.com>
	<C13DBBE85AD6974B85C118C35890CA5F13B90D3480@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <20081121152257.GF19039@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 21, 2008 at 03:47:41PM +0100, Daniel James Laird wrote:
>can you do gcc--version as sysroot only works on gcc>4.2

>/usr/lib/ccache/gcc -DHAVE_CONFIG_H -I. -I.. -I../src -I.. -Wall -Wpointer-arith -Wstrict-prototypes    -Wmissing-prototypes -Wmissing-declarations     -Wnested-externs -fno-strict-aliasing    -Os  -Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include --sysroot=build_i686/staging_dir/ -isysroot build_i686/staging_dir -mtune=i686 -march=i686 -MT fc-case.o -MD -MP -MF .deps/fc-case.Tpo -c -o fc-case.o fc-case.c
>mv -f .deps/fc-case.Tpo .deps/fc-case.Po
>/usr/lib/ccache/gcc  -Os  -Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include --sysroot=build_i686/staging_dir/ -isysroot build_i686/staging_dir -mtune=i686 -march=i686  -Lbuild_i686/staging_dir/lib -Lbuild_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/ -o fc-case fc-case.o
>/usr/bin/ld: this linker was not configured to use sysroots

Daniel, this is nonsense. It's the same repeated issue of mixing
CFLAGS_FOR_BUILD/CC_FOR_BUILD with CC/CFLAGS (for the target).

http://www.busybox.net/lists/buildroot/2007-June/003052.html
