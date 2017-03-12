From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 16:07:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/clamav: needs libtool
In-Reply-To: <20170311125853.5204-1-bernd.kuhls@t-online.de>
References: <20170311125853.5204-1-bernd.kuhls@t-online.de>
Message-ID: <20170312160732.57910c6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 13:58:52 +0100, Bernd Kuhls wrote:
> clamav contains a copy of libltdl which is used when the libtool
> package is not present, this increases the filesize of the target libs:
> 
> linked against libltdl.so:
> 
> -rwxr-xr-x 1 bernd bernd 1838528 M?r 11 13:21 output/target/usr/lib/libclamav.so.7.1.1
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libltdl.so.7]
>  0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> not linked against libltdl.so:
> 
> -rwxr-xr-x 1 bernd bernd 1859548 M?r 11 13:21 output/target/usr/lib/libclamav.so.7.1.1
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Therefore this patch adds libtool as hard dependency to clamav.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/Config.in | 1 +
>  package/clamav/clamav.mk | 3 +++
>  2 files changed, 4 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
