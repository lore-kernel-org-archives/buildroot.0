From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 15:27:39 +0200
Subject: [Buildroot] [PATCH v2] m68k: fix open issues with qemu coldfire
In-Reply-To: <20160510205007.GA14378@waldemar-brodkorb.de>
References: <20160510205007.GA14378@waldemar-brodkorb.de>
Message-ID: <20160511152739.3aa14749@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 22:50:07 +0200, Waldemar Brodkorb wrote:
> Enable kernel drivers for networking and add a simple
> busybox config with basic network tools.
> 
> Add kernel patch from Linux git to fix hush segfaults while
> using signal handler.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   * use generic busybox-minimal.config with networking tools
>     enabled as requested by Thomas Petazzoni
>   * verified to still work with STM32F429 discovery board
> ---
>  board/qemu/m68k-mcf5208/linux-4.5.config           |   7 ++
>  .../patches/linux/0001-fix-do_sigreturn.patch      | 100 +++++++++++++++++++++
>  configs/qemu_m68k_mcf5208_defconfig                |   6 +-
>  package/busybox/busybox-minimal.config             |  82 ++++++++---------
>  4 files changed, 151 insertions(+), 44 deletions(-)
>  create mode 100644 board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
