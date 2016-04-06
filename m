From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 6 Apr 2016 14:17:52 +0200
Subject: [Buildroot] [PATCH v2 0/4] sd card image generation for
	Xplained boards
In-Reply-To: <1459759965-14073-1-git-send-email-ludovic.desroches@atmel.com>
References: <1459759965-14073-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160406121752.GC2765@odux.rfo.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 04, 2016 at 10:52:41AM +0200, Ludovic Desroches wrote:
> Use genimage to generate a SD card image
> 
> Changes
> - v2:
>   - add missing host packages to generate the FAT partition
>   - cleanup post-image.sh
>   - update documentation
>

If it is ok, I'll send a v3, I have noticed some conflicts when applying
my patches.
 
> Ludovic Desroches (4):
>   configs: atmel: add sama5d2 xplained sd card image generation
>   configs: atmel: add sama5d4 xplained sd card image generation
>   configs: atmel: add sama5d3 xplained sd card image generation
>   board/atmel: update documentation for SD card generation
> 
>  board/atmel/readme.txt                         | 66 +++++++++++---------------
>  board/atmel/sama5d2_xplained_mmc/genimage.cfg  | 33 +++++++++++++
>  board/atmel/sama5d2_xplained_mmc/post-image.sh | 14 ++++++
>  board/atmel/sama5d3_xplained_mmc/genimage.cfg  | 33 +++++++++++++
>  board/atmel/sama5d3_xplained_mmc/post-image.sh | 14 ++++++
>  board/atmel/sama5d4_xplained_mmc/genimage.cfg  | 34 +++++++++++++
>  board/atmel/sama5d4_xplained_mmc/post-image.sh | 14 ++++++
>  configs/atmel_sama5d2_xplained_mmc_defconfig   |  6 +++
>  configs/atmel_sama5d3_xplained_mmc_defconfig   |  6 +++
>  configs/atmel_sama5d4_xplained_mmc_defconfig   |  7 ++-
>  10 files changed, 188 insertions(+), 39 deletions(-)
>  create mode 100644 board/atmel/sama5d2_xplained_mmc/genimage.cfg
>  create mode 100755 board/atmel/sama5d2_xplained_mmc/post-image.sh
>  create mode 100644 board/atmel/sama5d3_xplained_mmc/genimage.cfg
>  create mode 100755 board/atmel/sama5d3_xplained_mmc/post-image.sh
>  create mode 100644 board/atmel/sama5d4_xplained_mmc/genimage.cfg
>  create mode 100755 board/atmel/sama5d4_xplained_mmc/post-image.sh
> 
> -- 
> 2.5.0
> 
