From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 16:07:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: add optional support
 for libintl
In-Reply-To: <20170312140605.28511-1-bernd.kuhls@t-online.de>
References: <20170312140605.28511-1-bernd.kuhls@t-online.de>
Message-ID: <20170312160752.25c1efe2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 15:06:05 +0100, Bernd Kuhls wrote:
> Python links to gettext when available:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
>  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> In comparison the same library compiled without gettext:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python/python.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
