From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 23:15:20 +0200
Subject: [Buildroot] [PATCH v5] board: add blackfin gdb simulator support
In-Reply-To: <20160708221918.GA11610@waldemar-brodkorb.de>
References: <20160708221918.GA11610@waldemar-brodkorb.de>
Message-ID: <20160724231520.2f5d811a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Jul 2016 00:19:18 +0200, Waldemar Brodkorb wrote:
> With this config you can bootup a Linux kernel
> in GDB simulator and test Blackfin kernel and
> userland.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v4 -> v5:
>   - fix gdb sim compile on older systems with gcc 4.4 reported
>     by THomas Petazzoni 
> v3 -> v4:
>   - update to use latest 4.6 kernel
>   - remove ldconfig workaround, as uclibc-utils now compile
> v2 -> v3:
>   - no changes
> v1 -> v2:
>   - do not use devtmpfs, as login via getty fails
> ---
>  board/gdb/bfin-bf512/linux-4.6.config         | 87 +++++++++++++++++++++++++++
>  board/gdb/bfin-bf512/readme.txt               | 11 ++++
>  board/gdb/post-build.sh                       |  4 ++
>  configs/gdb_bfin_bf512_defconfig              | 34 +++++++++++
>  package/gdb/7.10.1/0005-fix-sim-compile.patch | 16 +++++
>  package/gdb/7.11.1/0001-fix-sim-compile.patch | 16 +++++
>  system/device_table_dev.txt                   |  1 +
>  7 files changed, 169 insertions(+)
>  create mode 100644 board/gdb/bfin-bf512/linux-4.6.config
>  create mode 100644 board/gdb/bfin-bf512/readme.txt
>  create mode 100755 board/gdb/post-build.sh
>  create mode 100644 configs/gdb_bfin_bf512_defconfig
>  create mode 100644 package/gdb/7.10.1/0005-fix-sim-compile.patch
>  create mode 100644 package/gdb/7.11.1/0001-fix-sim-compile.patch

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
