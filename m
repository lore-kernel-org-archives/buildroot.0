From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:37:54 +0200
Subject: [Buildroot] [PATCH] package/xen: Include linux/limits.h when
 building QEMU inside of Xen
In-Reply-To: <20170728184517.31465-1-alistair.francis@xilinx.com>
References: <20170728184517.31465-1-alistair.francis@xilinx.com>
Message-ID: <20170729153754.5ac928ba@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Jul 2017 11:45:17 -0700, Alistair Francis wrote:
> If building Xen and not using glibc (using musl for example) the QEMU
> project inside of Xen fails to build as it relys on the XATTR_SIZE_MAX
> macro which is defined in <linux/limits.h>.
> 
> Glibc includes this header indirectly but as that is not part of the
> POSIX standard other libraries don't neccessearily have this. To fix the
> issue we explicitly include <linux/limits.h> to ensure the build works
> for all libc libraries.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/bb1/bb1310eb1464d880a357ae5e491fd168361d25a0
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...include-linux-limits.h-for-XATTR_SIZE_MAX.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/xen/0002-9pfs-include-linux-limits.h-for-XATTR_SIZE_MAX.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
