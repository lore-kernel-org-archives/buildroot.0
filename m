From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Sat, 16 Jan 2021 21:31:18 +0000
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <0f9e83af-c4fb-50f2-feeb-9768a97aa94d@gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>,
 <0f9e83af-c4fb-50f2-feeb-9768a97aa94d@gmail.com>
Message-ID: <PA4PR04MB7920F971C3C02747462F012DA7A60@PA4PR04MB7920.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Hi Stephane,

Hi Romain, 

>Le 05/01/2021 ? 16:24, Stephane Viau a ?crit :
>> - Same version as NXP release 5.4.70-2.3.0
>> - EULA/COPYING: update to LA_OPT_NXP_Software_License v17
>> 
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
>Still not related to this version bump but the sdma firmwares for imx[6,7,8] are
>provided by two packages: firmware-imx and linux-firmware
>
>$ sha256sum ./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
>7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
>./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
>
>$ sha256sum  ./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
>7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
>./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
>
>We have two options: BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME and
>BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA

I don't know the whole history behind the presence of both options but
what I know is that some effort has been put in over the last 6 months or so to
clean up the package/freescale-imx/firmware-imx, including the logic behind "when
to fetch the sdma firmware?" (BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW).

>
>The only difference is that firmware-imx provide firmware for old imx cpus.
>
>$ ls linux-firmware-20201022/imx/sdma/sdma-imx
>sdma-imx6q.bin  sdma-imx7d.bin
>
>$ ls firmware-imx-8.10/firmware/sdma/sdma-imx
>sdma-imx25-to1.bin  sdma-imx31-to1.bin  sdma-imx31-to2.bin  sdma-imx35-to1.bin
>sdma-imx35-to2.bin  sdma-imx51-to3.bin  sdma-imx53-to1.bin  sdma-imx6q.bin
>sdma-imx7d.bin
>
>Maybe we can keep one of firmware provider.

If a choice must be made, I'd pick the former option rather than the latter...
but that's just my opinion.

BR,
Stephane.

>
>Best regards,
>Romain
