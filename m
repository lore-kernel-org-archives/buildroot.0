From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:08:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libhid: Fix build with
 BR2_ENABLE_DEBUG=yes
In-Reply-To: <1414348288-3328-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414348288-3328-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026220823.7fe95a59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Oct 2014 19:31:28 +0100, Bernd Kuhls wrote:
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
>  .../libhid-0001-dont-fiddle-with-debug-flags.patch |   42 ++++++++------------
>  1 file changed, 16 insertions(+), 26 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
