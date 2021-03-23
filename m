From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Mar 2021 20:46:03 +0100
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
In-Reply-To: <CAPm8-H4Kq23eCBX0XeZReOdr7hHzQzPymzqZckDDfXCKV1Q_bg@mail.gmail.com>
References: <CAPm8-H4Kq23eCBX0XeZReOdr7hHzQzPymzqZckDDfXCKV1Q_bg@mail.gmail.com>
Message-ID: <20210323204603.60c02d67@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurentiu-Cristian,

On Tue, 23 Mar 2021 12:26:16 +0200, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:

> Hello buildroot community,
>
>   Please tell me what option should be enabled
> in buildroot 2020.11 in order to have for raspberry pi zero w:
> output/target/lib/firmware/brcm/brcmfmac43430-sdio.bin
> output/target/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi-rpi.txt
> output/target/lib/firmware/brcm/brcmfmac43430-sdio.txt
>   These are required by brcmfmac to have wifi working.
> By default they are not installed, even if I do
> make raspberrypi0w_defconfig

Not the buildroot defconfigs are about a minimal starting point (not full featured for
the supported board)....

The option BR2_PACKAGE_RPI_WIFI_FIRMWARE should be the one:
	$ make menuconfig
		--> Target packages
			--> Hardware Handling
				--> Firmware
					--> rpi-wifi-firmware

Regards,
Peter


>
> Thanks
> L-C
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
