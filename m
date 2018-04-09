From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 23:13:27 +0200
Subject: [Buildroot] [PATCH v2-RESEND 3/6] zynqmp-pmufw-binaries: new
 package
In-Reply-To: <1523032461-3295-4-git-send-email-luca@lucaceresoli.net>
References: <1523032461-3295-1-git-send-email-luca@lucaceresoli.net>
 <1523032461-3295-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180409231327.28e2b2e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 18:34:18 +0200, Luca Ceresoli wrote:

> diff --git a/boot/zynqmp-pmufw-binaries/Config.in b/boot/zynqmp-pmufw-binaries/Config.in
> new file mode 100644
> index 000000000000..e39561cbf91e
> --- /dev/null
> +++ b/boot/zynqmp-pmufw-binaries/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_TARGET_ZYNQMP_PMUFW_BINARIES
> +	bool "Zynqmp PMU firmware"
> +	depends on BR2_aarch64
> +	help
> +	  This package provides precompiled firmwares for the Platform
> +	  Management Unit (PMU) of the Xilinx ZynqMP family of SoCs.
> +
> +	  https://github.com/lucaceresoli/zynqmp-pmufw-binaries
> +
> +if BR2_TARGET_ZYNQMP_PMUFW_BINARIES
> +
> +config BR2_TARGET_ZYNQMP_PMUFW_BINARIES_IMAGE
> +	string "PMU firmware image file"
> +	help
> +	  Enter the path to the PMU firmware file for your board and
> +	  configuration, relative to the repository top directory.
> +	  Example: "zcu106-default/pmufw.bin".

So this hints at the fact that this firmware is board specific. Is that
correct ? If so, shouldn't we plan on making the Git repo and its
version configurable ?

I mean, what are the chances that for some random ZynqMP board, your
Github repo will contain the appropriate firmware file ?

Generally speaking, it's a bit annoying that we can't build this from
source. I understand it needs a Microblaze toolchain, so it's very
difficult to integrate in Buildroot :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
