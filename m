From: Brent Sink <brents_3@hotmail.com>
Date: Mon, 20 Feb 2017 03:08:34 +0000
Subject: [Buildroot] No GPS data on ttymxc1 with busybox,
	but it works with systemd
Message-ID: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have GPS device that is connected to a uart port on my processor.  I have ttymxc0 which is the console output, and ttymxc1 which is the GPS interface.  I have build an image using buildroot that uses the busybox init system.  When I boot from this image and execute "cat /dev/ttymxc1", I see no output on the terminal and my gpsd service also sees nothing from the GPS receiver.

However, if I change my buildroot image to use the systemd init  system, and boot from this image, everything is working.  When I execute "cat /dev/ttymxc1" I see output from the GPS receiver.

I'm trying to minimize the boot time so I would like use the busybox init system since it boots quicker.  Any thoughts why I'm not seeing any output on the ttymxc1 port when using the busybox init system?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170220/1a9e1319/attachment.html>
