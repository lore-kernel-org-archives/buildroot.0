From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 16:27:49 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <718ddc67-8e29-1c1b-3a73-74ada73662ab@oliseo.fr> ("Guillaume
 GARDET - =?utf-8?Q?Olis=C3=A9o=22's?= message of "Mon, 30 Jan 2017 16:14:40
 +0100")
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
 <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
 <87ziiffdqw.fsf@dell.be.48ers.dk>
 <718ddc67-8e29-1c1b-3a73-74ada73662ab@oliseo.fr>
Message-ID: <871svk8t56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:

Hi,

 >> Can you confirm that it works if you enable that option.
 >> 

 > I get back the hardware for testing and it still does not work, even if I enable CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y :
 >     phy0 -> rt2x00lib_request_firmware: Info - Loading firmware file 'rt2870.bin'.
 > and after 60 seconds, I get:
 >     phy0 -> rt2x00lib_request_firmware: Error - Failed to request Firmware.
 >     phy0 -> rt2x00lib_request_firmware: Error - Error is '-2'.

 > Whereas the firmware file is in /lib/firmware/

 > Any idea what could be wrong?

Not really. Please double check that you enabled
CONFIG_FEATURE_MDEV_LOAD_FIRMWARE in busybox. To debug further, I
suggest you stick some fprintf statements (E.G. to your serial port /
console) in mdev.c to see if it gets called and what is going on.

-- 
Bye, Peter Korsgaard
