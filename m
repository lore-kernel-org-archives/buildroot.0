From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:30:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: add optional support
 for zlib
In-Reply-To: <1456078152-18432-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456078152-18432-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221213028.50c7b10c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 19:09:12 +0100, Bernd Kuhls wrote:
> When zlib was compiled before, binutils will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libbfd-2.24.so | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
> 
> Apparantly the build system offers no support to control the
> dependency, --without-system-zlib with zlib installed still provides
> libbfd-2.24.so linked to libz.so.1.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/binutils/binutils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
