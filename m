From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:05:07 +0200
Subject: [Buildroot] [PATCH] m68k: fix open issues with qemu coldfire
In-Reply-To: <20160509195102.GA11121@waldemar-brodkorb.de>
References: <20160509195102.GA11121@waldemar-brodkorb.de>
Message-ID: <20160509220507.033b1faf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 May 2016 21:51:02 +0200, Waldemar Brodkorb wrote:
> Enable kernel drivers for networking and add a simple
> busybox config with basic network tools.
> 
> Add kernel patch from Linux git to fix hush segfaults while
> using signal handler.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/m68k-mcf5208/linux-4.5.config           |    7 +
>  .../patches/linux/0001-fix-do_sigreturn.patch      |  100 ++
>  configs/qemu_m68k_mcf5208_defconfig                |    8 +-
>  .../busybox/busybox-minimal-with-network.config    | 1057 ++++++++++++++++++++
>  4 files changed, 1168 insertions(+), 4 deletions(-)
>  create mode 100644 board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
>  create mode 100644 package/busybox/busybox-minimal-with-network.config

Thanks for the patch! However, I am not super happy with the
busybox-minimal-with-network.config. I don't want to see an increasing
number of Busybox default configurations.

If you have a STM32 platform handy, could you test if your
busybox-minimal-with-network.config works fine for it? If it does, then
please simply update busybox-minimal.config with whatever is needed for
basic networking to work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
