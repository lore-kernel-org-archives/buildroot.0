From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sun, 3 May 2020 12:46:11 +0530
Subject: [Buildroot] [PATCH] configs/rockpro64: new defconfig
In-Reply-To: <379680d1-7ba1-fb36-cdf4-e5f7985c4cd4@gmail.com>
References: <1588372460-5296-1-git-send-email-sunil@amarulasolutions.com>
 <379680d1-7ba1-fb36-cdf4-e5f7985c4cd4@gmail.com>
Message-ID: <CAM+7aWsjaOtzdLiubXjkx2JDcKd67NJgGif9ZkB=0UdvrW34kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sun, May 3, 2020 at 2:44 AM Romain Naour <romain.naour@gmail.com> wrote:

> Hi Suniel,
>
> Le 02/05/2020 ? 00:34, sunil at amarulasolutions.com a ?crit :
> > From: Suniel Mahesh <sunil@amarulasolutions.com>
> >
> > A defconfig for the rockpro64 was added in
> > 59e1077b4ebe79622a454b0a8a840e4349a0440d, but then removed
> > in 10f49213b7e2837ae6ed63fc16fbdaa954ecd87f because an ARM32
> > compiler was needed to build ATF, and this was not supported
> > back then.
> >
> > Now, since package/arm-gnu-a-toolchain/ has been added, this
> > defconfig can be re-introduced.
> >
> > Following new changes are introduced in comparision with the
> > older changeset:
> >
> >     - renamed defconfig from pine64_rockpro64 to rockpro64
> >     - updated readme
> >     - using a GPT partition layout
> >     - update defconfig to build ATF
> >     - bump u-boot to 2020.04
> >     - bump linux to 5.4.35
> >
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> > ---
>
> [...]
>
> > +
> > +# Firmware
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
> >
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
> > +
> > +# Bootloader
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
>
> Not related to this patch but our rock64 defconfig is currently broken [1]
> since
> a while due to incompatibility between uboot-2017.09-rockchip-ayufan fork
> and
> pylibfdt. Even with the latest version [2], it doesn't build.
>
> Do you think we can update to rock64 uboot to 2020.04 and use
> rock64-rk3328_defconfig ?
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/535054620
> [2]
>
> https://github.com/ayufan-rock64/linux-u-boot/releases/tag/2017.09-rockchip-ayufan-1065-g95f6152134
>
> Thanks!
>

Yes you can try that, also you can bump up kernel and ATF versions. Hope
that works.

Suniel


>
> Best regards,
> Romain
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200503/9e4ff45c/attachment.html>
