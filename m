From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/wavpack: Fix iconv support
In-Reply-To: <1445084909-17569-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445084909-17569-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151017162706.4c0fa304@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Oct 2015 14:28:29 +0200, Bernd Kuhls wrote:
> wavpack fails to link with libiconv
> 
> /bin/bash ../libtool  --tag=CC   --mode=link /home/bernd/buildroot/br3/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc  -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os    -o wvunpack wvunpack-wvunpack.o wvunpack-utils.o wvunpack-md5.o  ../src/.libs/libwavpack.la -lm
> libtool: link: /home/bernd/buildroot/br3/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -I../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o wvunpack wvunpack-wvunpack.o wvunpack-utils.o wvunpack-md5.o  ../src/.libs/libwavpack.so -lm -Wl,-rpath -Wl,/home/bernd/buildroot/br3/output/build/wavpack-4.75.2/src/.libs
> /home/bernd/buildroot/br3/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.9.3/../../../../i586-buildroot-linux-uclibc/bin/ld: wvunpack-wvunpack.o: undefined reference to symbol 'libiconv_open'
> 
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_WAVPACK=y
> 
> Patch suggested by Peter:
> http://lists.busybox.net/pipermail/buildroot/2014-February/090596.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wavpack/wavpack.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
