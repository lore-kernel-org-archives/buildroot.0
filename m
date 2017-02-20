From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 09:50:26 +0100
Subject: [Buildroot] No GPS data on ttymxc1 with busybox,
 but it works with systemd
In-Reply-To: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
References: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
Message-ID: <20170220095026.7150a532@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 03:08:34 +0000, Brent Sink wrote:

> I have GPS device that is connected to a uart port on my processor.
> I have ttymxc0 which is the console output, and ttymxc1 which is the
> GPS interface.  I have build an image using buildroot that uses the
> busybox init system.  When I boot from this image and execute
> "cat /dev/ttymxc1", I see no output on the terminal and my gpsd
> service also sees nothing from the GPS receiver.
> 
> However, if I change my buildroot image to use the systemd init
> system, and boot from this image, everything is working.  When I
> execute "cat /dev/ttymxc1" I see output from the GPS receiver.
> 
> I'm trying to minimize the boot time so I would like use the busybox
> init system since it boots quicker.  Any thoughts why I'm not seeing
> any output on the ttymxc1 port when using the busybox init system?

Perhaps systemd is automatically initializing the serial ports to some
given speed/configuration.

Make sure you configure your serial port to the right
speed/configuration using the "stty" program.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
