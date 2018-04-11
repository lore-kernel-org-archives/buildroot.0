From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 09:03:59 +0200
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Qualcomm video
 firmware option
In-Reply-To: <CAEj2-1MXk1LHVQbJ8+68rncDMEYf6GpjC5daO5GrRA9Wyf-FXw@mail.gmail.com>
References: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
 <20180326233251.22f44208@windsurf.home>
 <CAEj2-1MXk1LHVQbJ8+68rncDMEYf6GpjC5daO5GrRA9Wyf-FXw@mail.gmail.com>
Message-ID: <20180411090359.7a25742c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

On Wed, 11 Apr 2018 02:09:46 +0000, Andre Renaud wrote:
> Added Qualcomm video accelerator and GPU firmware option.
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk | 10 ++++++++++
>  2 files changed, 20 insertions(+)

Thanks for this new version! Could you please sent this as a proper new
patch with git send-email, and not pasted above the previous patch?
Also, see beloiw.

> diff --git a/package/linux-firmware/Config.in
> b/package/linux-firmware/Config.in
> index 4e77a3f9a3..9d8d8b340b 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -29,6 +29,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
>   help
>     Firmware files for AMD Radeon video cards.
> 
> +config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS
> +       bool "Qualcomm Venus video codec accelerator"
> +       help

Indentation should be done with tabs

> +         Firmware files for Qualcomm Venus video codec accelerator

And here one tab + 2 spaces.

You can run ./utils/check-package package/linux-firmware/Config.in,
which well validate this kind of trivial coding style issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
