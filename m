From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 12:17:27 +0200
Subject: [Buildroot] [PATCH] warpboard: linux.fragment: Do not use
 CONFIG_BRCMFMAC as built-in
In-Reply-To: <1469799930-20206-1-git-send-email-fabio.estevam@nxp.com>
References: <1469799930-20206-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20160730121727.2e05cb7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 10:45:30 -0300, Fabio Estevam wrote:
> Selecting the driver CONFIG_BRCMFMAC as built-in causes some probe issues
> as we cannot guarantee that the brcmfmac driver will be probed after the
> rootfs has been mounted. The brcmfmac driver retrieves the firmware and
> nvram file from the rootfs, so the rootfs should be mounted first.
> 
> To avoid such issues let the CONFIG_BRCMFMAC be built as module, which is
> the original option in imx_v6_v7_defconfig.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/freescale/warpboard/linux.fragment | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
