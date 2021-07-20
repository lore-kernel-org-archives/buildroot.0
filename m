From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jul 2021 10:29:19 -0600
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: bump to version
 33e09977ff3b02967d191801e3361224455acb9d
In-Reply-To: <20210720182344.2f904646@gmx.net>
References: <20210720015810.3718225-1-james.hilliard1@gmail.com>
 <20210720182344.2f904646@gmx.net>
Message-ID: <CADvTj4rx+eBry1AjmYJ3EuGZJi-uLdq=40WM6Bpis3FXSnfONQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 20, 2021 at 10:23 AM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James,
>
> On Mon, 19 Jul 2021 19:58:10 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/rpi-firmware/rpi-firmware.hash | 2 +-
> >  package/rpi-firmware/rpi-firmware.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> > index 2abc920161..7127b2d824 100644
> > --- a/package/rpi-firmware/rpi-firmware.hash
> > +++ b/package/rpi-firmware/rpi-firmware.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed
> > -sha256  3ce2105247a91ffa86d317e7810e110b601a094d6781a219996d8bc9fbe98c6f  rpi-firmware-0e5a49eb2f7f066876c69cf5fe61625fb5c32f67.tar.gz
> > +sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
> >  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index 829f265c8e..181650fa08 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -RPI_FIRMWARE_VERSION = 0e5a49eb2f7f066876c69cf5fe61625fb5c32f67
> > +RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
> >  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
> >  RPI_FIRMWARE_LICENSE = BSD-3-Clause
> >  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
>
> Out of interest, any special/needed commits since the last bump?

Well I was hitting an error that looked like it might be fixed by some
more recent commits:
https://github.com/raspberrypi/firmware/commits/master

[   10.146517] ------------[ cut here ]------------
[   10.148992] Firmware transaction timeout
[   10.149120] WARNING: CPU: 0 PID: 5 at
drivers/firmware/raspberrypi.c:64 rpi_firmware_transaction+0xe4/0x110
[   10.156317] Modules linked in: brcmfmac brcmutil smsc95xx usbnet
mii raspberrypi_hwmon cfg80211 rfkill bcm2835_codec(C) i2c_bcm2835
sdhci_iproc bcm2835_isp(C) bcm2835_v4l2(C) bcm2835_mmal_vchiq(C)
v4l2_mem2mem videobuf2_vmalloc videobuf2_dma_contig vc_sm_cma(C)
videobuf2_memops videobuf2_v4l2 videobuf2_common uio_pdrv_genirq uio
v4l2loopback(O) videodev fuse ipv6
[   10.169277] CPU: 0 PID: 5 Comm: kworker/0:0 Tainted: G         C O
    5.10.46-v8 #1
[   10.172057] Hardware name: Raspberry Pi 3 Model B Rev 1.2 (DT)
[   10.174854] Workqueue: events get_values_poll [raspberrypi_hwmon]
[   10.177684] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[   10.180518] pc : rpi_firmware_transaction+0xe4/0x110
[   10.183334] lr : rpi_firmware_transaction+0xe4/0x110
[   10.186035] sp : ffffffc010043c80
[   10.188647] x29: ffffffc010043c80 x28: 0000000000000000
[   10.191243] x27: ffffffbcc1d698c8 x26: ffffffd8ee9195c0
[   10.193796] x25: ffffffc010470008 x24: 0000000000001000
[   10.196383] x23: ffffffbcc565f600 x22: ffffffbcc2498ec0
[   10.198915] x21: ffffffd8ee8ad008 x20: ffffffbcc2498e80
[   10.201437] x19: 00000000ffffff92 x18: 0000000000000030
[   10.203981] x17: 0000000000000000 x16: 0000000000000001
[   10.206502] x15: ffffffffffffffff x14: ffffffc0900438c7
[   10.209015] x13: ffffffd8ee014038 x12: 0000000000000010
[   10.211514] x11: 00000000ffffffff x10: 0000000000000058
[   10.213934] x9 : ffffffd8ed4acd00 x8 : ffffffd8ee7b7c18
[   10.216292] x7 : ffffffd8ee749000 x6 : ffffffd8ee749168
[   10.218569] x5 : 0000000000000001 x4 : 0000000000000000
[   10.220843] x3 : 0000000000000027 x2 : 0000000000000000
[   10.223069] x1 : 0000000000000000 x0 : ffffffbcc1db8000
[   10.225275] Call trace:
[   10.227390]  rpi_firmware_transaction+0xe4/0x110
[   10.229470]  rpi_firmware_property_list+0xc0/0x180
[   10.231474]  rpi_firmware_property+0x7c/0x120
[   10.233385]  get_values_poll+0x54/0x170 [raspberrypi_hwmon]
[   10.235263]  process_one_work+0x1d4/0x4c0
[   10.237061]  worker_thread+0x144/0x470
[   10.238781]  kthread+0x14c/0x160
[   10.240427]  ret_from_fork+0x10/0x38
[   10.242018] ---[ end trace 662c75d288e500f5 ]---

Haven't fully tested if this actually fixes that yet though.

>
> Regards,
> Peter
>
