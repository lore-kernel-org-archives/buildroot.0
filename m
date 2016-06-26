From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Jun 2016 23:22:48 +0200
Subject: [Buildroot] USB network gadget
In-Reply-To: <CAF_dkJCHdmQxuzTR=V9NGXU8VoATRchDQOogub5ahDauR4MDqQ@mail.gmail.com>
References: <CAF_dkJCHdmQxuzTR=V9NGXU8VoATRchDQOogub5ahDauR4MDqQ@mail.gmail.com>
Message-ID: <88101a7e-fdd9-6979-965f-f1cb80e73fca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-06-16 22:14, Patrick Doyle wrote:
> I know this is the wrong list, but folks who might know the answer to
> this like to hang out here, so I'll ask.
> 
> I have an Edison board which has been configured to use the usb0 network gadget.

 The Edison board that I know doesn't have a usb0 network gadget. Which
baseboard are you using?


> The problem is, I want to use this board as a USB host, and connect to
> it from my (buildroot generated rootfs based -- there, now you see the
> connection!) device.  And I want my device to show up as a usb0
> network device on the Edison board, the same way it does when I plug
> it into my Linux desktop.

 I guess that on your baseboard, the USB network interface can't be removed? So
when you plug in your other device, it becomes usb1? You can rename network
devices with udev rules (not sure about mdev) or with 'ip link set'.

 Regards,
 Arnout

> 
> Does anybody know how to change the usb0 network device from a USB
> "device" type of device to a USB "host" type of device?  Where should
> I start looking?
> 
> Thanks for any tips you can provide...
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
