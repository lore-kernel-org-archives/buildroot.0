From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 23:38:32 +0200
Subject: [Buildroot] USB interface as a USB CDCEther (Communications
 Device Class Ethernet)
In-Reply-To: <BY1PR0701MB1674D9AADA422080C4F6E419E6520@BY1PR0701MB1674.namprd07.prod.outlook.com>
References: <BY1PR0701MB1674C543022D2A35D29CA9FCE6520@BY1PR0701MB1674.namprd07.prod.outlook.com>
 <BY1PR0701MB1674D9AADA422080C4F6E419E6520@BY1PR0701MB1674.namprd07.prod.outlook.com>
Message-ID: <55F0A6D8.4040309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-09-15 20:49, Donahue, Bill wrote:
> Hi,
> 
> I am trying to set up the micro USB on my i.MX6 Rexboard to support Ethernet
> messages over USB.
> 
> I am using theLinux Kernel 4.1.4 and I have attached my config settings below.
> 
> I have the board plugged into my Linux laptop but I can?t see the USB listed in
> the /dev directory, how can I configure this?

 It's a network device, so no /dev node. You should have a network device called
usb0. Do 'ifconfig -a' to check if it appears. Then you can assign a static IP
address to both ends with ifconfig.


 Regards,
 Arnout

 PS This question is not really buildroot-related, obviously.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
