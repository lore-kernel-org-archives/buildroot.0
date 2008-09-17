From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 18 Sep 2008 00:58:49 +1000
Subject: [Buildroot] gadget uevents not detected by udevmonitor
In-Reply-To: <2590773a0809131833r4fc274f0x43a442201b456200@mail.gmail.com>
References: <2590773a0809131833r4fc274f0x43a442201b456200@mail.gmail.com>
Message-ID: <20080917145848.GA28475@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 13, 2008 at 09:33:32PM -0400, Christopher Taylor wrote:
> I'e configured hotplug and netlink sockets in my kernel 2.6.24 config file
> and I've insmoded g_serial.  When I run udevmonitor I'm not seeing uevents
> when I plug in the usb cable to the usb device port.  I am however getting
> the gadget serial messages:
> gs_disconnect: Gadget Serial disconnected
> gs_setup_complete: status error, status=0, actual-16, length=18
> gs_disconnect: Gadget Serial disconnected
> gs_set_config: gadget Serial configured, full speec CDC-ACM config
> 
> I'm 100% sure this is an error on my part when building everything, but I'm
> not sure where.
> 
> My whole intent here is to get uevents into my application via a netlink
> socket.  I have no intent of running udev, but I do intent on listening on
> that the netlink socket just like udev does so I can tell immediately when a
> usb event occurs.

Are you sure that the kernel even generates such events? My experience
with the gadget subsystem is that it doesn't really integrate much with
the rest of the system.

I don't think buildroot can influence this.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
