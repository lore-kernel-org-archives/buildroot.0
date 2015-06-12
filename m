From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:30:10 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gdb: Add optional
 dependencies
In-Reply-To: <1428838235-1369-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428838235-1369-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150612233010.2e92fb89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Apr 2015 13:30:35 +0200, Bernd Kuhls wrote:
> To allow reproducable builds of target gdb add some optional dependencies
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Dependencies are only needed for target gdb (Yann)

Applied, thanks, after adding --{with,without}-{expat,zlib} to
explicitly enable/disable the use of these libraries. There was no such
option for libiconv, so I kept it as it was in your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
