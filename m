From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 May 2017 11:28:24 +0200
Subject: [Buildroot] [PATCH] rpi-wifi-firmware: new package
In-Reply-To: <20170506091010.GE2934@scaer> (Yann E. MORIN's message of "Sat, 6
 May 2017 11:10:10 +0200")
References: <20170505183741.30214-1-peter@korsgaard.com>
 <20170506082758.GD2934@scaer> <871ss2s717.fsf@dell.be.48ers.dk>
 <20170506091010.GE2934@scaer>
Message-ID: <87k25uqqpz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I disagree. I haven't found any detailed documentation, but my
 >> understanding is that this nvram data is board(-family) specific,
 >> E.G. it differs between the sunxi boards. From what I could find, the
 >> rpi0-w uses the same nvram file as rpi3 though.

 > If it is (familly-of-)board-specific then keep the dependency, then.

Ok, good.

 >> >> +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
 >> >> @@ -0,0 +1,22 @@
 >> >> +################################################################################
 >> >> +#
 >> >> +# rpi-wifi-firmware
 >> >> +#
 >> >> +################################################################################
 >> >> +
 >> >> +RPI_WIFI_FIRMWARE_VERSION = 54bab3d6a6d43239c71d26464e6e10e5067ffea7
 >> >> +# brcmfmac43430-sdio.bin comes from linux-firmware
 >> >> +RPI_WIFI_FIRMWARE_SOURCE = brcmfmac43430-sdio.txt
 >> >> +# git repo contains a lot of unrelated files
 >> >> +RPI_WIFI_FIRMWARE_SITE =
 >> >> https://raw.githubusercontent.com/RPi-Distro/firmware-nonfree/$(RPI_WIFI_FIRMWARE_VERSION)/brcm80211/brcm
 >> 
 >> > License?
 >> 
 >> Yeah, that's where things get complicated. There is no explicit license
 >> given. The other brcm*bin files in linux-firmware are covered by
 >> LICENCE.broadcom_bcm43xx, but the question is if this also applies to
 >> this nvram file.
 >> 
 >> Maybe we should just do:
 >> 
 >> RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 >> 
 >> Like we do for the bluetooth part.

 > The OpenSUSE link you pointed above states:

 >     # From
 >     # https://github.com/raspberrypi/linux/issues/1325#issuecomment-195560582
 >     # Phil Elwell (Raspberry Pi Foundation) wrote: "Broadcom have said that
 >     # the firmware files for the BCM43438 are covered under this licence:"
 >     Source0:
 >     https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/LICENCE.broadcom_bcm43xx

Yes, the question is just if that only covers the generic .bin file or
also the board(-family) specific nvram file, but OK.

As rpi-wifi-firmware already pulls in the .bin file from linux-firmware
(and hence LICENSE.broadcom_bcm43xx) I'll just set _FIRMWARE_LICENSE to
PROPRIETARY and not specify any license file here.

 > BTW, I love the way they force local names to be board-specific.

The # syntax?

-- 
Bye, Peter Korsgaard
