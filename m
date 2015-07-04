From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:03:59 +0200
Subject: [Buildroot] [PATCH v4 1/1] board: add support for WarPboard
In-Reply-To: <1435742562-31718-1-git-send-email-lambertarthur22@gmail.com>
References: <1435742562-31718-1-git-send-email-lambertarthur22@gmail.com>
Message-ID: <20150704150359.48f5a3a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arthur LAMBERT,

On Wed,  1 Jul 2015 11:22:42 +0200, Arthur LAMBERT wrote:
> This is a set of patch to add support for warpboard
> (Freescale board based on imx6sl)
> 
> The patch contains :
>   - defconfig for warpboard
>   - linux patches from Fabio Estevam to fix device tree due to last change on
>   warpboard schematics (rev 1.12) and to fix kernel imx_v6_v7 defconfig which
>   use incorrect hci protocol
>   - specific firmware file for warpboard bluetooth
>   nvram : brcmfmac4330-sdio.txt
> 
> Origin of nvram config file for wifi :
> https://github.com/Freescale/meta-fsl-arm-extra
> 
> Signed-off-by: Arthur LAMBERT <arthur@dreem.com>
> ---
> Changes v3 -> v4:
>   - Commit log should be wrapped to 80 columns
>   - Add more details about bluetooth and rootfs in README
>   - Enable host-dfu-util in defconfig
> Changes v2 -> v3:
>   - Use imx_v6_v7_defconfig instead of custom config.
>   - Add patch to enable good hci protocol for bluetooth in kernel config
>   - Use internal sdma firmware instead of external since the 1.12 integrate
>   good firmware.
>   - Fix some typo
>   - Add some extra info in README and remove useless section
>   - Fix patch naming convention
>   - Use GLOBAL_PATH_DIR for all patches
>   - Move some section in defconfig to keep .config ordering
>   - Upgrade uboot to 2015.07-rc2 to fix bug on dfu process
> Changes v1 -> v2:
>   - add specific kernel headers
>   - use wget download rather than git download for kernel
>   - fix version symbol for uboot
>   - add imx_usb_loader host utility
>   - remove bin firmware file and enable linux-firmware package instead
>   - fix command to enable bluetooth and fix protocol for hci in custom
>   kernel config

Applied after doing a good number of misc improvements to the README
file, as discussed earlier in this thread. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
