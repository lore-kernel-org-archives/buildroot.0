From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 May 2017 22:11:33 +0200
Subject: [Buildroot] [PATCH v3] rpi-bt-firmware: new package
In-Reply-To: <a8dbc814558874942a3b44a49a0a59eb858fa787.1490074258.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 21 Mar 2017 07:30:58 +0200")
References: <a8dbc814558874942a3b44a49a0a59eb858fa787.1490074258.git.baruch@tkos.co.il>
Message-ID: <878tmdd7ka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add firmware file for the Raspberry Pi 3 and Zero W Bluetooth module.
 > Note that to successfully download the firmware bluez5_utils needs a patch[1].

 > Even though the firmware file name (BCM43430A1.hcd) only mentions the
 > Bluetooth module, it is most likely tailored for the Raspberry Pi boards.
 > Firmware for the same BT module on other boards look different. For this
 > reason the name of the package is rpi-bt-firmware.

 > [1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v3: Justify the package name in the commit log (Thomas P)

 > v2: mention RPi Zero W in the commit log (Martin Bark)
 > ---
 >  package/Config.in                          |  1 +
 >  package/rpi-bt-firmware/Config.in          |  7 +++++++
 >  package/rpi-bt-firmware/rpi-bt-firmware.mk | 21 +++++++++++++++++++++
 >  3 files changed, 29 insertions(+)
 >  create mode 100644 package/rpi-bt-firmware/Config.in
 >  create mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 5ec3e8bd2318..93f85356c75d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -342,6 +342,7 @@ menu "Firmware"
 >  	source "package/b43-firmware/Config.in"
 >  	source "package/linux-firmware/Config.in"
 >  	source "package/rpi-firmware/Config.in"
 > +	source "package/rpi-bt-firmware/Config.in"

fixed ordering and committed, thanks!

-- 
Bye, Peter Korsgaard
