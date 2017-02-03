From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Feb 2017 14:18:46 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <47a61250-05eb-b3e6-54f6-3bb27e897f0e@oliseo.fr> ("Guillaume
 GARDET - =?utf-8?Q?Olis=C3=A9o=22's?= message of "Fri, 3 Feb 2017 10:51:56
 +0100")
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
 <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
 <87ziiffdqw.fsf@dell.be.48ers.dk>
 <718ddc67-8e29-1c1b-3a73-74ada73662ab@oliseo.fr>
 <871svk8t56.fsf@dell.be.48ers.dk>
 <47a61250-05eb-b3e6-54f6-3bb27e897f0e@oliseo.fr>
Message-ID: <87vasr1kg9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:

 > Hi,
 > I found the problem thanks to mdev log:
 >     mdev[716]: 00:04:57.841774 ACTION:add SUBSYSTEM:firmware
 > DEVNAME:(null)
 > DEVPATH:/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
 > FW:rt2870.bin
 >     mdev[716]: rule matched, line -1
 >     mdev[716]: can't change directory to
 > '/sys/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0':
 > No such file or directory
 >     mdev[717]: 00:05:57.982454 ACTION:remove SUBSYSTEM:firmware
 > DEVNAME:(null)
 > DEVPATH:/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
 > FW:rt2870.bin
 >     mdev[717]: 00:05:57.982545 exiting

 > The thing is that the PATH is not good :
 > * requested : /sys/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
 > * real: /sys/devices/platform/musb-omap2430.0/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0

 > The only difference is the ".0" missing after musb-omap2430. Any idea why there is this difference?

This information is all from the kernel, so it sounds like a bug
somewhere (presumably musb or rt2xxx drivers).

-- 
Bye, Peter Korsgaard
