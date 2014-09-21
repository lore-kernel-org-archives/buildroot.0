From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:25:19 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
 support
In-Reply-To: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140921212519.296ade2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Fri, 19 Sep 2014 16:12:48 +0200, Luca Ceresoli wrote:

> Luca Ceresoli (3):
>   configs/freescale_imx6qsabresd: rename imx6 to imx6q
>   configs/freescale_imx6dlsabresd: add defconfig for iMX6DL SabreSD
>   freescale/imx6-sabresd: document how to create a bootable SD
> 
> Vincent Stehl? (1):
>   imx6sabresd: boot to /init in mfgtools mode

I've applied your four patches. However, I'd like to see additional
patches to make the following improvements:

 * For the defconfigs, select a specific version of the kernel headers.
   Currently, your defconfigs are building a 3.10 kernel, but the
   kernel headers used in the toolchain are the latest ones (i.e 3.16
   currently), which is not good. This was already wrong in the
   existing defconfig, so I applied your patches nonetheless. But it
   should be fixed.

 * For the last patch adding a U-Boot patch, I believe we would prefer
   to use the global patch dir mechanism now, rather than the U-Boot
   specific option for patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
