From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:16:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: add optional support for
 xz
In-Reply-To: <1455137950-18164-3-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1455137950-18164-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216231615.6a10fa95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 21:59:10 +0100, Bernd Kuhls wrote:
> When xz was compiled before, tiff will use it as optional dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libtiff.so.5.2.4 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libjpeg.so.9]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tiff/Config.in | 4 ++++
>  package/tiff/tiff.mk   | 6 ++++++
>  2 files changed, 10 insertions(+)

I've applied, but I would *really* like to see additional patches to
use --enable-<foo> explicitly for all dependencies of the tiff package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
