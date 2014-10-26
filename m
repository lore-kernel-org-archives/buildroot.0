From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/libhid: Fix build with
 BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413747441-8680-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413747441-8680-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026185942.788b0d88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 21:37:21 +0200, Bernd Kuhls wrote:
> Updated Thomas? patch fix also fix the case when debug is enabled, otherwise this error occurs:
> 
> /bin/bash ../libtool  --tag=CC   --mode=compile /home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
>  -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
>  -I/home/fli4l/br5/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include -D_LARGEFILE_SOURCE
>  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe s -g2 -O0 -g -Wall -W -c -o hidparser.lo hidparser.c
> libtool: compile:  /home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I.
>  -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
>  -I/home/fli4l/br5/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe s -g2 -O0
>  -g -Wall -W -c hidparser.c  -fPIC -DPIC -o .libs/hidparser.o
> 
> i586-buildroot-linux-uclibc-gcc: error: s: No such file or directory
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../libhid-0001-dont-fiddle-with-debug-flags.patch |   32 +++++++++++---------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Fine, but then you also need to change the description of the patch
libhid-0001-dont-fiddle-with-debug-flags.patch, since with your change,
the original description that I made doesn't make sense anymore.

Could you resend an updated patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
