From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:51:46 +0100
Subject: [Buildroot] [PATCH 5/7] package/dvdauthor: add optional support
 for libfribidi
In-Reply-To: <1456051888-2047-5-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
 <1456051888-2047-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221145146.17a7524f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 11:51:26 +0100, Bernd Kuhls wrote:
> When libfribidi was compiled before, dvdauthor will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/spumux | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libexpat.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libfontconfig.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [libfribidi.so.0]
> [...]
> 
> The build system offers no option to en-/disable libfribidi support:
> https://github.com/ldo/dvdauthor/blob/master/configure.ac#L83
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dvdauthor/dvdauthor.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
