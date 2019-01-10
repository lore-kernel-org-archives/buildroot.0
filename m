From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:01:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware : Install binary
 blobs for e100 ethernet driver
In-Reply-To: <20190110171116.8176-1-dplamp@gmx.com>
References: <20190110171116.8176-1-dplamp@gmx.com>
Message-ID: <20190110210143.1c265970@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Thu, 10 Jan 2019 18:11:16 +0100, dplamp at gmx.com wrote:
> From: David Picard <dplamp@gmx.com>
> 
> Add an option in the menuconfig  submenu of linux-firmware package. Install
> the firmware binary files to the target directory if the option is selected.
> 
> Signed-off-by: David Picard <dplamp@gmx.com>
> ---
>  package/linux-firmware/Config.in         | 6 ++++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index dcc8d4bade..5df44d7a86 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -325,6 +325,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
>  	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
>  	  (cxgb4)
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_E100

I think BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100 would be preferable

> +	bool "e100 / Intel 825xx"

	bool "Intel e100 825xx"

so that it is similar to:

        bool "Intel iwlwifi 8265"

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
