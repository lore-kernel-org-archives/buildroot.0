From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:58:55 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: apply all Linux
 patches when BR2_KERNEL_HEADERS_AS_KERNEL=y
In-Reply-To: <20190804093644.7388-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 4 Aug 2019 11:36:44 +0200")
References: <20190804093644.7388-1-thomas.petazzoni@bootlin.com>
Message-ID: <871rx1hikg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When BR2_KERNEL_HEADERS_AS_KERNEL=y, we expect that the Linux kernel
 > headers code will be exactly the same as the Linux kernel code
 > itself. The code currently takes into account the patches defined by
 > BR2_LINUX_KERNEL_PATCH, but not the kernel patches that are stored in
 > linux's BR2_GLOBAL_PATCH_DIR.

 > So for example, the current qemu_riscv32_virt_defconfig has:

 > BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"

 > With:

 > board/qemu/riscv32-virt/patches/
 > ??? linux
 >     ??? 0001-Revert-riscv-Use-latest-system-call-ABI.patch

 > This patch gets properly applied when the Linux kernel is built, but
 > not when the linux-headers package is built.

 > This commit fixes that by making sure patches stored in the "linux"
 > BR2_GLOBAL_PATCH_DIR subdirectory are taken into account.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Yann, you gave your Acked-by in
 > http://patchwork.ozlabs.org/patch/1119649/, but it was not a formal
 > commit with a proper commit log, so I haven't kept your Acked-by.

As this is kind of a bugfix, committed to 2019.02.x and 2019.05.x.

-- 
Bye, Peter Korsgaard
