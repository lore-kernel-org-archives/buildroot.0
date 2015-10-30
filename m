From: David Picard <davepiq@yahoo.fr>
Date: Fri, 30 Oct 2015 17:55:56 +0100
Subject: [Buildroot] Qt5 and touchscreen calibration
Message-ID: <5633A11C.6070706@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


I got my touchscreen working perfectly with ts_test. Many thanks to 
Peter Seiderer !

But the thing is that my Qt5 app does not grab the touchscreen properly 
: x and y axis are switched. I did enable the tslib option under Qt5 in 
menuconfig. Is there some magic command line option to pass to the 
application ? I tried this :

$ myapp -platform linuxfb:fb=/dev/fb1 -plugin tslib
ts_open() failed (No such file or directory)

 >>> the app shows up, but TS still messed up.

My config :
- Raspberry Pi B+ and Adafruit 2.8" PiTFT w/ cap touch.
- Buildroot 2015.08.1
- Qt5 w/ tslib support enabled (BR2_PACKAGE_QT5BASE_TSLIB=y).


Regards,
David.
