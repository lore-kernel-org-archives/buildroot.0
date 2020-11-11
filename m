From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Nov 2020 07:53:50 -0600
Subject: [Buildroot] [PATCH 1/2] package/coremark: new package
In-Reply-To: <20201111073415.814-1-judge.packham@gmail.com>
References: <20201111073415.814-1-judge.packham@gmail.com>
Message-ID: <CANQCQpbKX0g4Jc6-5aJWBp1C-3D1sJnKkzcqyUf=9g684PK=Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Wed, Nov 11, 2020 at 1:35 AM Chris Packham <judge.packham@gmail.com> wrote:
>
> CoreMark is a simple, yet sophisticated benchmark that is designed
> specifically to test the functionality of a processor core. Running
> CoreMark produces a single-number score allowing users to make quick
> comparisons between processors.
>
> https://www.eembc.org/coremark/
>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

./utils/test-pkg -k  -d foo_coremark -p coremark
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK


***Runtime test with QEMU***

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_COREMARK=y
BR2_PACKAGE_COREMARK_PRO=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

# coremark
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 13102
Total time (secs): 13.102000
Iterations/Sec   : 1526.484506
Iterations       : 20000
Compiler version : GCC9.2.1 20191025
Compiler flags   : -O2   -lrt
Memory location  : Please put data memory location here
                       (e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x382f
Correct operation validated. See readme.txt for run and reporting rules.
CoreMark 1.0 : 1526.484506 / GCC9.2.1 20191025 -O2   -lrt / Heap

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
