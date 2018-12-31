From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 18:48:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] board/pc: ensure grub.cfg is copied
 to target filesystem
In-Reply-To: <20181011222445.21185-1-greg@quimbo.fr>
References: <20181011214932.350ef220@windsurf>
 <20181011222445.21185-1-greg@quimbo.fr>
Message-ID: <20181231184823.62631e32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 00:24:45 +0200, Gr?goire Delattre wrote:
> From: Gr?goire Delattre <gregoire.delattre@gmail.com>
> 
> Before this commit, the grub configuration file was copied to the
> TARGET_DIR in a post-image hook, after the filesystem has been
> generated. It was kinda working because the board/pc's grub
> configuration and the default one are the same and the later was
> copied during the build process of the grub2 package.
> 
> This commit ensures the custom board/pc grub configuration is copied at
> the right time.
> 
> Signed-off-by: Gr?goire Delattre <gregoire.delattre@gmail.com>
> ---
>  board/pc/post-build.sh           | 15 +++++++++++++++
>  board/pc/post-image.sh           | 14 --------------
>  configs/pc_x86_64_bios_defconfig |  3 ++-
>  configs/pc_x86_64_efi_defconfig  |  3 ++-
>  4 files changed, 19 insertions(+), 16 deletions(-)
>  create mode 100755 board/pc/post-build.sh
>  delete mode 100755 board/pc/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
