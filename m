From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 23:06:11 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <1341825748.43055.YahooMailNeo@web160701.mail.bf1.yahoo.com>
References: <1341825748.43055.YahooMailNeo@web160701.mail.bf1.yahoo.com>
Message-ID: <20120713230611.54db932d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 9 Jul 2012 02:22:28 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> As a newbie in?embedded linux world, I have many questions but for the 
> begininig those two.
> I'm trying to build XOrg, using Buildroot for my Mini2440 ARM board.
> Building passed Ok and when I login as root and type startx -
> I receive an error stating that there is no /dev/tty0 - which is true.
> I wonder, why udev didn't fill /dev node with tty entries.

Depending on your Buildroot configuration, udev may or may not be used.
In the default Buildroot configuration, udev is not used.

In menuconfig, look at the "System configuration" menu, it contains a
choice named "/dev management", which tells Buildroot how /dev should
be handled.

The default configuration is to use a static /dev, and from a quick
look to our device table, /dev/tty0 is created in this configuration.
So I'm a bit surprised. Could you post your Buildroot .config file?

> What I checked in menuconfig?is support for C++, large files, wchar.
> Then: ?modular XOrg, xf86-input-keyboard?, xf86-input-mouse,
> xf86-video-fbdev,? xf86-input-evdev, without window manager 
> (I think X should start even without?it).
> Also, if anyone can help how to change run level - inittab says that 
> Busybox init doesn't support run levels and instead to use sysvinit ?

Why do you need run levels? For most embedded systems, they are pretty
useless.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
