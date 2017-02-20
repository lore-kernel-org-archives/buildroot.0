From: Brent Sink <brents_3@hotmail.com>
Date: Mon, 20 Feb 2017 17:59:38 +0000
Subject: [Buildroot] No GPS data on ttymxc1 with busybox,
 but it works with systemd
In-Reply-To: <20170220095026.7150a532@free-electrons.com>
References: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>,
 <20170220095026.7150a532@free-electrons.com>
Message-ID: <BY2PR03MB31431BC964FD7F0A71C5021BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,

>
> Perhaps systemd is automatically initializing the serial ports to some
> given speed/configuration.
>
> Make sure you configure your serial port to the right
> speed/configuration using the "stty" program.

I did verify that the speed is set correctly and everything appears to be the same between the two images, so I'm not sure what else to check?  Here is the output from stty and setserial which is identical on both images:

# stty -F /dev/ttymxc1 speed
9600

# setserial -g /dev/ttymxc* -a
/dev/ttymxc1, Line 1, UART: undefined, Port: 0x0000, IRQ: 72
        Baud_base: 5000000, close_delay: 50, divisor: 0
        closing_wait: 3000
        Flags: spd_normal

One difference i noticed are the permissions.  On the busybox image (not working), it's permissions are:
# ls -l /dev/ttymxc1
crw--w----    1 root     root      207,  17 Jan  1 00:00 /dev/ttymxc1

...and on the systemd image (is working), it's permissions are:
# ls -l /dev/ttymxc1
crw-------    1 root     root      207,  17 Jan  1 00:00 /dev/ttymxc1

Anything else that I should check?

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com<http://free-electrons.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170220/6e969a22/attachment.html>
