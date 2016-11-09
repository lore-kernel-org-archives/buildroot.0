From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:32:35 +0100
Subject: [Buildroot] [PATCH] configs: freescale_imx31_3stack: bump
 kernel version to 4.1.15_2.0.0_ga
In-Reply-To: <20161109163823.25501-1-vincent.stehle@laposte.net>
References: <20161105143516.00291507@free-electrons.com>
 <20161109163823.25501-1-vincent.stehle@laposte.net>
Message-ID: <20161109213235.5bfc10cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 17:38:23 +0100, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
> Switch to the kernel of release 4.1.15_2.0.0_ga, as it builds properly with
> gcc 5.x, which is now the default.
> 
> We add a linux config fragment to disable the framebuffer, to repair the
> build for imx_v6_v7_defconfig.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Signed-off-by: Julien Olivain <juju@cotds.org>
> Tested-by: Julien Olivain <juju@cotds.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>

Thanks a lot! I've applied to master, with one minor change.

> diff --git a/board/freescale/imx31_3stack/linux.fragment b/board/freescale/imx31_3stack/linux.fragment
> new file mode 100644
> index 0000000..8d89e8e
> --- /dev/null
> +++ b/board/freescale/imx31_3stack/linux.fragment
> @@ -0,0 +1 @@
> +CONFIG_FB_MXS=n

It is more conventional to write this as:

# CONFIG_FB_MXS is not set

which is what kconfig generates in a defconfig for an option that is
disabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
