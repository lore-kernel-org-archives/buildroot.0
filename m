From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:42:54 +0200
Subject: [Buildroot] [PATCH 1/2] board/wandboard: Switch to extlinux.conf
In-Reply-To: <20210711124824.1025887-1-festevam@gmail.com>
References: <20210711124824.1025887-1-festevam@gmail.com>
Message-ID: <20210718234254.5a3e3cea@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 11 Jul 2021 09:48:23 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently wandboard uses a custom boot.scr.txt script
> and custom image generation scripts, genimage.cfg and 
> post-build.sh.
> 
> Switch to using the more standard extlinux.conf solution
> and remove the custom scripts in favor of the standard
> board/freescale/common/imx/post-image.sh one.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/wandboard/boot.scr.txt                  |  7 ----
>  board/wandboard/genimage.cfg                  | 32 -------------------
>  board/wandboard/post-build.sh                 |  8 -----
>  .../boot/extlinux/extlinux.conf               |  4 +++
>  configs/wandboard_defconfig                   |  5 ++-
>  5 files changed, 6 insertions(+), 50 deletions(-)
>  delete mode 100644 board/wandboard/boot.scr.txt
>  delete mode 100644 board/wandboard/genimage.cfg
>  delete mode 100755 board/wandboard/post-build.sh
>  create mode 100644 board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
