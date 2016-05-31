From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:16:50 +0200
Subject: [Buildroot] [PATCH] configs: new configuration for i.MX6UL Pico
 board
In-Reply-To: <1463601264-16293-1-git-send-email-festevam@gmail.com>
References: <1463601264-16293-1-git-send-email-festevam@gmail.com>
Message-ID: <20160531221650.385eccad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 16:54:24 -0300, Fabio Estevam wrote:
> Add support for Technexion's i.MX6UL Pico board.
> 
> For information about this board, please visit:
> http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf
> 
> Currently two patches are needed, but in the future they can be removed
> when we switch to kernel 4.7 and U-boot 2016.07 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

This generally looks good, but we generally like when a readme.txt is
added to indicate how to quickly setup the board to use the Buildroot
image.


> diff --git a/board/technexion/imx6ulpico/post-image.sh b/board/technexion/imx6ulpico/post-image.sh
> new file mode 100755
> index 0000000..b0917fc
> --- /dev/null
> +++ b/board/technexion/imx6ulpico/post-image.sh
> @@ -0,0 +1,15 @@
> +#!/usr/bin/env bash
> +
> +GENIMAGE_CFG="board/technexion/imx6ulpico/genimage.cfg"

Maybe use the $(dirname $0) trick ?

Other than that, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
