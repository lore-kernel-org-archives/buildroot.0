From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 21:30:14 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/libssh2: fix static
 linking scenarios involving mbedtls"
In-Reply-To: <20181104125211.20852-1-fontaine.fabrice@gmail.com>
References: <20181104125211.20852-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104213014.243d7dd5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Nov 2018 13:52:10 +0100, Fabrice Fontaine wrote:
> This reverts commit 48218732a3a7b983825ff3a8cf0767f847ac8d04 because
> LTLIBMBEDCRYPTO will return "-lmbedcrypto
> -R/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib"
> 
> On some compilers, -R option won't be recognized and this will prevent
> the detection of libz:
> 
> configure:17809: /accts/mlweber1/scripts/instance-3/output/host/bin/i586-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/include  conftest.c /accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib/libz.so -Wl,-rpath -Wl,/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib  -L/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib -lmbedcrypto -R/accts/mlweber1/scripts/instance-3/output/host/i586-buildroot-linux-musl/sysroot/usr/lib >&5
> i586-linux-gcc.br_real: error: unrecognized command line option '-R'; did you mean '-R'?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/68623f22b49473177c889fe7b12625d779cbd1ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

I am not a big fan of the proposed solution, but we need a fix for
this, and what you propose is simple enough. So I've applied both
patches to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
