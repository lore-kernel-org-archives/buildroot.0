From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Sep 2020 23:49:38 +0200
Subject: [Buildroot] [PATCH] manual: board support: add more of our
 expectations
In-Reply-To: <20200902213255.2419536-1-arnout@mind.be>
References: <20200902213255.2419536-1-arnout@mind.be>
Message-ID: <20200902214938.GX14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-09-02 23:32 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The manual has a section on adding board support to upstream buildroot,
> but it fails to mention some of the things we expect. Add more of them.
> 
> - Internal toolchain.
> - Beautify defconfig file.
> - Fixed versions for components.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Adam Duskett <Aduskett@gmail.com>

Applied to master, with the following changes:

  - use +monospace+ for the variables
  - use _italic_ for sections in defconfig

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-board-support.txt | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> index f6d74ae1f4..9937f77f7f 100644
> --- a/docs/manual/adding-board-support.txt
> +++ b/docs/manual/adding-board-support.txt
> @@ -10,9 +10,9 @@ that is known to work. You are welcome to add support for other boards
>  to Buildroot too.
>  
>  To do so, you need to create a normal Buildroot configuration that
> -builds a basic system for the hardware: toolchain, kernel, bootloader,
> -filesystem and a simple BusyBox-only userspace. No specific package
> -should be selected: the configuration should be as minimal as
> +builds a basic system for the hardware: (internal) toolchain, kernel,
> +bootloader, filesystem and a simple BusyBox-only userspace. No specific
> +package should be selected: the configuration should be as minimal as
>  possible, and should only build a working basic BusyBox system for the
>  target platform. You can of course use more complicated configurations
>  for your internal projects, but the Buildroot project will only
> @@ -22,7 +22,17 @@ selections are highly application-specific.
>  Once you have a known working configuration, run +make
>  savedefconfig+. This will generate a minimal +defconfig+ file at the
>  root of the Buildroot source tree. Move this file into the +configs/+
> -directory, and rename it +<boardname>_defconfig+.
> +directory, and rename it +<boardname>_defconfig+. If the configuration
> +is a bit more complicated, it is nice to manually reformat it and
> +separate it into sections, with a comment before each section. Typical
> +sections are Architecture, Toolchain options (typically just linux
> +headers version), Firmware, Bootloader, Kernel, Filesystem.
> +
> +Always use fixed versions or commit hashes for the different
> +components, not the "latest" version. For example, set
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y and
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE to the kernel version you tested
> +with.
>  
>  It is recommended to use as much as possible upstream versions of the
>  Linux kernel and bootloaders, and to use as much as possible default
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
