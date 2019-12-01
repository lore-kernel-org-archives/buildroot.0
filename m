From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 18:54:44 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add raspberrypi4 64bits
 defconfig
In-Reply-To: <c425434f-f7e9-682d-ea9e-6822aa885e69@smile.fr> (Romain Naour's
 message of "Fri, 29 Nov 2019 18:43:42 +0100")
References: <20191129160208.3520611-2-arthur.courtel@smile.fr>
 <c425434f-f7e9-682d-ea9e-6822aa885e69@smile.fr>
Message-ID: <87k17grkwr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Hi Arthur,
 > Le 29/11/2019 ? 17:02, Arthur Courtel a ?crit?:
 >> This configuration builds a 64bit image for RaspberryPi 4.
 >> 
 >> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
 >> ---
 >> .../raspberrypi/genimage-raspberrypi4-64.cfg  | 30 +++++++++++++++++++
 >> board/raspberrypi/post-image.sh               |  4 +--
 >> board/raspberrypi4-64                         |  1 +
 >> configs/raspberrypi4_64_defconfig             | 24 +++++++++++++++
 >> 4 files changed, 57 insertions(+), 2 deletions(-)
 >> create mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
 >> create mode 120000 board/raspberrypi4-64
 >> create mode 100644 configs/raspberrypi4_64_defconfig
 >> 
 >> diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
 >> new file mode 100644
 >> index 0000000000..3c480e98f0
 >> --- /dev/null
 >> +++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
 >> @@ -0,0 +1,30 @@
 >> +image boot.vfat {
 >> +  vfat {
 >> +    files = {
 >> +      "bcm2711-rpi-4-b.dtb",
 >> +      "rpi-firmware/cmdline.txt",
 >> +      "rpi-firmware/config.txt",
 >> +      "rpi-firmware/fixup4.dat",
 >> +      "rpi-firmware/start4.elf",
 >> +      "rpi-firmware/overlays",
 >> +      "Image"

 > Not related to your patch but the raspberry-pi3 defconfig use zImage but the
 > 64bit version use Image.

 > Any reason for this?

Image is the default name for arm64 kernels. There is no "zImage"
support for arm64.

-- 
Bye, Peter Korsgaard
