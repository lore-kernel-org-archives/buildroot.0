From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:36:01 +0200
Subject: [Buildroot] [PATCH v2 1/3] configs/pc: refactor to use genimage
 and grub.cfg
In-Reply-To: <20171022135426.28901-1-nunes.erico@gmail.com>
References: <20171022135426.28901-1-nunes.erico@gmail.com>
Message-ID: <20171022163601.0cde6493@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 15:54:24 +0200, Erico Nunes wrote:
> This simplifies the pc configs and respective post image scripts to use
> the shared genimage script and separate grub config files.
> Separate grub files are cleaner to maintain and easier to copy and
> modify, for example to support booting the pc defconfigs in qemu.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v1 -> v2:
>   - Drop the BR2_TARGET_GRUB2_CFG proposed use since the patch was
>   dropped.
> ---
>  board/pc/grub-bios.cfg           |  6 ++++++
>  board/pc/grub-efi.cfg            |  6 ++++++
>  board/pc/post-image.sh           | 29 ++++-------------------------
>  configs/pc_x86_64_bios_defconfig |  3 ++-
>  configs/pc_x86_64_efi_defconfig  |  3 ++-
>  5 files changed, 20 insertions(+), 27 deletions(-)
>  create mode 100644 board/pc/grub-bios.cfg
>  create mode 100755 board/pc/grub-efi.cfg

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
