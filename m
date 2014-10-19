From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:51:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/findutils: Fix compile error
In-Reply-To: <1413735882-8865-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413735882-8865-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019225133.49ef4e39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 18:24:42 +0200, Bernd Kuhls wrote:
> Error occured with an allyespackageconfig setup:
> 
> /home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -std=gnu99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -g2   -o find ftsfind.o ./libfindtools.a ../lib/libfind.a ../gnulib/lib/libgnulib.a -lintl  -lm -lm
> ../gnulib/lib/libgnulib.a(getdate.o): In function `get_date':
> getdate.c:(.text+0x15cd): undefined reference to `rpl_mktime'
> getdate.c:(.text+0x168e): undefined reference to `rpl_mktime'
> getdate.c:(.text+0x1707): undefined reference to `rpl_mktime'
> getdate.c:(.text+0x1812): undefined reference to `rpl_mktime'
> collect2: error: ld returned 1 exit status
> make[3]: *** [find] Error 1
> make[3]: Leaving directory `/home/fli4l/br5/output/build/findutils-4.4.2/find'
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/findutils/findutils.mk |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
