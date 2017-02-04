From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Feb 2017 23:55:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: add optional
 dependency to libtool
In-Reply-To: <20170204164327.10478-1-bernd.kuhls@t-online.de>
References: <20170204164327.10478-1-bernd.kuhls@t-online.de>
Message-ID: <20170204235542.11c984bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Feb 2017 17:43:27 +0100, Bernd Kuhls wrote:
> To get reproducable builds of unixodbc add libtool as optional
> dependency.
> 
> Without libtool:
> 
> $ host/usr/bin/x86_64-linux-readelf -a target/usr/lib/libodbc.so.2.0.0 | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> With libtool:
> 
> $ host/usr/bin/x86_64-linux-readelf -a target/usr/lib/libodbc.so.2.0.0 | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libltdl.so.7]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/unixodbc/unixodbc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
