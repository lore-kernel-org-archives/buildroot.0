From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 17:02:22 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/linux-firmware: add support
 for nvidia files
In-Reply-To: <20200606034839.352118-1-christian@paral.in>
References: <20200606034839.352118-1-christian@paral.in>
Message-ID: <20200606170222.268eeda8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Jun 2020 20:48:39 -0700
Christian Stewart <christian@paral.in> wrote:

> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index eba58014b6..2d729716aa 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_I915
>  	help
>  	  Firmware files for the Intel i915 video cards.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_NVIDIA
> +	bool "Nvidia video card firmware"
> +	help
> +	  Firmware files for the Nvidia video cards.

For most other firmware files, we have more fine grained options. When
I look at the nvidia/ folder, it has firmware for various graphics
cards:

gk20a
gm200
gm204
gm206
gm20b
gp100
gp102
gp104
gp106
gp107
gp108
gp10b
gv100
tegra124
tegra186
tegra194
tegra210
tu102
tu104
tu106
tu10x

Size-wise, it goes like this:

116K	./gm200
96K	./gp107
36K	./gp106
44K	./gm206
120K	./gp100
28K	./gm204
340K	./tu10x
148K	./tegra210
116K	./gp108
128K	./tegra194
164K	./gm20b
68K	./gk20a
368K	./gp102
276K	./gv100
128K	./tu106
128K	./tu104
148K	./tegra186
76K	./gp104
196K	./gp10b
272K	./tu102
152K	./tegra124
3,1M	.

So, in practice, on a given platform, you would typically need only
100-200 KB of firmware on the total 3.1 MB.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
