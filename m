From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Oct 2016 08:44:54 -0200
Subject: [Buildroot] [PATCH 1/2] configs: add defconfig for TS-4600
In-Reply-To: <20161027000807.20206-2-sebastien.bourdelin@savoirfairelinux.com>
References: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161027000807.20206-2-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <CAOMZO5Acw0Hr8AW20k-FMtprFwQj84BQXaV8P9SLeHUR-jGzjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 26, 2016 at 10:08 PM, Sebastien Bourdelin
<sebastien.bourdelin@savoirfairelinux.com> wrote:
> The TS-4600 is a TS-SOCKET macrocontroller board based on the Freescale

microcontroller?

> i.MX28 ARM CPU.
>
> The TS-4600 uses a custom Linux 2.6.35 from Technologic Systems:
> https://github.com/embeddedarm/linux-2.6.35.3-imx28.git

What about adding mainline kernel support for this board? mx28 support
in mainline kernel is decent.

> The i.MX28 internal ROM loader supports a special image data that
> Freescale calls "bootstream".
> This bootstream contains a stream of boot commands and a boot image
> which here combines a TS custom version of Freescale imx-bootlets
> v10.12.01 and the Linux kernel.

Other option would be to use mainline U-Boot, which does not need the
separate imx-bootlets package.

> The custom imx-bootlets and its toolchain comes as a part of the Linux
> repository and the package ts4600-bootrom has been introduced to handle
> the bootstream generation.
>
> The ts4600-bootrom-sign tool has also been introduced to prepare the
> bootable partition image which prepends the TS Bootrom with a signature
> and the Boot Control Block required by the i.MX28 SoC when using the
> SD/MMC boot mode.
>
> A post-image script is provided to generate an image that can be
> directly written to an SD card.

I will give it a try on using your script on a mx28evk.

Thanks
