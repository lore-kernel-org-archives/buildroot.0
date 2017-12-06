From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 6 Dec 2017 21:59:08 +0530
Subject: [Buildroot] [PATCH 4/8] uboot: add support for bundling ATF
 BL31 into U-Boot
In-Reply-To: <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-5-thomas.petazzoni@free-electrons.com>
Message-ID: <CAMty3ZA-AdbnTCaTfKT0Wrogkn7vtxLwUh5ayAky7Xe_3AzuTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 4, 2017 at 3:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Jagan Teki <jagannadh.teki@gmail.com>
>
> Some ARM64 platforms (such as Allwinner A64/H5) have a boot process
> where U-Boot encapsulates the BL31 part of the ARM trusted
> firmware. For such platforms, we need to build ATF before U-Boot, and
> pass a BL31 variable pointing to ATF bl31.bin to the U-Boot build
> process.
>
> This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31 variable to
> achieve this.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> [Thomas:
>  - Rename option to BR2_TARGET_UBOOT_NEEDS_ATF_BL31
>  - Drop changes to arm-trusted-firmware.mk, they are taken care of by
>    previous commits.
>  - Improve Config.in help text
>  - Add missing dependency on arm-trusted-firmware when
>    BR2_TARGET_UBOOT_NEEDS_ATF_BL31 is enabled.
>  - Use bl31.bin from $(BINARIES_DIR) instead of taking it from ATF's
>    build dir.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Tested-by: Jagan Teki <jagan@amarulasolutions.com>

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
