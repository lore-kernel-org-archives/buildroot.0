From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 23:43:21 +0200
Subject: [Buildroot] [PATCH-next] configs/roseapplepi: switch to
 mainline 5.7.19 kernel
In-Reply-To: <20200828113051.4253-1-peter@korsgaard.com>
References: <20200828113051.4253-1-peter@korsgaard.com>
Message-ID: <20200828234321.45f728ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2020 13:30:51 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Mainline Linux now has basic s500/roseapplepi support, so switch to that to
> get rid of the dependency on gcc7.  Add two patches for the dts / fix that
> didn't make it for kernel 5.7.
> 
> The mainline kernel does not yet have support for the mmc interface, so
> change to initramfs for now.  Patches for mmc support have been posted
> recently, so this can be reverted once they show up in a stable kernel:
> 
> https://lore.kernel.org/lkml/cover.1593124368.git.cristian.ciocaltea at gmail.com/
> 
> The owl serial port is called ttyOWLn in mainline, so adjust the bootargs to
> match.  Also drop the unneeded execute permission on uEnv.txt.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/roseapplepi/genimage.cfg                |  10 +-
>  board/roseapplepi/linux.config                |  45 +++
>  ...1-arm-dts-owl-s500-Fix-incorrect-PPI.patch |  52 +++
>  .../linux/0001-unbreak-xhci-trace.patch       |  31 --
>  ...002-arm-dts-owl-s500-add-RoseapplePi.patch |  89 +++++
>  .../0002-kernel-add-support-for-gcc-5.patch   |  99 -----
>  ...inux-use-static-inline-in-ARM-ftrace.patch |  54 ---
>  .../0004-Fix-compile-errors-with-gcc5.patch   | 121 ------
>  ...egrate-the-various-compiler-gcc-345-.patch | 363 ------------------
>  board/roseapplepi/uEnv.txt                    |   2 +-
>  configs/roseapplepi_defconfig                 |  20 +-
>  11 files changed, 198 insertions(+), 688 deletions(-)
>  create mode 100644 board/roseapplepi/linux.config
>  create mode 100644 board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch
>  delete mode 100644 board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch
>  create mode 100644 board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch
>  delete mode 100644 board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
>  delete mode 100644 board/roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
>  delete mode 100644 board/roseapplepi/patches/linux/0004-Fix-compile-errors-with-gcc5.patch
>  delete mode 100644 board/roseapplepi/patches/linux/0005-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
>  mode change 100755 => 100644 board/roseapplepi/uEnv.txt

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
