From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 10:14:51 +0100
Subject: [Buildroot] [PATCH 7/9] package/rcw: Enable IIC5_PMUX and
 CLK_OUT_PMUX for GPIO
In-Reply-To: <20191120040725.32207-8-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-8-jerry.huang@nxp.com>
Message-ID: <20191120101451.34bd8120@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 12:07:23 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
> IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  ...5_PMUX-for-GPIO-function.patch.conditional | 42 +++++++++++++++++++
>  ...T_PMUX-for-GPIO-function.patch.conditional | 40 ++++++++++++++++++
>  package/rcw/rcw.mk                            |  7 ++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 package/rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch.conditional
>  create mode 100644 package/rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch.conditional

Sorry, but we really want to avoid conditional patches. Is there a
better solution than this ?

The patches modify only files in ls1028ardb/, and you apply them when
the board name is ls1028ardb, so basically, you could just as well
apply the patches unconditionally, no ?

> +ifeq ($(findstring ls1028ardb, $(BR2_TARGET_UBOOT_BOARDNAME)), ls1028ardb)

We really don't want to look at BR2_TARGET_UBOOT_BOARDNAME from package/rcw/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
