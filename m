From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:23:56 +0100
Subject: [Buildroot] [PATCH v4 0/8] Add imx8mm platform using only
 upstream components
In-Reply-To: <20201125183017.15585-1-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-1-xroumegue@gmail.com>
Message-ID: <20210123232356.647548fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Xavier,

On Wed, 25 Nov 2020 19:30:09 +0100
Xavier Roumegue <xroumegue@gmail.com> wrote:

>  DEVELOPERS                                    |  3 ++
>  .../common/imx/genimage.cfg.template_imx8     |  2 +-
>  board/freescale/common/imx/post-image.sh      |  6 ++-
>  board/freescale/imx8mmevk/readme.txt          | 29 +++++++++++++-
>  boot/uboot/Config.in                          | 20 ++++++++++
>  boot/uboot/uboot.mk                           | 15 +++++++
>  configs/imx8mmevk_defconfig                   | 40 +++++++++++++++++++
>  package/freescale-imx/firmware-imx/Config.in  |  4 ++
>  .../firmware-imx/firmware-imx.mk              | 12 ++++++
>  9 files changed, 127 insertions(+), 4 deletions(-)
>  create mode 100644 configs/imx8mmevk_defconfig

Sorry for the long delay on this patch series, but I finally took some
time to look into it. Unfortunately, I'm still not quite happy about
how things are handled. I will reply to individual patches to explain
what I dislike and how I believe it should be changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
