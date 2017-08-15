From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 11:45:19 +0200
Subject: [Buildroot] autodetection upon usb insertion.
In-Reply-To: <trinity-82be2f69-e0ba-492b-9616-3deb9c70a625-1502734167646@3c-app-mailcom-bs12>
References: <trinity-82be2f69-e0ba-492b-9616-3deb9c70a625-1502734167646@3c-app-mailcom-bs12>
Message-ID: <a4b760a7-8813-c55c-40d5-fe7e8d62ea66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 20:09, daggs wrote:
> Greetings,
> 
> I have a sysvinit based image with eudev which as a usb dongle connected to it.
> when I boot the system with the dongle connected, upon login, all them modules are loaded and the device is ready to use.
> but when I connected it when the system is already running, I get nothing. not detection even if I load all the drivers manually, it is still not detected.
> what am I missing?

 It's hard to say just like that, you'll probably have to do some kernel
debugging to solve it.

 I once had a similar issue with a buggy USB OTG driver that would go in
powerdown and therefore never detect insertion of a device. Strangely enough, if
you booted with something plugged in and then removed the device, it didn't go
in powerdown.

 Not saying your issue is similar, of course, but it's a possibility.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
