From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:36:28 +0100
Subject: [Buildroot] [PATCH v4 6/8] board/freescale/common/imx8: Use
 post build generated uboot image if present
In-Reply-To: <20201125183017.15585-7-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-7-xroumegue@gmail.com>
Message-ID: <20210123233628.323cc376@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Nov 2020 19:30:15 +0100
Xavier Roumegue <xroumegue@gmail.com> wrote:

> Stick the uboot image filename to "imx8-boot-sd.bin" in case the
> final uboot image, embedding fw files, is generated thanks to a post
> build script.
> 
> This takes precedence over all uboot images generating during uboot
> build.
> 
> This should help to remove the dedicated imx8 config template file
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> ---
>  board/freescale/common/imx/post-image.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I don't really understand what the purpose of this change is. Indeed,
you're not removing the dedicated imx8 config template file in your
patch series. And even your defconfig calls
board/freescale/common/imx/post-image.sh, which based on:

        elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
                echo "genimage.cfg.template_imx8"

will use the imx8 config template file for genimage.

So I'm rather confused by what's going on here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
