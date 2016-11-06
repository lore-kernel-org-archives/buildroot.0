From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:44:29 +0100
Subject: [Buildroot] [PATCH 1/2] freescale: Add a standard genimage
 script for MX23/MX28
In-Reply-To: <1478459535-20024-1-git-send-email-festevam@gmail.com>
References: <1478459535-20024-1-git-send-email-festevam@gmail.com>
Message-ID: <20161106224429.31666d66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 17:12:14 -0200, Fabio Estevam wrote:
> Add a standard genimage script for the MXS processors (MX23 and MX28).
> 
> Based on the common scripts for the other imx devices:
> board/freescale/common/genimage.cfg.template
> board/freescale/common/post-image.sh
> 
> This makes it easier to add new MX23/MX28 boards configurations into
> Buildroot.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/mxs/genimage.cfg.template | 39 +++++++++++++++++
>  board/freescale/common/mxs/post-image.sh         | 54 ++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 board/freescale/common/mxs/genimage.cfg.template
>  create mode 100755 board/freescale/common/mxs/post-image.sh

I've applied both to next. However, we now have this a bit weird
hierarchy:

board/freescale/common/
??? genimage.cfg.template
??? mxs
??? ??? genimage.cfg.template
??? ??? post-image.sh
??? post-image.sh

Perhaps we should move the i.MX genimage.cfg.template and post-image.sh
in an imx/ sub-directory? This means adjusting all the defconfig, but
it can be done mechanically.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
