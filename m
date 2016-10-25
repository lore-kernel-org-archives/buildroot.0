From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:58:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: add optional dependency
 to unixodbc
In-Reply-To: <20161023153403.18413-1-bernd.kuhls@t-online.de>
References: <20161023153403.18413-1-bernd.kuhls@t-online.de>
Message-ID: <20161025225804.34b52828@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 17:34:03 +0200, Bernd Kuhls wrote:
> Quote from erlang configure without unixodbc:
> 
> checking for odbc in standard locations... no
> configure: WARNING: No odbc library found skipping odbc
> configure: WARNING: "ODBC library - header check failed"
> configure: WARNING: "ODBC library - link check failed"
> 
> Quote from erlang configure with unixodbc:
> 
> checking for odbc in standard locations... -L/home/buildroot/br3_couchdb/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib
> checking for SQLAllocHandle in -lodbc... yes
> 
> To check for unixodbc support used by erlang use readelf:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/erlang/lib/odbc-2.11.1/priv/bin/odbcserver | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libodbc.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Tested using this minimal defconfig:
> 
> BR2_PACKAGE_ERLANG=y
> BR2_PACKAGE_ERLANG_SMP=y
> BR2_PACKAGE_UNIXODBC=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/erlang/erlang.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. Thanks a lot Frank for the Tested-by!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
