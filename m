From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Apr 2020 17:05:28 -0300
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <20200428085346.GA183828@p1g2>
References: <20200427213402.6148-1-xroumegue@gmail.com>
 <20200427235704.56fcde61@windsurf.home>
 <20200428085346.GA183828@p1g2>
Message-ID: <CAOMZO5B1P2Or2HXK8AD_nt-COsLXAM0hKvZkZA2wcwxBrCvgmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 28, 2020 at 5:53 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Same, thanks for this proposal. However I'm not sure adding another
> script to basically do the same thing is the preferred option.
> The main difference being that it uses the U-Boot mkimage instead of
> imx-mkimage.
>
> Ideally I'd like to be able to use the flash.bin U-Boot target so that
> we get rid of those post-build scripts for good.
>
> Thomas, what U-Boot needs (for imx8m) are the DDR/HDMI firmware files from
> firmware-imx package. The main issue actually is that U-Boot looks for
> those binaries at its root. If we could make it point to $BINARIES_DIR
> instead, we could use 'flash.bin' target with U-Boot custom dependencies
> [1] (if this patch gets accepted) to ensure firmware-imx was built
> beforehand.
>
> Otherwise, if we decide to keep a post-build script, I'd rather have
> only one, preferrably this one as it doesn't depend on imx-mkimage.
> But as Fabio mentioned, it also needs to support 8QXP/8QM, then we could
> replaces imx8-bootloader-prepare.sh and also remove imx-mkimage package.
>
> Let me know your thoughts.

In case it helps, Jon Nettleton also worked on adding Buildroot
support for i.MX8M booting mainline U-Boot at:
https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572

Glad to see Xavier's patch and looking forward to being able to
generate a Buildroot image for i.MX8M/8X that can boot mainline U-Boot
and kernel.

Thanks
