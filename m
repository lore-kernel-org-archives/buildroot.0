From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 14:54:07 +0100
Subject: [Buildroot] [PATCH 2/2] kvmtool: bump to f77d646ba0
In-Reply-To: <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
 <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
Message-ID: <20171203145407.78bab7c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 21:33:21 -0600, Matt Weber wrote:
> Commit used:
> 2017-11-03 16:19:58 +0000
> irq.h: fix compilation error due to missing bool type
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This breaks the build:

  LINK     lkvm
x86_64-amd-linux-gnu-gcc: error: elf_x86_64: No such file or directory
x86_64-amd-linux-gnu-gcc: error: unrecognized command line option '-m'
make[2]: *** [Makefile:384: lkvm] Error 1
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

With the following defconfig:

BR2_x86_64=y
BR2_x86_steamroller=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_KVMTOOL=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
