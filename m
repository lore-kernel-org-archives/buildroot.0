From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 23:01:45 +0200
Subject: [Buildroot] [PATCH] configs: Add support for imx7dpico board
In-Reply-To: <1501768202-12357-1-git-send-email-vanessa.maegima@nxp.com>
References: <1501768202-12357-1-git-send-email-vanessa.maegima@nxp.com>
Message-ID: <20170814230145.3f151486@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Aug 2017 10:50:02 -0300, Vanessa Maegima wrote:
> Add support for imx7d-pico, which is a board based on NXP
> i.MX7D processor.
> 
> For more information about this board, please visit:
> http://www.technexion.org/products/pico/pico-som/pico-imx7-emmc
> 
> Signed-off-by: Vanessa Maegima <vanessa.maegima@nxp.com>

Thanks, I've applied to the next branch, after doing a few tweaks, see
below.

> ---
>  ...01-ARM-dts-imx7d-pico-Add-initial-support.patch | 429 +++++++++++++++++++++
>  ...2-ARM-dts-imx7d-pico-Add-watchdog-support.patch |  48 +++
>  ...7d-pico-Pass-no-1-8-v-property-to-the-eMM.patch |  33 ++
>  ...RM-dts-imx7-Fix-typo-in-watchdog-pin-name.patch |  89 +++++

It would have been nice to indicate the upstream status of those
patches, especially since all of them are in Linus tree and therefore
will be in Linux 4.13. I've added a "Upstream: ..." tag to each of
them, with a link to the upstream commit.


> +Build
> +=====
> +
> +First, configure Buildroot for the i.MX6UL Pico board:

I'm sure you wanted to say i.MX7D Pico board here, so I've fixed that.

> +Create a bootable SD card

We're not creating a bootable SD card here, but flashing the internal
eMMC, so I've adjusted that as well.


> +# audio
> +BR2_PACKAGE_ALSA_UTILS=y
> +BR2_PACKAGE_ALSA_UTILS_AMIXER=y
> +BR2_PACKAGE_ALSA_UTILS_APLAY=y

We want our defconfigs to be minimal, so I've dropped those additional
packages.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
