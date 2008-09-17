From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 17 Sep 2008 11:23:42 -0400
Subject: [Buildroot] gadget uevents not detected by udevmonitor
In-Reply-To: <20080917145848.GA28475@cloud.net.au>
References: <2590773a0809131833r4fc274f0x43a442201b456200@mail.gmail.com>
	<20080917145848.GA28475@cloud.net.au>
Message-ID: <2590773a0809170823u5ce88838o374164162161f43b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Are you sure that the kernel even generates such events? My experience
> with the gadget subsystem is that it doesn't really integrate much with
> the rest of the system.
>
> I don't think buildroot can influence this.


After talking crawling through udc and gadget driver code, and more
importabtly talking with the USB maintainters, it turns out you are
correct; the gadget system does not immit uevents.

I'm talking with them now on the linux-usb list to see what it would
take to implement such a thing.  The problem is that it looks like
it'll be specific to the udc driver and whether the platform supports
vbus detections.  At least that's my current line of thinking.  We'll
see where we go with it as the maintainers chime in with their
suggestions.

-Chris
