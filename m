From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:37:33 +0100
Subject: [Buildroot] [PATCH v2] package/freescale-imx/firmware-imx: fix
 the VPU firmware location
In-Reply-To: <20210113223039.14401-1-festevam@gmail.com>
References: <20210113223039.14401-1-festevam@gmail.com>
Message-ID: <20210114223733.27d24beb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Jan 2021 19:30:39 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The mainline kernel searches the coda VPU firmware inside the following
> locations [1]:
> 
> /lib/firmware/
> /lib/firmware/vpu/
> 
> Currently Buildroot installs the coda firmware into /lib/firmware/imx/vpu,
> which is not a valid location.
> 
> Fix it by installing the coda firmwares into /lib/firmware/vpu/ which
> is a valid path for both mainline and NXP vendor kernels. Also create a
> symlink to /lib/firmware/ so that mainline kernels do not need to wait
> more than 60 seconds to search again inside /lib/firmware/vpu/.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Suggested-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Create symlinks to /lib/firmware to speed up mainline kernels to
> found the VPU firmware.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
