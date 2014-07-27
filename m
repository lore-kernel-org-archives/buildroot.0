From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:30:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: Fix checking for
 statically build OpenSSL with libz dependency
In-Reply-To: <1406447128-5446-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406447128-5446-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140727103023.7fbab613@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 27 Jul 2014 09:45:28 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/48a/48ad6d3659cf1f04581b7e3d115bebf454ff17fd/
> 
> To fix the error add "-lz" to LIBS variable and re-order the libraries in
> configure.ac. Please note line 797 in configure.ac:
> dnl XXX FIXME: use pkg-config if available!
> 
> Quote of the compile error:
> 
> configure: Enabling OpenSSL support in /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr.
> checking for additional library dependencies of SSL... error
> configure: error: cannot link with SSL - check config.log
> 
> In config.log multiple linking errors to libz can be found:
> 
> configure:10099: /home/br/br/output/host/usr/bin/i486-ctng-linux-uclibc-gcc -o
>   conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64
>   /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
>   In function `zlib_stateful_c_zlib.c:(.text+0x56): undefined reference to `inflate'
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
